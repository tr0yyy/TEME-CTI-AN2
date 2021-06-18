package order;

import food.Produs;

import java.util.*;

public class Comanda {
    private static int nrComenzi = 0;
    private Integer idComanda;
    private String username;
    private String local;
    private Integer IDFirmaLivrare;
    private Float pret = 0.0f;
    private List<Produs> produse = new ArrayList<>();



    public Comanda(String username, String local, Integer IDFirmaLivrare) {
        nrComenzi++;
        this.idComanda = nrComenzi;
        this.username = username;
        this.local = local;
        this.IDFirmaLivrare = IDFirmaLivrare;
    }

    public Comanda() {
        nrComenzi++;
        this.idComanda = nrComenzi;
    }

    public void setIDComanda(Integer IDComanda) {
        this.idComanda = IDComanda;
    }

    public Integer getIDComanda() {
        return idComanda;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public Integer getIDFirmaLivrare() {
        return IDFirmaLivrare;
    }

    public void setIDFirmaLivrare(Integer IDFirmaLivrare) {
        this.IDFirmaLivrare = IDFirmaLivrare;
    }

    public Float getPret() {
        return pret;
    }

    public void setPret(Float pret) {
        this.pret = pret;
    }

    public List<Produs> getProduse() {
        return produse;
    }

    public void setProduse(List<Produs> produse) {
        this.produse = produse;
    }

    public void addProduse(Produs p){
        produse.add(p);
        pret = pret + p.getPret();
    }

    @Override
    public String toString() {
        return "Comanda{" +
                "ID_comanda=" + idComanda +
                ", username='" + username + '\'' +
                ", local='" + local + '\'' +
                ", ID_firma_livrare=" + IDFirmaLivrare +
                ", pret=" + pret +
                ", produse=" + produse +
                '}';
    }
}
