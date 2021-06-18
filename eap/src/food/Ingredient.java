package food;

public class Ingredient {
    private String denumire;
    private Float cantitate;

    public Ingredient() {
    }

    public Ingredient(String denumire, Float cantitate) {
        this.denumire = denumire;
        this.cantitate = cantitate;
    }

    public Ingredient(Ingredient ing) {
        this.denumire = ing.denumire;
        this.cantitate = ing.cantitate;
    }

    public String getDenumire() {
        return denumire;
    }

    public void setDenumire(String denumire) {
        this.denumire = denumire;
    }

    public float getCantitate() {
        return cantitate;
    }

    public void setCantitate(Float cantitate) {
        this.cantitate = cantitate;
    }


    @Override
    public String toString() {
        return "Denumire: " + denumire + ", Cantitate: " + cantitate + "\n";
    }
}
