/// NICOI ALEXANDRU - GRUPA 253 - CALCULATOARE SI TEHNOLOGIA INFORMATIEI
/// PROIECT 2 - TEMA 6

#include <iostream>
#include <cstdlib>
#include <cctype>

using namespace std;

///---------//clasa persoana\\----------

class Persoana
{
protected:

    int id; /// fac atribuire pe ID dupa cntpersoana
    string nume;
    string cnp;

    static int cntpersoana;

public:
    Persoana();
    Persoana(string,string);
    Persoana(Persoana&);
    virtual ~Persoana();
    void set_id(int);
    void set_nume(string);
    void set_cnp(string);
    int get_id();
    string get_nume();
    string get_cnp();
    virtual void citire(istream &in);
    friend istream& operator>>(istream &in, Persoana &p);
    virtual void afisare(ostream &out);
    friend ostream& operator<<(ostream &out, Persoana &p);
    Persoana& operator=(Persoana &p);
    static void numarpersoane()
    {
        cout << cntpersoana << endl;
    }

};

int Persoana::cntpersoana;

Persoana::Persoana()
{
    cntpersoana++;
    id = cntpersoana; // mentinem id 0 pt persoanele nesetate inca
    nume = '0';
    cnp = '0';

}

Persoana::Persoana(string y, string z)
{
    try
    {
        for(int i = 0 ; i < y.length() ; i++)
            if(!(isalpha(y[i])) && y[i] != ' ')
                throw 1;
        for(int i = 0 ; i < z.length() ; i++)
            if(!isdigit(z[i]))
                throw 2;
        cntpersoana++;
        id = cntpersoana;
        nume = y;
        cnp = z;

    }
    catch(int i)
    {
        if(i == 1)
            cout<<"EROARE CONSTRUCTOR, numele persoanei poate contine doar litere si spatii." << endl;
        else cout <<"EROARE CONSTRUCTOR, CNP-ul persoanei poate contine doar cifre." << endl;
        exit(EXIT_FAILURE);
    }
}

Persoana::Persoana(Persoana& a)
{
    cntpersoana++;
    nume = a.nume;
    cnp = a.cnp;
    id = cntpersoana;
}

Persoana::~Persoana()
{
    id = 0;
    nume = '0';
    cnp = '0';
    cntpersoana--;
}

void Persoana::set_id(int x)
{
    id = x;
}

void Persoana::set_nume(string x)
{
    nume = x;
}

void Persoana::set_cnp(string x)
{
    cnp = x;
}

int Persoana::get_id()
{
    return id;
}

string Persoana::get_nume()
{
    return nume;
}

string Persoana::get_cnp()
{
    return cnp;
}

void Persoana::citire(istream &in)
{
    try
    {
        string y , z;
        cout << "ID presetat: " << id <<endl;
        cout << "Nume: ";
        in >> y;
        for(int i = 0 ; i < y.length() ; i++)
            if(!(isalpha(y[i])) && y[i] != ' ')
                throw 1;
        cout << "CNP: ";
        in >> z;
        for(int i = 0 ; i < z.length() ; i++)
            if(!isdigit(z[i]))
                throw 2;
        nume = y;
        cnp = z;
    }
    catch(int i)
    {
        if(i == 1)
            cout<<"EROARE CONSTRUCTOR, numele persoanei poate contine doar litere." << endl;
        else cout <<"EROARE CONSTRUCTOR, CNP-ul persoanei poate contine doar cifre." << endl;
        exit(EXIT_FAILURE);
    }
}

istream& operator>>(istream& in, Persoana& p){
    p.citire(in);
    return in;
}

void Persoana::afisare(ostream &out)
{
    out << "\nID: " << id << "\nNUME: " << nume << "\nCNP: " << cnp;
}

ostream& operator<<(ostream& out, Persoana& p)
{
    p.afisare(out);
    return out;
}

Persoana& Persoana::operator=(Persoana &p)
{
    nume = p.nume;
    cnp = p.cnp;
}



