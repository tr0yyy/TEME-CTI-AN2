package person;

public class Persoana implements Comparable<Persoana> {
    protected String nume;
    protected String prenume;
    protected String nrTelefon;

    public Persoana(){
    }

    public Persoana(String nume, String prenume, String nrTelefon){
        this.nume = nume;
        this.prenume = prenume;
        this.nrTelefon = nrTelefon;
    }

    public Persoana(Persoana persoana) {
        this.nume = persoana.nume;
        this.prenume = persoana.prenume;
        this.nrTelefon = persoana.nrTelefon;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public String getNrTelefon() {
        return nrTelefon;
    }

    public void setNrTelefon(String nrTelefon) {
        this.nrTelefon = nrTelefon;
    }

    @Override
    public String toString() {
        return "Nume " + nume + '\n' +
                "Prenume " + prenume + '\n' +
                "Numar telefon " + nrTelefon + '\n';
    }

    @Override
    public int compareTo(Persoana p){
        String fullname = this.nume + this.prenume;
        String p_fullname = p.nume + p.prenume;
        return fullname.compareTo(p_fullname);
    }
}
