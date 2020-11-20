/// NICOI ALEXANDRU - GRUPA 253 - CALCULATOARE SI TEHNOLOGIA INFORMATIEI
/// POO - TEMA 1 - EXERCITIUL 4

#include <iostream>
#include <cstring>
#include <cstdlib>

using namespace std;

class nod {
private:
    char info;
    nod* next;
public:
    nod();
    nod(char);
    ~nod();
    char getinfo();
    void setinfo(char);
    nod* getnext();
    void setnext(nod*);
    nod* operator=(nod*);
};

nod::nod()
{
    info = 0;       /// initializare cu 0 adica null deoarece e char
    next = NULL;
}

nod::nod(char x)
{
    info = x;       /// initializare cu parametru char
    next = NULL;
}

nod::~nod()
{
    info = 0;       ///destruct
    next = NULL;
}

char nod::getinfo()
{
    return info;
}

void nod::setinfo(char info)
{
    this->info = info;
}

void nod::setnext(nod* next)
{
    this->next = next;
}

nod* nod::getnext()
{
    return next;
}

nod* nod::operator=(nod *x)
{
    info = x->info;
    next = x->next;
}

class Stiva_de_caractere{
private:
    nod* p;
public:
    Stiva_de_caractere()
    {
        p = new nod;        /// alocare dinamica nod
    }
    ~Stiva_de_caractere()
    {
        while(p->getnext() != 0)
        {
            nod *q = p;
            p = p->getnext();
            delete q;
        }
        p->~nod();
    }
    void push(char);
    void pop();
    void top();
    bool isempty();
    void citire(istream &in, Stiva_de_caractere& s);
    void afisare(ostream &out, Stiva_de_caractere& s);
    void afisarefarastergere();
    friend ostream& operator<<(ostream &out, Stiva_de_caractere& s);
    friend istream& operator>>(istream &in, Stiva_de_caractere& s);
    friend Stiva_de_caractere operator-(Stiva_de_caractere a, Stiva_de_caractere b);
    char* invertString(char* x);
    void metoda_enunt_verde();
    Stiva_de_caractere operator=(Stiva_de_caractere s);
};

void Stiva_de_caractere::push(char x)
{
    if(p->getinfo() == 0)       ///verificare daca primul nod al stivei este gol
        p->setinfo(x);
    else{
    nod* nou = new nod;
    nou->setinfo(x);
    nou->setnext(p);
    p = nou;}
}

void Stiva_de_caractere::pop()
{
    if(p->getnext() == NULL)        /// verificare daca e singurul nod
        p->setinfo(0);
    else{
    nod* q = p;
    p = p->getnext();
    delete q;}
}

void Stiva_de_caractere::top()
{
    cout << p->getinfo() << endl;       /// afisare top stiva
}

bool Stiva_de_caractere::isempty()
{
    if(p->getinfo() == 0)           /// verificare daca stiva e goala
        return 1;
    return 0;
}

void Stiva_de_caractere::afisare(ostream &out, Stiva_de_caractere& s)
{
    while(s.isempty() == 0)
    {
        out << s.p->getinfo();      /// afisare stiva concomitent cu stergerea ei
        s.pop();
    }
}

void Stiva_de_caractere::afisarefarastergere()
{
    nod* q = new nod;
    q = p;                          /// afisare stiva fara stergere (folosind o noua zona de memorie)
    while(q)
    {
        cout << q->getinfo();
        q = q->getnext();
    }
}

ostream& operator<<(ostream& out, Stiva_de_caractere& s)
{
    s.afisare(out,s);                   /// supraincarcare operator <<
    return out;
}

void Stiva_de_caractere::citire(istream &in, Stiva_de_caractere& s)
{
    string aux;
    in >> aux;
    for(int i = 0 ; i < aux.length() ; i++)
        s.push(aux[i]);
}

istream& operator>>(istream& in, Stiva_de_caractere& s)
{
    s.citire(in,s);
    return in;                          /// supraincarcare operator >>
}

char* Stiva_de_caractere::invertString(char* x)
{
    Stiva_de_caractere s;
    for(int i = 0 ; i < strlen(x) ; i++)
        s.push(x[i]);
    char* result = new char[strlen(x)+1];
    for(int i = 0 ; i < strlen(x) ; i++){       /// invert string prin inserarea caracterelor in stiva
        result[i] = s.p->getinfo();             /// apoi scoaterea acestora din stiva
        s.pop();}
    return result;
}

Stiva_de_caractere operator-(Stiva_de_caractere a, Stiva_de_caractere b)
{
    Stiva_de_caractere c;
    while(!(a.isempty()) && !(b.isempty()))
    {
        if(a.p->getinfo() > b.p->getinfo())
            c.push(a.p->getinfo());
        else c.push(b.p->getinfo());            /// supraincarcare operator -
        a.pop();
        b.pop();
    }
    return c;
}

