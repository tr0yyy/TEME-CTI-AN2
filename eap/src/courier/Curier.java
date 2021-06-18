package courier;

import person.Persoana;

public class Curier extends Persoana{
    private Integer idLivrator = 0;
    private Masina car;

    public Curier() {
    }

    public Curier(String nume, String prenume, String nr_telefon, Masina car) {
        super(nume, prenume, nr_telefon);
        this.car = car;
    }

    public Curier(Curier curier) {
        super(curier);
        this.idLivrator = curier.idLivrator;
        this.car = curier.car;
    }

    public Integer getIdLivrator() {
        return idLivrator;
    }

    public void setIdLivrator(Integer idLivrator) {
        this.idLivrator = idLivrator;
    }

    public Masina getCar() {
        return car;
    }

    public void setCar(Masina car) {
        this.car = car;
    }

    @Override
    public String toString() {
        return "ID Firma Livrare " + idLivrator + '\n' +
                "Nume " + nume + '\n' +
                "Prenume " + prenume + '\n' +
                "Numar telefon " + nrTelefon + '\n' +
                "Masina " + car + '\n';
    }

}
