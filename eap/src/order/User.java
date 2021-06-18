package order;

import person.Persoana;

public class User extends Persoana {
    private String username;
    private String adresa;

    public User(){
    }

    public User(String nume, String prenume, String nr_telefon, String username, String adresa){
        super(nume,prenume,nr_telefon);
        this.username = username;
        this.adresa = adresa;
    }

    public User(User user) {
        super(user);
        this.username = user.username;
        this.adresa = user.adresa;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    @Override
    public String toString() {
        return "Nume " + nume + '\n' +
                "Prenume " + prenume + '\n' +
                "Numar telefon " + nrTelefon + '\n' +
                "Username " + username + '\n' +
                "Adresa " + adresa + '\n';
    }
}
