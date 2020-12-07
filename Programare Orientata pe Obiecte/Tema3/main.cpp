#include <iostream>
#include <cstdlib>
#include <vector>
#include <cstring>
#include <unordered_map>

using namespace std;

class pizzerie
{
public:
    virtual float calcul_pret()= 0;
};


class ingredient
{
private:
    string denumire;
    float cantitate;
    float pret;
public:
    ingredient(string denumire = "", float cantitate = 0, float pret = 0)
    {
        this -> denumire = denumire;
        this -> cantitate = cantitate;
        this -> pret = pret;
    }
    ingredient(const ingredient &i)
    {
        this -> denumire = i.denumire;
        this -> cantitate = i.cantitate;
        this -> pret = i.pret;
    }
    ~ingredient()
    {
        denumire = "";
        cantitate = 0;
        pret = 0;
    }
    string get_denumire()
    {
        return denumire;
    }
    float get_cantitate()
    {
        return cantitate;
    }
    float get_pret()
    {
        return pret;
    }
    void set_denumire(string denumire)
    {
        this->denumire = denumire;
    }
    void set_cantitate(float cantitate)
    {
        this -> cantitate = cantitate;
    }
    void set_pret(float pret)
    {
        this -> pret = pret;
    }
    void citire(istream &in)
    {
        try
        {
            string den; /// den - denumire
            float can, pr; /// can - cantitate ; pr - pret
            cout << "\nDenumirea ingredientului: ";
            in >> den;
            for(int i = 0 ; i < den.length() ; i++)
                if(!isalpha(den[i]))
                    throw 1;
            cout << "\nCantitatea ingredientului: ";
            in >> can;
            if(can <= 0)
                throw 2;
            cout << "\nPretul ingredientului: ";
            in >> pr;
            if(pr <= 0)
                throw 3;
            denumire = den;
            cantitate = can;
            pret = pr;
        }
        catch(int i)
        {
            if(i == 1)
                cout << "EROARE ! Denumirea contine si alte caractere in afara de litere!";
            else if(i == 2)
                cout << "EROARE ! Cantitatea nu poate fi mai mica sau egala cu 0!";
            else if(i == 3)
                cout << "EROARE ! Pretul nu poate fi mai mic sau egal cu 0!";
            cout << "\n\nREPETARE CITIRE INGREDIENTE\n\n";
            system("pause");
            system("cls");
            in.clear();
            citire(in);
        }
    }
    friend istream& operator>>(istream& in, ingredient& i)
    {
        i.citire(in);
        return in;
    }
    void afisare(ostream& out)
    {
        out << "\nDenumire ingredient: "<< denumire;
        out << "\nCantitate ingredient: " << cantitate;
        out << "\nPret ingredient: " << pret;
    }
    friend ostream& operator<<(ostream& out, ingredient& i)
    {
        i.afisare(out);
        return out;
    }
    ingredient& operator=(ingredient& i)
    {
        this->cantitate = i.cantitate;
        this->denumire = i.denumire;
        this->pret = i.pret;
    }
};

class pizza : public pizzerie
{
private:
    string denumire_pizza;
    float pret_manopera;
    vector<ingredient> ingrediente;

