package services;

import courier.Curier;
import courier.FirmaLivrare;
import courier.Masina;
import food.Ingredient;
import food.Local;
import food.Produs;
import order.Comanda;
import order.Review;
import order.User;

import java.io.*;
import java.sql.SQLException;
import java.util.*;

public class Serviciu {
    public Serviciu(){
    }

    private void initMeniu(){
        System.out.println("--------------------NICOI ALEXANDRU // GRUPA 253 // ELEMENTE AVANSATE DE PROGRAMARE--------------------");
        System.out.println("-----------------------FOOD DELIVERY - ETAPA 3-----------------------");
        System.out.println("-----------Pentru a utiliza o functie a meniului, tastati numarul corespunzator functiei alese-------------");
        System.out.println();
        System.out.println("1. Adaugare curier in cadrul companiei de livrari.");
        System.out.println("2*. Listare produse specifice unui local din baza de date MySQL.");
        System.out.println("3. Listare ingrediente dintr-un produs.");
        System.out.println("4*. Plasare comanda si scriere in BD.");
        System.out.println("5. Adaugare review asupra comenzii.");
        System.out.println("6*. Adaugare User care va folosi platforma in BD.");
        System.out.println("7. Listare comenzi plasate de catre un anumit user.");
        System.out.println("8. Cautare un anumit produs in mai multe localuri.");
        System.out.println("9. Cautare local in functie de oras.");
        System.out.println("10*. Modificare produse (modifica pretul / sterge ingredient) din BD.");
        System.out.println("0. Iesire.");
    }

