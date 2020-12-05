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
    ingredient(ingredient& i)
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
            exit(EXIT_FAILURE);
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
    int pret_manopera;
    vector<ingredient> ingrediente;

public:
    pizza(string denumire_pizza = "" , int pret_manopera = 0):pizzerie()
    {
        this -> denumire_pizza = denumire_pizza;
        this -> pret_manopera = pret_manopera;

    }
    ~pizza()
    {
        denumire_pizza = "";
        pret_manopera = 0;
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
    int get_pret_manopera(){return pret_manopera;}
    vector<ingredient>& get_ingrediente() {return ingrediente;}
    /// set
    void set_denumire_pizza(string denumire_pizza){this->denumire_pizza = denumire_pizza;}
    void set_pret_manopera(int pret_manopera){this->pret_manopera = pret_manopera;}
    void set_ingrediente(vector<ingredient> v){ingrediente = move(v);}
    void citire(istream &in) {
        try
        {
            string denpizza;
            int prmanop , cnting;
            cout << "Denumire pizza: ";
            in >> denpizza;
            cout << "Pret manopera pizza: ";
            in >> prmanop;
            if(prmanop < 0)
                throw 1;
            cout << "Numarul de ingrediente: ";
            in >> cnting;
            if(cnting < 0)
                throw 2;
            ingrediente.reserve(cnting);
            for (int i = 0; i < cnting; i++)
            {
                ingredient x;   /// ||=== Build file: "no target" in "no project" (compiler: unknown) ===|
                                /// error: binding reference of type 'ingredient&' to 'const ingredient' discards qualifiers|
                                ///error: cannot bind non-const lvalue reference of type 'ingredient&' to an rvalue of type 'ingredient'|
                                ///||=== Build failed: 2 error(s), 13 warning(s) (0 minute(s), 0 second(s)) ===|

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
            exit(EXIT_FAILURE);
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
    int cnt_prod;
public:
    meniu(int cnt = 0 , unordered_map<t, vector<ingredient>> produse = unordered_map<t, vector<ingredient>>())
    {
        cnt_prod = cnt;
        this->produse = produse;
    }
    meniu(meniu& m)
    {
        cnt_prod = m.cnt_prod;
        produse = m.produse;
    }
    ~meniu()
    {
        cnt_prod = -1;
        delete produse;
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
            out << i->first();
            out << " avand urmatoarele ingrediente:\n";
            vector<ingredient> ingrediente = i->second();
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

template <> class meniu <pizza>
{
    /// WIP
};


int main()
{
    cout << "cam 50% e gata :(";
    return 0;
}
