package food;

import java.util.ArrayList;
import java.util.List;

public class Local {
    private String denumire;
    private String strada;
    private String oras;
    private List<Produs> listaProduse = new ArrayList<Produs>();

    public Local() {
    }

    public Local(String denumire, String strada, String oras) {
        this.denumire = denumire;
        this.strada = strada;
        this.oras = oras;
    }

    public Local(Local local) {
        this.denumire = local.denumire;
        this.strada = local.strada;
        this.oras = local.oras;
        this.listaProduse = local.listaProduse;
    }

    public String getDenumire() {
        return denumire;
    }

    public void setDenumire(String denumire) {
        this.denumire = denumire;
    }

    public String getStrada() {
        return strada;
    }

    public void setStrada(String strada) {
        this.strada = strada;
    }

    public String getOras() {
        return oras;
    }

    public void setOras(String oras) {
        this.oras = oras;
    }

    public List<Produs> getListaProduse() {
        return listaProduse;
    }

    public void setListaProduse(List<Produs> listaProduse) {
        this.listaProduse = listaProduse;
    }

    public void addProdus(Produs p){
        listaProduse.add(p);
    }


}