    public void executeServices() throws InstantiationException, IllegalAccessException, SQLException, FileNotFoundException {
        ArrayList<String> fisiereLocaluri = new ArrayList<>();
        fisiereLocaluri.add("src/food/mcdonalds.csv");
        fisiereLocaluri.add("src/food/kfc.csv");
        fisiereLocaluri.add("src/food/hercule.csv");
        CSVTools myCSVTool = new CSVTools();
        SQLTools mySQLTool = new SQLTools();
        ArrayList<Local> localuri = mySQLTool.readRestaurantsSQL();
        ArrayList<User> useri = mySQLTool.readUsersSQL();
        //ReadFromCSV.ReadUsers();
        /// init data entries
        FirmaLivrare foodpanda = myCSVTool.readFirmaLivrare("src/courier/foodpanda.csv","FoodPanda");
        List<Comanda> comenzi = new ArrayList<>();
        List<Review> reviews = new ArrayList<>();

        File my_file = new File("src/checker.txt");
        Scanner scannerFile = new Scanner(my_file);
        String data = scannerFile.nextLine();
        /// Initializare baza de date - daca nu este creata
        if(data.equals("FALSE")){
            Set<String> setOfIngredients = new HashSet<String>();
            for (Local local :
                    localuri) {
                for (Produs produs :
                        local.getListaProduse()) {
                    for (Ingredient i :
                            produs.getIngrediente()) {
                        setOfIngredients.add(i.getDenumire());
                    }
                }
            }
            for (String denumire_ingredient :
                    setOfIngredients) {
                mySQLTool.insertIngredient(denumire_ingredient);
            }
            for (Local local :
                    localuri) {
                mySQLTool.insertLocal(local);
                for (Produs produs :
                        local.getListaProduse()) {
                    mySQLTool.insertProdus(local.getDenumire(), produs);
                }
            }
            mySQLTool.insertFirmaLivrare("Foodpanda");
            for (User user :
                    useri) {
                mySQLTool.insertUser(user);
            }
            FileWriter fw = null;
            try {
                fw = new FileWriter("src/checker.txt");
            } catch (IOException e) {
                e.printStackTrace();
            }
            BufferedWriter bw = new BufferedWriter(fw);
            PrintWriter out = new PrintWriter(bw);
            out.write("TRUE");
            out.close();
        }
        Scanner scanner = new Scanner(System.in);
        int opt;
        initMeniu();
        do {
            System.out.println("\n");
            System.out.println("Optiunea aleasa: ");
            opt = scanner.nextInt();
            switch (opt)
            {
                case 1:
                    adaugareCurier(foodpanda);
                    System.out.println("Curier adaugat");
                    break;
                case 2:
                    boolean OK = false;
                    System.out.println("Selecteaza localul:");
                    String localStr = scanner.next();
                    for (Local local:
                            localuri) {
                        if(local.getDenumire().equalsIgnoreCase(localStr))
                        {
                            mySQLTool.selectProductsFromLocal(local);
                            OK = true;
                            break;
                        }
                    }
                    if(!OK)
                        System.out.println("Localul nu exista!");
                    break;
                case 3:
                    OK = false;
                    System.out.println("Selecteaza produsul:");
                    String produsStr = scanner.next();
                    for (Local local :
                            localuri) {
                        for (Produs produs :
                                local.getListaProduse()) {
                            if(produsStr.equalsIgnoreCase(produs.getDenumire())){
                                OK = true;
                                listareIngrediente(produs);
                                break;
                            }
                        }
                    }
                    if(!OK)
                        System.out.println("Produsul nu exista!");
                    break;
                case 4:
                    Comanda c = plasareComanda(localuri,useri);
                    try {
                        File myFile = new File("src/comenzi.csv");
                        if(myFile.exists())
                            if(!myFile.delete())
                            {
                                System.out.println("Fisierul este de tip Read-Only!");
                                break;
                            }
                        mySQLTool.insertComanda(c);
                        myCSVTool.writeOrderToFile(c, "src/comenzi.csv");
                        myCSVTool.auditComanda("src/audit.csv", c);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    comenzi.add(c);
                    break;
                case 5:
                    OK = false;
                    System.out.println("Ce ID are comanda dvs? ");
                    Integer idComanda = scanner.nextInt();
                    for (Comanda comanda :
                            comenzi) {
                        if(comanda.getIDComanda().equals(idComanda)){
                            OK = true;
                            addReview(comanda);
                            break;
                        }
                    }
                    if(!OK)
                        System.out.println("Comanda nu exista!");
                    break;
                case 6:
                    User newUser = addUser();
                    useri.add(newUser);
                    mySQLTool.insertUser(newUser);
                    System.out.println("User adaugat!");
                    break;
                case 7:
                    System.out.println("Username: ");
                    scanner.useDelimiter("\n");
                    String choice = scanner.next();
                    scanner.reset();
                    searchAllOrders(choice, comenzi);
                    break;
                case 8:
                    System.out.println("Denumire produs: ");
                    scanner.useDelimiter("\n");
                    choice = scanner.next();
                    scanner.reset();
                    Produs myProdus = searchProduct(choice, localuri);
                    break;
                case 9:
                    System.out.println("Denumire oras: ");
                    scanner.useDelimiter("\n");
                    choice = scanner.next();
                    scanner.reset();
                    Local myLocal = searchLocal(choice, localuri);
                    break;
                case 10:
                    System.out.println("Ce produs vrei sa modifici: ");
                    choice = scanner.next();

                    mySQLTool.modifyProduct(choice);
                    break;
                case 0:
                    System.exit(0);
                    break;
                default:
                    System.out.println("OPTIUNE INVALIDA!");
            }
        }while(opt != 0);
    }

    private void adaugareCurier(FirmaLivrare self){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nume: ");
        String nume = scanner.next();
        System.out.print("Prenume: ");
        String prenume = scanner.next();
        System.out.print("Nr telefon: ");
        String nrTel = scanner.next();
        System.out.print("Marca: ");
        String marca = scanner.next();
        System.out.print("Model: ");
        String model = scanner.next();
        System.out.print("Nr inmatriculare: ");
        String nrInm = scanner.next();
        Masina m = new Masina(marca, model, nrInm);
        Curier c = new Curier(nume, prenume, nrTel, m);
        c.setIdLivrator(self.getIdLivrator());
        self.addCurier(c);
    }
    private void listareIngrediente(Produs self){
        List<Ingredient> ingrediente = self.getIngrediente();
        for(Ingredient ingredient : ingrediente)
            System.out.println(ingredient);
    }
    private Comanda plasareComanda(ArrayList<Local> localuri, ArrayList<User> useri){
        Comanda c = new Comanda();
        Scanner scanner = new Scanner(System.in);
        boolean OKUser = false;
        String username = "";
        while(!OKUser){
            System.out.print("Username: ");
            username = scanner.next();
            for (User user : useri)
                if(username.equalsIgnoreCase(user.getUsername())){
                    OKUser = true;
                    break;}
            if(!OKUser)
                System.out.println("Username negasit in baza de date de useri!");}
        System.out.print("Local: ");
        String local = scanner.next();
        System.out.print("ID Firma livrare: ");
        Integer idFirma = scanner.nextInt();
        Float pret = 0.f;
        boolean OK = false;
        for (Local myLocal :
                localuri) {
            if (local.equalsIgnoreCase(myLocal.getDenumire())) {
                OK = true;
                System.out.println("Aici aveti produsele disponibile: ");
                List<Produs> produse = myLocal.getListaProduse();
                for(Produs produs : produse)
                    System.out.println(produs);
                while (true) {
                    System.out.println("Alegeti un produs:");
                    scanner.useDelimiter("\n");
                    String choice = scanner.next();
                    scanner.reset();
                    boolean OKProdus = false;
                    for (Produs p :
                            myLocal.getListaProduse()){
                        if (choice.equalsIgnoreCase(p.getDenumire())) {
                            c.addProduse(p);
                            pret += p.getPret();
                            OKProdus = true;
                        }
                        if(OKProdus)
                            break;
                    }
                    if(!OKProdus)
                        System.out.println("Produsul nu se afla in lista localului! Doriti sa cautati alt produs? Y/N");
                    else
                        System.out.println("Doriti sa cautati alt produs? Y/N");
                    scanner.useDelimiter("\n");
                    choice = scanner.next();
                    scanner.reset();
                    if (!choice.equals("Y"))
                        break;
                }
            }
            if(OK)
                break;
        }
        c.setUsername(username);
        c.setLocal(local);
        c.setPret(pret);
        c.setIDFirmaLivrare(idFirma);
        System.out.println("PRET FINAL COMANDA: " + c.getPret());
        return c;
    }
    private Review addReview(Comanda c){
        Review myRev = new Review();
        myRev.setUsername(c.getUsername());
        myRev.setIdComanda(c.getIDComanda());
        Scanner scanner = new Scanner(System.in);
        System.out.println("Scrie review-ul (mesajul se va termina la enter): ");
        scanner.useDelimiter("\n");
        String reviewStr = scanner.next();
        myRev.setRecenzie(reviewStr);
        scanner.reset();
        System.out.println("Cate stele oferi?");
        Integer stele = scanner.nextInt();
        myRev.setStele(stele);
        return myRev;
    }
    private User addUser(){
        //String nume, String prenume, String nr_telefon, String username, String adresa
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nume: ");
        String nume = scanner.next();
        System.out.print("Prenume: ");
        String prenume = scanner.next();
        System.out.print("Nr telefon: ");
        String nrTel = scanner.next();
        System.out.print("Username: ");
        String username = scanner.next();
        System.out.print("Adresa: ");
        scanner.useDelimiter("\n");
        String adresa = scanner.next();
        scanner.reset();
        return new User(nume,prenume,nrTel,username,adresa);
    }
    /// Dau localuri ca parametru deoarece vectorul de localuri este preluat din metoda executeServices()
    private Produs searchProduct(String denumireProdus, ArrayList<Local> localuri){
        boolean OK = false;
        for (Local local :
                localuri) {
            List<Produs> produseLocal = local.getListaProduse();
            for (Produs produs :
                    produseLocal) {
                if(produs.getDenumire().equalsIgnoreCase(denumireProdus)) {
                    System.out.println("PRODUS GASIT IN LOCALUL " + local.getDenumire());
                    return produs;
                }
            }
        }
        System.out.println("PRODUSUL NU A FOST GASIT IN NICIUN LOCAL!");
        return null;
    }
    /// Dau localuri ca parametru deoarece vectorul de localuri este preluat din metoda executeServices()
    private Local searchLocal(String oras, ArrayList<Local> localuri){
        for (Local local :
                localuri) {
            if (local.getOras().equalsIgnoreCase(oras)){
                System.out.println(local.getDenumire() + " ");
                return local;
            }
        }
        System.out.println("Nu exista niciun local in orasul " + oras);
        return null;
    }
    private void searchAllOrders(String username, List<Comanda> comenzi){
        boolean OK = false;
        for (Comanda comanda :
                comenzi) {
            if(comanda.getUsername().equalsIgnoreCase(username)) {
                System.out.println(comanda);
                OK = true;
            }
        }
        if(!OK)
            System.out.println("Userul " + username + " nu a realizat nicio comanda");
    }




}
