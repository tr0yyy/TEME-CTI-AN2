// NICOI ALEXANDRU - GRUPA 153 - CALCULATOARE SI TEHNOLOGIA INFORMATIEI - TEMA PROGRAMARE DINAMICA

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <algorithm>

using namespace std;

ifstream f1("p_1.in");
ifstream f2("p_2.in");
ofstream g1("p_1.out");
ofstream g2("p_2.out");


//problema1
void afisare(int i, int *t, int *pred)
{
    if(i != -1)
    {
        afisare(pred[i], t , pred);
        g1 << t[i] << " ";
    }
    else g1 << endl;
}

void dinamic(int *t , int n)
{
    int *lmax = new int[n];
    int *pred = new int[n];
    lmax[0] = 1;
    pred[0] = -1;
    for(int i = 1 ; i < n ; i++)
    {
        lmax[i] = 1;
        pred[i] = -1;
        for(int j = 0 ; j < i ; j++)
            if(t[i] >= t[j] && 1 + lmax[j] > lmax[i])
            {
                lmax[i] = 1 + lmax[j];
                pred[i] = j;
            }
    }
    int pmax = 0;
    for(int i = 1 ; i < n ; i++)
        if(lmax[i] > lmax[pmax])
            pmax = i;
    afisare(pmax, t, pred);
    delete lmax;
    delete pred;
}

int main()
{
    int n, m, **a;
    f1 >> n >> m;
    a = new int*[n];
    for(int i = 0 ; i < n ; i++){
        a[i] = new int[m];
        for(int j = 0 ; j < n ; j++)
            f1 >> a[i][j];}
    int **b;
    b = new int*[m];
    for(int i = 0 ; i < m ; i++)
    {
        b[i] = new int[n];
        for(int j = 0 ; j < n ; j++)
            b[i][j] = a[j][i];
    } // am transpus matricea a in matricea b pentru a afla pe coloane subsirul maxim
    for(int i = 0 ; i < m ; i++)
        dinamic(b[i], n);
    delete a;
    delete b;
}
/*/
//problema 2
void prelucrare(int i, int *t, int *pred, int *v)
{
    if(i != -1)
    {
        prelucrare(pred[i], t , pred, v);
        v[i] = t[i];
    }
}

void afisare(int *v, int n)
{
    int cnt = 0;
    for(int i = 0 ; i < n ; i++)
        if(v[i] == -1)
            cnt++;
        else g2 << v[i] << " ";
    g2 << endl << "Numarul de copaci taiati: " << cnt;
}

void dinamic(int *t , int n)
{
    int *lmax = new int[n];
    int *pred = new int[n];
    lmax[0] = 1;
    pred[0] = -1;
    for(int i = 1 ; i < n ; i++)
    {
        lmax[i] = 1;
        pred[i] = -1;
        for(int j = 0 ; j < i ; j++)
            if(t[i] <= t[j] && 1 + lmax[j] > lmax[i])
            {
                lmax[i] = 1 + lmax[j];
                pred[i] = j;
            }
    }
    int pmax = 0;
    for(int i = 1 ; i < n ; i++)
        if(lmax[i] > lmax[pmax])
            pmax = i;
    int *v = new int[n];
    for(int i = 0 ; i < n ; i++)
        v[i] = -1;
    prelucrare(pmax, t, pred, v);
    afisare(v, n);
    delete lmax;
    delete pred;
}

int main()
{
    int n, *a;
    f2 >> n;
    a = new int[n];
    for(int i = 0 ; i < n ; i++)
        f2 >> a[i];
    dinamic(a,n);
}
/*/
