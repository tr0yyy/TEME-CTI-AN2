package food;

import java.util.ArrayList;
import java.util.List;

public class Produs {
    private String denumire;
    private Float pret;
    private List<Ingredient> ingrediente = new ArrayList<Ingredient>();

    public Produs() {
    }

    public Produs(String denumire, Float pret, List<Ingredient> ingrediente) {
        this.denumire = denumire;
        this.pret = pret;
        this.ingrediente = ingrediente;
    }

    public Produs(Produs produs) {
        this.denumire = produs.denumire;
        this.pret = produs.pret;
        this.ingrediente = produs.ingrediente;
    }

    public String getDenumire() {
        return denumire;
    }

    public void setDenumire(String denumire) {
        this.denumire = denumire;
    }

    public Float getPret() {
        return pret;
    }

    public void setPret(Float pret) {
        this.pret = pret;
    }

    public List<Ingredient> getIngrediente() {
        return ingrediente;
    }

    public void setIngrediente(List<Ingredient> ingrediente) {
        this.ingrediente = ingrediente;
    }

    public void addIngredient(Ingredient i){
        ingrediente.add(i);
    }


    @Override
    public String toString() {
        return "Denumire produs: " + denumire + "\nPret: " + pret + "\nIngrediente: \n" + ingrediente;
    }
}