void Stiva_de_caractere::metoda_enunt_verde()       /// citire memorare afisare n obiecte
{
    int n;
    cout << "Numarul de obiecte: ";
    cin >> n;
    cout << endl;
    Stiva_de_caractere *v = new Stiva_de_caractere[n]; /// alocare dinamica
    for(int i = 0 ; i < n ; i++){
        cout << "Obiectul nr. " << i+1 << " : ";        /// citire + memorare
        cin >> v[i];}
    cout << endl << endl;
    cout << "Cele " << n << " obiecte:" << endl;
    for(int i = 0 ; i < n ; i++)                        /// afisare
        cout << v[i] << endl;
}

void meniu_init()
{
    cout << endl << "Nicoi Alexandru - Grupa 253 - Clasa 'Stiva de caractere'";
    cout << endl << "------------------------------------------------------------------------------------";
    cout << endl << "Alege optiunile de mai jos, tastand cifra corespunzatoare optiunii:";
    cout << endl << endl << "Citire N obiecte, memorare si afisare - 1";
    cout << endl << "Citire un obiect si prelucrarea acestuia (MENIU SECUNDAR) - 2";
    cout << endl << "Iesire - 0" << endl << endl;
}

void meniu_init2()
{
    cout << endl << "Nicoi Alexandru - Grupa 253 - Clasa 'Stiva de caractere'";
    cout << endl << "------------------------------------------------------------------------------------";
    cout << endl << "MENIU SECUNDAR CA URMARE A OPTIUNII 2 DIN MENIUL PRINCIPAL";
    cout << endl << "------------------------------------------------------------------------------------";
    cout << endl << "Alege optiunile de mai jos, tastand cifra corespunzatoare optiunii:";
    cout << endl << endl << "Citeste obiectul - 1";
    cout << endl << "------------------------------------------------------------------------------------";
    cout << endl << "URMATOARELE OPTIUNI IN AFARA DE 7 SI 8 SUNT VALABILE DOAR DUPA EXECUTAREA COMENZII 1";
                        /// masura de siguranta pentru a preveni eventualele erori
    cout << endl << "------------------------------------------------------------------------------------";
    cout << endl << "Afiseaza obiectul ATENTIE - va cauza stergerea sa - 2";
    cout << endl << "Afiseaza obiectul fara stergerea sa - 3";
    cout << endl << "Adauga un caracter in stiva - 4";
    cout << endl << "Sterge primul caracter din stiva - 5";
    cout << endl << "Afiseaza primul caracter din stiva - 6";
    cout << endl << "Verifica daca stiva este goala - 7";
    cout << endl << "Revenire - 8" << endl << endl;
}

void opt2()
{
    int opt, OK = 0;
    Stiva_de_caractere s;
    do
    {
        meniu_init2();
        cout << "Optiunea aleasa: ";
        cin >> opt;
        system("cls");
        if(opt == 1)
        {
            cout << "Scrie obiectul: " << endl;
            cin >> s;
            OK = 1;
            cout << endl;
        }
        else if(opt == 8)
            cout << "Revenire in ecranul principal!" << endl;
        else if(opt == 7)
            {
                if(s.isempty() == 1)
                    cout << "Stiva este goala!" << endl;
                else cout << "Stiva nu este goala!" << endl;
            }
        else if(OK == 1)
        {

            if(opt == 4)
            {
                char c;
                cout << "Caracterul: ";
                cin >> c;
                s.push(c);
            }
            else if(opt == 2)
            {
            cout << "Obiectul: " << endl;
            cout << s;
            cout << endl;
            OK = 0;
            }
            else if(opt == 3)
            {
            cout << "Obiectul: " << endl;
            s.afisarefarastergere();
            cout << endl;
            }
            else if(opt == 5)
            {
                s.pop();
                cout << "Caracter sters!" << endl;
                if(s.isempty() == 1)
                    OK = 0; /// verificare daca s-a golit stiva
            }
            else if(opt == 6)
            {
                cout << "Varful stivei : ";
                s.top();
            }
        }
        else if(OK == 0 && opt >= 2 && opt <= 6)
            cout << "Optiune nepermisa!" << endl; /// pentru ca nu este niciun obiect memorat!
        else cout << "Optiune invalida!" << endl;
        system("pause");
        system("cls");
    }while(opt != 8);
}

void meniu()
{
    int opt;
    do
    {
        meniu_init();
        cout << "Optiunea aleasa: ";
        cin >> opt;
        if(opt == 1)
        {
            system("cls");
            Stiva_de_caractere s;
            s.metoda_enunt_verde();
        }
        else if(opt == 2)
        {
            system("cls");
            opt2();
        }
        else if(opt == 0)
            cout << endl << "Iesire!" << endl;
        else cout << endl << "Optiune invalida!" << endl;
        system("pause");
        system("cls");
    }while(opt!=0);
}

int main()
{
    meniu();
    /*/char* aux = new char[255];
    cin >> aux;
    Stiva_de_caractere s;
    aux = s.invertString(aux);   /// invert string proba
    cout << aux;/*/
    return 0;
}