    bool vegetariana;
public:
    pizza(string denumire_pizza = "" , float pret_manopera = 0, bool vegetariana = 0):pizzerie()
    {
        this -> denumire_pizza = denumire_pizza;
        this -> pret_manopera = pret_manopera;
        this -> vegetariana = vegetariana;

    }
    ~pizza()
    {
        denumire_pizza = "";
        pret_manopera = 0;
        vegetariana = 0;
        ingrediente.clear();
        ingrediente.shrink_to_fit();
    }
    virtual float calcul_pret()
    {
        float pret = 0;
        for(auto i = ingrediente.begin() ; i != ingrediente.end() ; ++i)
            pret += i->get_pret();
        pret += (float)pret_manopera;
        return pret;
    }
    /// get
    string get_denumire_pizza(){return denumire_pizza;}
    float get_pret_manopera(){return pret_manopera;}
    bool get_vegetariana(){return vegetariana;}
    vector<ingredient>& get_ingrediente() {return ingrediente;}
    /// set
    void set_denumire_pizza(string denumire_pizza){this->denumire_pizza = denumire_pizza;}
    void set_pret_manopera(float pret_manopera){this->pret_manopera = pret_manopera;}
    void set_ingrediente(vector<ingredient> v){ingrediente = move(v);}
    void set_vegetariana(bool vegetarian){this->vegetariana = vegetarian;}
    void citire(istream &in) {
        try
        {
            string denpizza;
            float prmanop ;
            int cnting;
            cout << "Denumire pizza: ";
            in >> denpizza;
            cout << "Pret manopera pizza: ";
            in >> prmanop;
            if(prmanop < 0)
                throw 1;
            cout << "Este vegetariana? : (0 - nu ; 1 - da) ";
            int veg;
            in >> veg;
            if(veg != 0 && veg != 1)
                throw 4;
            vegetariana = veg;
            cout << "Numarul de ingrediente: ";
            in >> cnting;
            if(cnting < 0)
                throw 2;
            ingrediente.reserve(cnting);
            for (int i = 0; i < cnting; i++)
            {
                ingredient x;
                in >> x;
                ingrediente.push_back(x);
            }
            denumire_pizza = denpizza;
            pret_manopera = prmanop;
            ///functie calcul_pret
        }
        catch(int i)
        {
            if(i == 1)
                cout << "EROARE ! Pret manopera invalid (<0)!\n";
            else if(i == 2)
                cout << "EROARE ! Numar ingrediente invalid (<0)!\n";
            else if(i == 4)
                cout << "EROARE ! Valoare citita este diferita de 0 si 1\n";
            cout << "\n\nREPETARE CITIRE!\n\n";
            in.clear();
            system("pause");
            system("cls");
            citire(in);
        }
    }
    friend istream& operator>>(istream& in, pizza& p)
    {
        p.citire(in);
        return in;
    }
    void afisare(ostream &out)
    {
        out << "\nDenumire pizza: " << denumire_pizza;
        out << "\nPret manopera: " << pret_manopera;
        out << "\nLista ingrediente pizza:\n";
        for(auto i = ingrediente.begin() ; i != ingrediente.end() ; ++i)
            out << (*i) << endl;
    }
    friend ostream& operator<<(ostream& out, pizza& p)
    {
        p.afisare(out);
        return out;
    }
    pizza& operator=(pizza& p)
    {
        this -> denumire_pizza = p.denumire_pizza;
        this -> pret_manopera = p.pret_manopera;
        ingrediente = move(p.ingrediente);
    }
};

template <class t> class meniu
{
private:
    unordered_map<t, vector<ingredient>> produse;
    static int cnt_prod;
public:
    meniu(unordered_map<t, vector<ingredient>> produse = unordered_map<t, vector<ingredient>>())
    {
        this->produse = produse;
    }
    meniu(meniu& m)
    {
        produse = m.produse;
    }
    ~meniu()
    {
        produse.erase(produse.begin(),produse.end());
    }
    void citire(istream &in)
    {
        cout << "Cate produse?: ";
        int n;
        in >> n;
        cnt_prod = n;
        for(int i = 0 ; i < n ; i++)
        {
            t tip_produs;
            in >> tip_produs;
            int cnting;
            vector<ingredient> ingrediente;
            cout << "Numarul de ingrediente: ";
            in >> cnting;
            if(cnting < 0)
                throw 2;
            ingrediente.reserve(cnting);
            for (int i = 0; i < cnting; i++)
            {
                ingredient x;
                in >> x;
                ingrediente.push_back(x);
            }
            pair<t,vector<ingredient>> produs (tip_produs,ingrediente);
            produse.insert(produs);
        }
    }
    friend istream& operator>>(istream& in, meniu& m)
    {
        m.citire(in);
        return in;
    }
    void afisare(ostream &out)
    {
        out << "Meniul este compus din: " << endl;
        for(auto i = produse.begin() ; i != produse.end() ; ++i)
        {
            out << "ID Produs: ";
            out << (*i).first;
            out << "\navand urmatoarele ingrediente:\n";
            vector<ingredient> ingrediente = (*i).second;
            for(auto j = ingrediente.begin() ; j != ingrediente.end() ; ++j)
                out << (*j) << endl;
            out << endl;
        }
    }
    friend ostream& operator<<(ostream& out, meniu &m)
    {
        m.afisare(out);
        return out;
    }
    meniu& operator=(meniu& m)
    {
        produse = m.produse;
        cnt_prod = m.cnt_prod;
    }
    meniu& operator+=(pair<t,vector<ingredient>> produs)
    {
        cnt_prod++;
        produse.insert(produs);
    }
};

template<class t> int meniu<t>::cnt_prod;

