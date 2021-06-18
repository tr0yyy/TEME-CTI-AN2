package services;

import courier.Curier;
import courier.FirmaLivrare;
import courier.Masina;
import food.Ingredient;
import food.Local;
import food.Produs;
import order.Comanda;
import order.User;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/// ETAPA 2 - CITIRE SI SCRIERE IN FISIER FOLOSIND SINGLETON GENERIC
/// ETAPA 2 - SERVICIU DE AUDIT
public class CSVTools {
    public ArrayList<Local> readRestaurants(List<String> fisiereLocaluri) throws InstantiationException, IllegalAccessException{
        ArrayList<Local> localuri = new ArrayList<>();
        Local bufferLocal = Singleton.getInstance(Local.class);
        Produs bufferProdus = Singleton.getInstance(Produs.class);
        Ingredient ing = Singleton.getInstance(Ingredient.class);
        File localFileInfo = new File("src/food/localuri.csv");
        Scanner scannerInfo = null;
        try {
            scannerInfo = new Scanner(localFileInfo);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.exit(0);
        }
        ArrayList<String[]> localuriInfo = new ArrayList<>();
        String dataFileInfo = scannerInfo.nextLine();
        while(scannerInfo.hasNextLine()){
            dataFileInfo = scannerInfo.nextLine();
            String[] localSplitted = dataFileInfo.split(",");
            localuriInfo.add(localSplitted);
        }
        int k = -1;
        for (String file:
             fisiereLocaluri) {
            k++;
            try {
                File myFile = new File(file);
                Scanner scanner = new Scanner(myFile);
                /// initializare date de baza
                String data = scanner.nextLine();
                String[] infoR = data.split(",");
                bufferLocal.setDenumire(localuriInfo.get(k)[0]);
                bufferLocal.setStrada(localuriInfo.get(k)[1]);
                bufferLocal.setOras(localuriInfo.get(k)[2]);
                List<Produs> produse = new ArrayList<Produs>();
                while (scanner.hasNextLine()) {
                    data = scanner.nextLine();
                    String[] infoProd = data.split(",");
                    bufferProdus.setDenumire(infoProd[0]);
                    bufferProdus.setPret(Float.parseFloat(infoProd[1]));
                    List<Ingredient> ingrediente = new ArrayList<>();
                    for(int i = 2 ; i < infoProd.length ; i+=2){
                        ing.setDenumire(infoProd[i]);
                        ing.setCantitate(Float.parseFloat(infoProd[i+1]));
                        ingrediente.add(new Ingredient(ing));
                    }
                    bufferProdus.setIngrediente(ingrediente);
                    produse.add(new Produs(bufferProdus));
                }
                bufferLocal.setListaProduse(produse);
                scanner.close();
                localuri.add(new Local(bufferLocal));
            } catch (FileNotFoundException e) {
                System.out.println("Lipseste fisierul de citire!");
                e.printStackTrace();
                System.exit(0);
            }
        }
        return localuri;
    }
    public ArrayList<User> readUsers(String filePath) throws InstantiationException, IllegalAccessException{
        ArrayList<User> useri = new ArrayList<>();
        User userBuffer = Singleton.getInstance(User.class);
        try {
            File my_file = new File(filePath);
            Scanner scanner = new Scanner(my_file);
            String data = scanner.nextLine();
            while (scanner.hasNextLine()) {
                data = scanner.nextLine();
                String[] infoProd = data.split(",");
                userBuffer.setNume(infoProd[0]);
                userBuffer.setPrenume(infoProd[1]);
                userBuffer.setNrTelefon(infoProd[2]);
                userBuffer.setUsername(infoProd[3]);
                userBuffer.setAdresa(infoProd[4]);
                useri.add(new User(userBuffer));
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Lipseste fisierul de citire!");
            e.printStackTrace();
            System.exit(0);
        }
        return useri;
    }
    public FirmaLivrare readFirmaLivrare(String filePath, String denumire) throws InstantiationException, IllegalAccessException {
        FirmaLivrare firmaLivrare = new FirmaLivrare();
        Masina masinaBuffer = Singleton.getInstance(Masina.class);
        Curier curierBuffer = Singleton.getInstance(Curier.class);
        try {
            File my_file = new File(filePath);
            Scanner scanner = new Scanner(my_file);
            String data = scanner.nextLine();
            while (scanner.hasNextLine()) {
                data = scanner.nextLine();
                String[] curier = data.split(",");
                String nume = curier[0];
                String prenume = curier[1];
                String telefon = curier[2];
                String marca = curier[3];
                String model = curier[4];
                String nr_inm = curier[5];
                masinaBuffer.setMarca(marca);
                masinaBuffer.setModel(model);
                masinaBuffer.setNrInmatriculare(nr_inm);
                curierBuffer.setNume(nume);
                curierBuffer.setPrenume(prenume);
                curierBuffer.setNrTelefon(telefon);
                curierBuffer.setCar(new Masina(masinaBuffer));
                curierBuffer.setIdLivrator(firmaLivrare.getIdLivrator());
                firmaLivrare.setDenumire(denumire);
                firmaLivrare.addCurier(new Curier(curierBuffer));
            }
            scanner.close();

        } catch (FileNotFoundException e) {
            System.out.println("Lipseste fisierul de citire!");
            e.printStackTrace();
            System.exit(0);
        }
        return firmaLivrare;
    }


    public void writeOrderToFile(Comanda c, String filePath) throws InstantiationException, IllegalAccessException, IOException {
        File verif = new File(filePath);
        boolean exists = verif.isFile();
        Comanda cache = Singleton.getInstance(Comanda.class);
        cache.setUsername(c.getUsername());
        cache.setLocal(c.getLocal());
        cache.setPret(c.getPret());
        cache.setIDFirmaLivrare(c.getIDFirmaLivrare());
        cache.setIDComanda(c.getIDComanda());
        FileWriter fw = new FileWriter(filePath, true);
        BufferedWriter bw = new BufferedWriter(fw);
        PrintWriter out = new PrintWriter(bw);
        if(!exists){
            out.println("ID Comanda,Username,Local,ID Firma Livrare,Pret");
            /// aici scriu headerul
        }
        out.println(cache.getIDComanda()+","+cache.getUsername()+","+cache.getLocal()+","+cache.getIDFirmaLivrare()+","+cache.getPret());
        out.close();
    }

    public void auditComanda(String filePath, Comanda c) throws IOException {
        File verif = new File(filePath);
        boolean exists = verif.isFile();
        /// fac aceasta verificare in cazul in care nu exista fisierul audit.csv
        /// pentru a scrie headerul fisierului csv
        FileWriter fw = new FileWriter(filePath, true);
        BufferedWriter bw = new BufferedWriter(fw);
        PrintWriter out = new PrintWriter(bw);
        if(!exists){
            out.println("nume_actiune,timestamp");
            /// aici scriu headerul
        }
        /// aici scriu informatiile despre actiunea de plasare comanda in fisierul csv
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String strDate = dateFormat.format(date);
        out.println("PLASARE COMANDA LOCAL " + c.getLocal() + " DE CATRE USER " + c.getUsername() + "," + strDate);
        out.close();
    }
}
