package courier;

public class Masina {
    private String marca;
    private String model;
    private String nrInmatriculare;

    public Masina() {
    }

    public Masina(Masina masina) {
        marca = masina.marca;
        model = masina.model;
        nrInmatriculare = masina.nrInmatriculare;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setNrInmatriculare(String nrInmatriculare) {
        this.nrInmatriculare = nrInmatriculare;
    }

    public Masina(String marca, String model, String nrInmatriculare) {
        this.marca = marca;
        this.model = model;
        this.nrInmatriculare = nrInmatriculare;
    }

    public String getMarca() {
        return marca;
    }

    public String getModel() {
        return model;
    }

    public String getNrInmatriculare() {
        return nrInmatriculare;
    }

    @Override
    public String toString() {
        return
                "marca '" + marca + '\'' +
                ", model '" + model + '\'' +
                ", nr_inmatriculare '" + nrInmatriculare + '\'';
    }
}
