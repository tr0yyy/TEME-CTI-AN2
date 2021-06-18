package courier;

import java.util.SortedSet;
import java.util.TreeSet;

public class FirmaLivrare {
    private static Integer countFirmeLivrari = 0;
    private String denumire;
    private Integer idLivrator;
    private SortedSet<Curier> curieri = new TreeSet<>();

    public FirmaLivrare() {
        countFirmeLivrari++;
        idLivrator = countFirmeLivrari;
    }



    public FirmaLivrare(String denumire) {
        this.denumire = denumire;
        countFirmeLivrari++;
        idLivrator = countFirmeLivrari;
    }

    public Integer getIdLivrator() {
        return idLivrator;
    }

    public String getDenumire() {
        return denumire;
    }

    public void setDenumire(String denumire) {
        this.denumire = denumire;
    }

    public void addCurier(Curier c){
        c.setIdLivrator(idLivrator);
        curieri.add(c);
    }

    public SortedSet<Curier> getCurieri() {
        return curieri;
    }
}