///---------//end clasa persoana\\----------

///---------//clasa abonat\\----------

class Abonat:public Persoana
{
private:

    string nr_telefon;

public:
    Abonat();
    Abonat(string,string,string);
    Abonat(Abonat&);
    ~Abonat();
    void set_nr_telefon(string);
    string get_nr_telefon();
    void citire(istream &in);
    friend istream& operator>>(istream &in, Abonat &a);
    void afisare(ostream &out);
    friend ostream& operator<<(ostream &out, Abonat &a);
    Abonat& operator=(Abonat &a);
};


Abonat::Abonat():Persoana()
{
    nr_telefon='0';

}

Abonat::Abonat(string x, string z , string t):Persoana(z,t)
{
    nr_telefon = x;
}

Abonat::Abonat(Abonat& a):Persoana(a)
{
    nr_telefon = a.nr_telefon;
}

Abonat::~Abonat()
{
    nr_telefon = '0';

}

void Abonat::set_nr_telefon(string x)
{
    nr_telefon = x;
}

string Abonat::get_nr_telefon()
{
    return nr_telefon;
}

void Abonat::citire(istream &in)
{
    Persoana::citire(in);
    try
    {
        string s;
        cout << "Nr de telefon (0 daca nu este abonat): ";
        cin >> s;
        for(int i = 0 ; i < s.length() ; i++)
            if(!isdigit(s[i]))
                throw 1;
        nr_telefon = s;
    }
    catch(int i)
    {
        cout << "\nNumarul de telefon poate contine numai cifre!";
        exit(EXIT_FAILURE);
    }
}

istream& operator>>(istream& in, Abonat& a){
    a.citire(in);
    return in;
}

void Abonat::afisare(ostream &out)
{
    Persoana::afisare(out);
    out << "\nNr. de telefon: " << nr_telefon << endl;
}

ostream& operator<<(ostream& out, Abonat &a)
{
    a.afisare(out);
    return out;
}

Abonat& Abonat::operator=(Abonat& a)
{
    Persoana::operator=(a);
    nr_telefon = a.nr_telefon;
}

///---------//end clasa abonat\\----------

///---------//clasa abonament\\----------

class Abonament
{
protected:

    string nume_abonament;
    float pret;
    int perioada;

    static int cntabonamente;

public:
    Abonament();
    Abonament(string, float, int);
    Abonament(Abonament&);
    ~Abonament();
    void set_nume_abonament(string);
    void set_pret(float);
    void set_perioada(int);
    string get_nume_abonament();
    float get_pret();
    int get_perioada();
    virtual void citire(istream &in);
    friend istream& operator>>(istream &in, Abonament &a);
    virtual void afisare(ostream &out);
    friend ostream& operator<<(ostream &out, Abonament &a);
    Abonament& operator=(Abonament &a);
    static void numarabonamente()
    {
        cout << cntabonamente << endl;
    }
};

int Abonament::cntabonamente;

Abonament::Abonament()
{
    nume_abonament = '0';
    pret = 0;
    perioada = 0;
    cntabonamente++;
}

Abonament::Abonament(string a, float b, int c)
{
    nume_abonament = a;
    pret = b;
    perioada = c;
    cntabonamente++;
}

Abonament::Abonament(Abonament& a)
{
    nume_abonament = a.nume_abonament;
    pret = a.pret;
    perioada = a.perioada;
    cntabonamente++;
}

Abonament::~Abonament()
{
    nume_abonament = '0';
    pret = 0;
    perioada = 0;
    cntabonamente--;
}

void Abonament::set_nume_abonament(string x)
{
    nume_abonament = x;
}

void Abonament::set_pret(float x)
{
    pret = x;
}

void Abonament::set_perioada(int x)
{
    perioada = x;
}

string Abonament::get_nume_abonament()
{
    return nume_abonament;
}

float Abonament::get_pret()
{
    return pret;
}

