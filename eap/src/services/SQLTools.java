package services;

import com.oracle.xmlns.internal.webservices.jaxws_databinding.SoapBindingParameterStyle;
import food.Ingredient;
import food.Local;
import food.Produs;
import order.Comanda;
import order.User;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SQLTools {
    private final String MySQL = "jdbc:mysql://localhost:3306/proiect_java?useSSL=false";
    private final String userName = "root";
    private final String password = "java123";
    private final Connection con = DriverManager.getConnection(MySQL, userName, password);

    public SQLTools() throws SQLException {
    }

    public void insertUser(User user){
        String query = "insert into user (username, nume, prenume, nr_telefon, adresa) values";
        query += " ('" + user.getUsername() + "', '" + user.getNume() + "', '" + user.getPrenume() +
                "', '" + user.getNrTelefon() + "', '" + user.getAdresa() + "');";
        try {
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.execute("commit");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insertFirmaLivrare(String denumire){
        String query = "insert into firma_livrare (denumire) value" + "('" + denumire + "');";
        try {
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.execute("commit");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insertLocal(Local local){
        String query = "insert into local (denumire_local, adresa, oras) VALUES "
                + "('" + local.getDenumire() + "', '"+ local.getStrada() + "', '" +
        local.getOras() + "');";
        try {
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.execute("commit");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insertIngredient(String denumire_ingredient){
        String query = "insert into ingredient (denumire_ingredient) value ('" +
                denumire_ingredient + "');";
        try {
            Statement stmt = con.createStatement();
            stmt.execute(query);
            stmt.execute("commit");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertProdus(String localName, Produs produs) {
        String getLocalID = "select local_id from Local where lower(denumire_local)" +
                "like lower('" + localName + "')";
        String query = "insert into produs (local_id, denumire_produs, pret) VALUES"
                + " ((" + getLocalID + "), '" + produs.getDenumire() + "', " +
                produs.getPret() + ");";
        try {
            Statement stmt = con.createStatement();
            stmt.execute(query);
            for (Ingredient i :
                    produs.getIngrediente()) {
                String getProdusID = "select produs_id from produs where lower(denumire_produs) like" +
                        " lower('" + produs.getDenumire() + "')";
                query = "insert into alocare (produs_id, ingredient, cantitate) VALUES " +
                        " ((" + getProdusID + "), '" + i.getDenumire() + "'," + i.getCantitate()
                        + ");";
                stmt.execute(query);
            }
            stmt.execute("commit");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertComanda(Comanda comanda){
        String query = "insert into comanda (username, denumire_local, firma_livrare, pret) VALUES"
                + " ('" + comanda.getUsername() + "', '" + comanda.getLocal() + "', 'FoodPanda', " +
                comanda.getPret() + ");";
        try {
            Statement stmt = con.createStatement();
            stmt.execute(query);
            for (Produs produs :
                    comanda.getProduse()) {
                query = "insert into lista_cumparaturi (comanda_id, produs_id) " +
                        "values ((select comanda_id from comanda order by comanda_id desc limit 1)," +
                        "(select produs_id from produs where lower(denumire_produs) like lower('"
                        + produs.getDenumire() +"')))";
                stmt.execute(query);
            }
            stmt.execute("commit");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void selectComenzi(){
        String query = "select * from comanda";
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()){
                String nebunie = res.getString("denumire_produs");
                System.out.println(nebunie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Local> readRestaurantsSQL() throws InstantiationException, IllegalAccessException {
        ArrayList<Local> localuri = new ArrayList<>();
        Local bufferLocal = Singleton.getInstance(Local.class);
        Produs bufferProdus = Singleton.getInstance(Produs.class);
        Ingredient ing = Singleton.getInstance(Ingredient.class);
        try {
            Statement stmt = con.createStatement();
            ResultSet resLocal = stmt.executeQuery("select l.denumire_local, l.adresa, l.oras, " +
                    "p.denumire_produs, p.pret, i.denumire_ingredient, a.cantitate " +
                    "from local l join produs p using(local_id) join alocare a using(produs_id) " +
                    "join ingredient i on a.ingredient = i.denumire_ingredient;");
            boolean OK = false;
            boolean OK2 = false;
            String denumireAnt = "";
            String denumireAntProd = "";
            List<Produs> produse = new ArrayList<Produs>();
            List<Ingredient> ingrediente = new ArrayList<>();
            while (resLocal.next()){
                if (OK == false) {
                    bufferLocal.setDenumire(resLocal.getString("denumire_local"));
                    bufferLocal.setStrada(resLocal.getString("adresa"));
                    bufferLocal.setOras(resLocal.getString("oras"));
                    denumireAnt = resLocal.getString("denumire_local");
                    OK = true;
                }
                else if(OK == true && !(resLocal.getString("denumire_local").equals(denumireAnt))) {
                    bufferProdus.setIngrediente(ingrediente);
                    produse.add(new Produs(bufferProdus));
                    bufferLocal.setListaProduse(produse);
                    localuri.add(new Local(bufferLocal));
                    produse = new ArrayList<Produs>();
                    ingrediente = new ArrayList<>();
                    OK2 = false;
                    bufferLocal.setDenumire(resLocal.getString("denumire_local"));
                    bufferLocal.setStrada(resLocal.getString("adresa"));
                    bufferLocal.setOras(resLocal.getString("oras"));
                    denumireAnt = resLocal.getString("denumire_local");
                }
                if(OK2 == false){
                    bufferProdus.setDenumire(resLocal.getString("denumire_produs"));
                    bufferProdus.setPret(resLocal.getFloat("pret"));
                    ingrediente = new ArrayList<>();
                    denumireAntProd = resLocal.getString("denumire_produs");
                    OK2 = true;
                }
                else if(OK2 == true && !(resLocal.getString("denumire_produs").equals(denumireAntProd))) {
                    bufferProdus.setIngrediente(ingrediente);
                    produse.add(new Produs(bufferProdus));
                    bufferProdus.setDenumire(resLocal.getString("denumire_produs"));
                    bufferProdus.setPret(resLocal.getFloat("pret"));
                    ingrediente = new ArrayList<>();
                    denumireAntProd = resLocal.getString("denumire_produs");
                }
                ing.setDenumire(resLocal.getString("denumire_ingredient"));
                ing.setCantitate(resLocal.getFloat("cantitate"));
                ingrediente.add(new Ingredient(ing));
            }
            bufferProdus.setIngrediente(ingrediente);
            produse.add(new Produs(bufferProdus));
            bufferLocal.setListaProduse(produse);
            localuri.add(bufferLocal);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return localuri;
    }

    public ArrayList<User> readUsersSQL() throws InstantiationException, IllegalAccessException{
        ArrayList<User> useri = new ArrayList<>();
        User userBuffer = Singleton.getInstance(User.class);
        Statement stmt = null;
        try {
            stmt = con.createStatement();
            ResultSet resLocal = stmt.executeQuery("select * from user");
            while (resLocal.next()){
                userBuffer.setNume(resLocal.getString("nume"));
                userBuffer.setPrenume(resLocal.getString("prenume"));
                userBuffer.setNrTelefon(resLocal.getString("nr_telefon"));
                userBuffer.setUsername(resLocal.getString("username"));
                userBuffer.setAdresa(resLocal.getString("adresa"));
                useri.add(new User(userBuffer));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return useri;
    }

    public void selectProductsFromLocal(Local local){
        String query = "select * from produs where local_id = " +
                "(select local_id from local where lower(denumire_local)" +
                "like lower('" + local.getDenumire() + "'))";
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()){
                System.out.println("Denumire produs: " + res.getString("denumire_produs"));
                System.out.println("Pret: " + res.getFloat("pret"));
                System.out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void modifyProduct(String denumireProdus){
        System.out.println("Produsul are urmatoarele specificatii: ");
        String query = "select * from produs where lower(denumire_produs) " +
                "like lower('" + denumireProdus + "');";
        try {
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);
            int produsID = 0;
            while (res.next()){
                System.out.println("Pret: " + res.getFloat("pret"));
                produsID = res.getInt("produs_id");
            }
            query = "select ingredient, cantitate from alocare where produs_id = "
                    + produsID;
            res = stmt.executeQuery(query);
            while (res.next()){
                System.out.println("Ingredient: " + res.getString("ingredient")
                + ", Cantitate: " + res.getString("cantitate"));
            }
            System.out.println();
            System.out.println("Ce vrei sa modifici? (P - pretul, I - ingredientele)");
            Scanner scanner = new Scanner(System.in);
            String choice = scanner.next();
            if(choice.equalsIgnoreCase("P")){
                System.out.println("Noul pret: ");
                float noulPret = scanner.nextFloat();
                query = "update produs set pret = " + noulPret +
                        " where produs_id = " + produsID + ";";
                stmt.execute(query);
                System.out.println("Operatie realizata cu succes!");
            }
            else if(choice.equalsIgnoreCase("I")){
                System.out.println("Ce ingredient vrei sa stergi?: ");
                choice = scanner.next();

                query = "delete from alocare where lower(ingredient) like lower('"+choice+"');" +
                        "and produs_id = " + produsID + ";";
                stmt.execute(query);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