template <> class meniu <pizza>
{
private:
    unordered_map<int, vector<ingredient>> produse;
    static int cnt_prod;
public:
    meniu(unordered_map<int, vector<ingredient>> produse = unordered_map<int, vector<ingredient>>())
    {
        this->produse = produse;
    }
    meniu(meniu& m)
    {
        produse = m.produse;
    }
    ~meniu()
    {
        produse.erase(produse.begin(),produse.end());
    }
    void citire(istream &in)
    {
        cout << "Cate produse?: ";
        int n;
        in >> n;
        cnt_prod = n;
        for(int i = 1 ; i <= n ; i++)
        {
            pizza p;
            in >> p;
            int id_pizza = i;
            vector<ingredient> ingrediente = p.get_ingrediente();
            pair<int,vector<ingredient>> produs (id_pizza,ingrediente);
            produse.insert(produs);
        }
    }
    friend istream& operator>>(istream& in, meniu& m)
    {
        m.citire(in);
        return in;
    }
    void afisare(ostream &out)
    {
        out << "Meniul este compus din:" << endl;
        for(auto i = produse.begin() ; i != produse.end() ; ++i)
        {
            out << "ID Produs: ";
            out << (*i).first;
            out << "\navand urmatoarele ingrediente:\n";
            vector<ingredient> ingrediente = (*i).second;
            for(auto j = ingrediente.begin() ; j != ingrediente.end() ; ++j)
                out << (*j) << endl;
            out << endl;
        }
    }
    friend ostream& operator<<(ostream& out, meniu &m)
    {
        m.afisare(out);
        return out;
    }
    meniu& operator=(meniu& m)
    {
        produse = m.produse;
        cnt_prod = m.cnt_prod;
    }
    meniu& operator+=(pair<int,vector<ingredient>> produs)
    {
        cnt_prod++;
        produse.insert(produs);
    }
};

int meniu<pizza>::cnt_prod;

template <class t> class comanda_online
{
private:
    string adresa;
    int distanta;
    float pretfinal;
    vector<pair<t,float>> produse; /// t - tip produs , int - pret produs
    float calcul_pret_final()
    {
        float s = 0;
        for(auto i = produse.begin() ; i != produse.end() ; ++i)
            s += (*i).second;
        if(distanta < 10)
            return s;
        else{
            cout << endl << s << endl;
        float transport = 0.05*s; /// 5% din pretul comenzii pt transport
        float sumatrans = transport;
        int aux = distanta;
        aux -= 10;
        while(aux >= 10)
        {
            sumatrans += transport; /// adaugare inca 5%
            aux -= 10;
        }
        return (sumatrans + s);}
    }
public:
    comanda_online(string adresa = "", int distanta = 0, vector<pair<t,float>> produse = vector<pair<t,float>>())
    {
        this->adresa = adresa;
        this->distanta = distanta;
        this->produse = produse;
        pretfinal = 0;
    }
    comanda_online(comanda_online& co)
    {
        adresa = co.adresa;
        distanta = co.distanta;
        produse = co.produse;
        pretfinal = co.pretfinal;
    }
    ~comanda_online()
    {
        adresa = "";
        distanta = 0;
        produse.erase(produse.begin(),produse.end());
        pretfinal = 0;
    }
    void citire(istream &in)
    {
        cout << "Adresa clientului: ";
        string adr;
        getline(in,adr);
        cout << "Care e distanta pana la client?: ";
        int n;
        in >> n;
        cout << "Cate produse a comandat? ";
        int m;
        in >> m;
        for(int i = 0 ; i < m ; i++)
        {
            t produs;
            float pret;
            cout << "Citeste produsul: ";
            in >> produs;
            cout << "Citeste pretul: ";
            in >> pret;
            pair<t,float> pereche (produs,pret);
            produse.push_back(pereche);
        }
        adresa = adr;
        distanta = n;
        pretfinal = calcul_pret_final();
    }
    friend istream& operator>>(istream &in , comanda_online& co)
    {
        co.citire(in);
        return in;
    }
    void afisare(ostream& out)
    {
        out << "Adresa clientului: " << adresa << endl;
        out << "Distanta pana la client: " << distanta << endl;
        out << "Produsele comandate si pretul lor:\n";
        for(auto i = produse.begin() ; i != produse.end() ; ++i)
            out << "---- " << (*i).first << " cu pretul: " << (*i).second << endl;
        out << "Pret final: " << pretfinal;
    }
    friend ostream& operator<<(ostream &out, comanda_online& co)
    {
        co.afisare(out);
        return out;
    }
    comanda_online& operator=(comanda_online& co)
    {
        adresa = co.adresa;
        distanta = co.distanta;
        produse = co.produse;
        pretfinal = co.pretfinal;
    }
};

int main()
{
    return 0;
}