int Abonament::get_perioada()
{
    return perioada;
}

void Abonament::citire(istream &in)
{
    try
    {
        string x;
        float y;
        int z;
        cout << "Nume abonament: ";
        in >> x;
        for(int i = 0 ; i < x.length() ; i++)
            if(!isalpha(x[i]) && x[i] != ' ')
                throw 1;
        cout << "Pret: ";
        in >> y;
        cout << "Perioada: ";
        in >> z;
        nume_abonament = x;
        pret = y;
        perioada = z;
    }
    catch(int i)
    {
        cout << "EROARE CONSTRUCTOR, numele abonamentului poate sa contina doar litere!";
        exit(EXIT_FAILURE);
    }
}

istream& operator>>(istream& in, Abonament& a){
    a.citire(in);
    return in;
}

void Abonament::afisare(ostream &out)
{
    out << "\nNume abonament: " << nume_abonament << "\nPret: " << pret << "\nPerioada: " << perioada << endl;
}

ostream& operator<<(ostream& out, Abonament &a)
{
    a.afisare(out);
    return out;
}

Abonament& Abonament::operator=(Abonament& a)
{
    nume_abonament = a.nume_abonament;
    pret = a.pret;
    perioada = a.perioada;
}

///---------//end clasa abonament\\----------

///---------//clasa abonament_premium\\----------

class Abonament_Premium:public Abonament
{
private:

    int reducere;

    static int cntpremium;

public:
    Abonament_Premium();
    Abonament_Premium(int,string, float, int);
    Abonament_Premium(Abonament_Premium&);
    ~Abonament_Premium();
    void set_reducere(int);
    int get_reducere();
    void citire(istream &in);
    friend istream& operator>>(istream &in, Abonament_Premium &a);
    void afisare(ostream &out);
    friend ostream& operator<<(ostream &out, Abonament_Premium &a);
    Abonament_Premium& operator=(Abonament_Premium &a);
    static void addcntpremium()
    {
        cntpremium++;
    }
    static int numarabonamentepremium()
    {
        return cntpremium;
    }
};

int Abonament_Premium::cntpremium;

Abonament_Premium::Abonament_Premium():Abonament()
{
    reducere = 0; }
Abonament_Premium::Abonament_Premium(int x, string a, float b, int c) :Abonament(a,b,c){
    reducere = x;
}

Abonament_Premium::Abonament_Premium(Abonament_Premium& x):Abonament(x)
{
    reducere = x.reducere;
}
Abonament_Premium::~Abonament_Premium()
{
    reducere = 0;
}

void Abonament_Premium::set_reducere(int x) {
    reducere = x;
}

int Abonament_Premium::get_reducere() {
    return reducere;
}

void Abonament_Premium::citire(istream& in)
{
    Abonament::citire(in);
    int x;
    cout << "Scrie reducerea (0 daca este abonament normal - nonpremium): ";
    in >> x;
    reducere = x;
}

istream& operator>>(istream &in, Abonament_Premium &a)
{
    a.citire(in);
    return in;
}

void Abonament_Premium::afisare(ostream& out)
{
    Abonament::afisare(out);
    out << "\nReducere: " << reducere << endl;
}

ostream& operator<<(ostream& out, Abonament_Premium &a)
{
    a.afisare(out);
    return out;
}

Abonament_Premium& Abonament_Premium::operator=(Abonament_Premium& a)
{
    Abonament::operator=(a);
    reducere = a.reducere;
}

///---------//end clasa abonament_premium\\----------

///-----------//clasa clienti\\------------
class Clienti /// VOI FACE UN VECTOR DE CLIENTI
{
private:
    Abonat *abonat; /// pointer -> E DOAR UN SINGUR ABONAT
    Abonament_Premium *abonament; /// pointer -> E DOAR UN SINGUR ABONAMENT_PREMIUM CARE MOSTENESTE ABONAMENT

