// NICOI ALEXANDRU - GRUPA 153 - CALCULATOARE SI TEHNOLOGIA INFORMATIEI - TEMA GREEDY

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>

using namespace std;
/*/

// PROBLEMA 1

struct film{
    int inceput;
    int final;
};

int cmp (const void *a , const void *b)
{
    film *filma = (film *)a;
    film *filmb = (film *)b;
    if(filma -> final > filmb -> final)
        return 1;
    else if(filma -> final < filmb -> final)
        return -1;
        else return 0;
}


int main()
{
    int n , k = -1;
    film *v;
    ifstream f("in.txt");
    f >> n;
    v = new film[n];
    for(int i = 0 ; i < n ; i++)
    {
        int x , y;
        f >> x >> y;
        if(x >= 13 && y <= 20)
            {
                k++;
                v[k].inceput = x;
                v[k].final = y;
            }
    }
    k++;
    qsort(v,k,sizeof(v[0]),cmp);
    film ant = v[0];
    cout << v[0].inceput << " " << v[0].final << endl;
    for(int i = 1 ; i < k ; i++)
         if(v[i].inceput >= ant.final)
             {
                cout << v[i].inceput << " " << v[i].final << endl;
                ant = v[i];
             }
    return 0;
}/*/

// PROBLEMA 2

struct song
{
    int min;
    int sec;
};

int cmp (const void *a , const void *b)
{
    song *x = (song *)a;
    song *y = (song *)b;
    if(x -> sec > y -> sec)
        return 1;
    else if(x -> sec < y -> sec)
        return -1;
        else return 0;
}

song converttosec(song x)
{
    song y;
    y.min = 0;
    y.sec = x.sec + 60*x.min;
    return y;
}

song converttomin(song x)
{
    song y;
    y.min = x.sec / 60;
    y.sec = x.sec - 60 * y.min;
    return y;
}

void randomgen()
{
    ofstream f("date.in");
    int n;
    srand(time(NULL));
    n = rand() % 10 + 3;
    f << n << endl;
    for(int i = 1 ; i <= n ; i++){
        int min = rand() % 5; // melodie de maxim 4 minute
        int sec = rand() % 60; // maxim 59 secunde
        if(min == sec && sec == 0)
            sec++;
        f << min << " " << sec << endl;}
    f.close();
}

int main()
{
    randomgen();
    ifstream f("date.in");
    int n, s;
    f >> n;
    f.get();
    s = rand() % 360 + 60;
    cout << "Secunde alocate " << s << endl;
    song *v = new song[n];
    for(int i = 0 ; i < n ; i++)
        f >> v[i].min >> v[i].sec;
    //conversia melodiilor in secunde
    for(int i = 0 ; i < n ; i++)
        if(v[i].min > 0)
            v[i] = converttosec(v[i]);
    //sortarea melodiilor in functie de cea mai scurta
    qsort(v,n,sizeof(v[0]),cmp);
    //afisarea melodiilor cantate
    for(int i = 0 ; i < n ; i++)
        if(v[i].sec <= s)
            {
                s -= v[i].sec;
                //conversia melodiei inapoi in minute si secunde
                v[i] = converttomin(v[i]);
                cout << v[i].min << " " << v[i].sec << endl;
                
            }
        else break;
    return 0;
}