    static int cntclienti;
public:
    Clienti();
    Clienti(Abonat&, Abonament_Premium&);
    Clienti(Clienti&);
    ~Clienti();
    Abonat* get_abonat()
    {
        return abonat;
    }
    Abonament_Premium* get_abonament()
    {
        return abonament;
    }
    void set_abonat(Abonat& a)
    {
        *abonat = a;
    }
    void set_abonament(Abonament_Premium &a)
    {
        *abonament = a;
    }
    void citire(istream& in);
    void afisare(ostream& out);
    friend istream& operator>>(istream& in, Clienti &c);
    friend ostream& operator<<(ostream& out, Clienti &c);
    Clienti& operator=(Clienti&);
    static int nrclienti()
    {
        return cntclienti;
    }
};

int Clienti::cntclienti;

Clienti::Clienti(){
    abonat = new Abonat;            /// daca nu e abonat are nr de telefon 0
    abonament = new Abonament_Premium; /// daca nu e premium are reducere 0
    cntclienti++;
}

Clienti::Clienti(Abonat &pp , Abonament_Premium &aa)
{
    *abonat = pp;
    *abonament = aa;
    cntclienti++;
}

Clienti::Clienti(Clienti& c)
{
    abonat = c.abonat;
    abonament = c.abonament;
}

Clienti::~Clienti()
{
    delete abonat;
    delete abonament;
    cntclienti--;
};

void Clienti::citire(istream &in)
{
    abonat->citire(in);
    abonament->citire(in);
}

istream& operator>>(istream& in, Clienti& c)
{
    c.citire(in);
    return in;
}

void Clienti::afisare(ostream &out)
{
    abonat->afisare(out);
    abonament->afisare(out);
}

ostream& operator<<(ostream& out, Clienti& c)
{
    c.afisare(out);
    return out;
}

Clienti& Clienti::operator=(Clienti& c)
{
    abonat = c.abonat;
    abonament = c.abonament;
}

/// -a meniu

void menu_init()
{
    cout << "----------------------NICOI ALEXANDRU // GRUPA 253 // PROGRAMARE ORIENTATA PE OBIECT----------------------\n";
    cout << "-----------------------PROIECT 2 - TEMA 6-----------------------\n";
    cout << "-----------Pentru a utiliza o functie a meniului, tastati cifra corespunzatoare functiei alese-------------\n";
    cout << "\n";
    cout << "1. Citire n Persoane, memorarea si afisarea acestora.\n";
    cout << "2. Citire n Abonamente, memorarea si afisarea acestora'.\n";
    cout << "3. Upcast si downcast Persoana - Abonat.\n";
    cout << "4. Upcast si downcast Abonament - Abonament_Premium.\n";
    cout << "5. Prelucrare clasa clienti.\n";
    cout << "0. Iesire.\n";
    cout << "\n";
    cout << "Cerintele specifice temei 6 se regasesc in optiunea 5 din meniu.";
    cout << "\n\n";
    cout << "Optiunea aleasa: ";
}

void opt1()
{
    system("cls");
    cout << "Citeste n: ";
    int n;
    cin >> n;
    Persoana *v = new Persoana[n];
    for(int i = 0 ; i < n ; i++)
    {
        cin >> v[i];
        cout << "\n";
    }
    for(int i = 0 ; i < n ; i++)
        cout << v[i];

}

void opt2()
{
    system("cls");
    cout << "Citeste n: ";
    int n;
    cin >> n;
    Abonament *v = new Abonament[n];
    for(int i = 0 ; i < n ; i++)
    {
        cin >> v[i];
        cout << "\n";
    }
    for(int i = 0 ; i < n ; i++)
        cout << v[i];

}

void opt3()
{
    system("cls");
    // upcast persoana - abonat
    cout << "UPCAST\n";
    Persoana *p = new Abonat;
    cin >> *p;
    cout << *p;
    // end upcast
    // downcast persoana - abonat
    cout << "\nDOWNCAST\n";
    Abonat* p2 = (Abonat*) new Persoana;
    cin >> *p2;
    cout << *p2;
}

void opt4()
{
    system("cls");
    // upcast abonament - abonament-premium
    cout << "UPCAST\n";
    Abonament *p = new Abonament_Premium;
    cin >> *p;
    cout << *p;
    // end upcast
    // downcast abonament - abonament-premium
    cout << "\nDOWNCAST\n";
    cin.get();
    Abonament_Premium* p2 = (Abonament_Premium*) new Abonament;
    cin >> *p2;
    cout << *p2;
}

void opt5_init()
{
    cout << "----------------OPTIUNI DISPONIBILE PENTRU CLASA CLIENTI----------------";
    cout << "\n----------PENTRU CLASA CLIENT : SE MEMOREAZA DATELE ABONATULUI SI ABONAMENTULUI---------";
    cout << "\n--------------PENTRU EFECTUAREA DIFERITELOR COMENZI , TASTEAZA CIFRA COMENZII--------------";
    cout << "\n\n";
    cout << "1. Memorare n Clienti.\n";
    cout << "2. Afisare n Clienti.\n";
    cout << "3. Afla numarul de abonati premium.\n";
    cout << "4. Afla suma de bani incasata de la toti clientii.\n";
    cout << "0. Iesire.\n";
    cout << "\n";
    cout << "Optiunea aleasa: ";
}

void opt5()
{
    int opt;
    Clienti *client;
    do {
        system("cls");
        opt5_init();
        cin >> opt;
        switch (opt)
        {
            case 1:
                system("cls");
                int n;
                cout<< "Cati clienti? :";
                cin >> n;
                client = new Clienti[n];
                for(int i = 0 ; i < n ; i++){
                    try{
                        cin >> client[i];
                        if(client[i].get_abonat()->get_nr_telefon() == "0")
                            throw 1;
                        if(client[i].get_abonament()->get_reducere() > 0)
                            Abonament_Premium::addcntpremium();
                    }
                    catch(int i)
                    {
                        cout << "EROARE, NUMAR DE TELEFON 0 INSEAMNA CA NU ESTE ABONAT!";
                        exit(EXIT_FAILURE);
                    }
                }

                cout << "\nClienti memorati cu succes!\n";
                system("pause");
                break;
            case 2:
                system("cls");
                for(int i = 0 ; i < n; i++)
                    cout << client[i] << endl;
                cout << "\nClienti afisati cu succes!\n";
                system("pause");
                break;
            case 3:
                system("cls");
                cout << "Nr. abonati premium (folosind variabila de tip static):" << Abonament_Premium::numarabonamentepremium() << "\n";
                system("pause");
                break;
            case 4:
                system("cls");
                int s;
                s = 0;
                for(int i = 0 ; i < n ; i++)
                    s += client[i].get_abonament()->get_pret() * client[i].get_abonament()->get_perioada();
                cout << "Suma de bani incasata este: " << s << endl;
                system("pause");
                break;
            case 0:
                system("cls");
                cout << "Iesire!\n";
                system("pause");
                break;
            default:
                cout << "Comanda gresita!\n";
                system("pause");
        }
    }while(opt != 0);
    delete [] client;
}

void menu()
{
    int opt;
    do {
        system("cls");
        menu_init();
        cin >> opt;
        switch (opt)
        {
            case 1:
                opt1();
                cout << "\n\n";
                system("pause");
                break;
            case 2:
                opt2();
                cout << "\n\n";
                system("pause");
                break;
            case 3:
                opt3();
                cout << "\n\n";
                system("pause");
                break;
            case 4:
                opt4();
                cout << "\n\n";
                system("pause");
                break;
            case 5:
                opt5();
                cout << "\n\n";
                system("pause");
                break;
            case 0:
                system("pause");
                exit(0);
                break;
            default:
                cout << "\n Optiune invalida!";
        }
    }while(opt != 0);
}


int main() {
    menu();
}
