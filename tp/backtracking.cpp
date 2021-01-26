// NICOI ALEXANDRU - GRUPA 153 - CALCULATOARE SI TEHNOLOGIA INFORMATIEI - TEMA BACKTRACKING

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cstring>

using namespace std;
/*/
// PROBLEMA 1

char **v;
int *s;
int n;

ifstream f("p1.in");
ofstream g("p1.out");

int valid (int k)
{
    for(int i = 1 ; i < k ; i++)
        if(s[k] == s[i])
            return 0;
    return 1;
}

void bk(int k)
{
    for(int i = 1 ; i <= n ; i++)
    {
        s[k] = i;
        if(valid(k))
            if(k == 3){
                for(int j = 1 ; j <= 3 ; j++)
                    g << v[s[j]-1] << " ";
                g << endl;}
            else bk(k+1);
    }
}

int main()
{
    f >> n;
    f.get();
    v = new char*[n];
    s = new int[4];
    fill(s,s + sizeof(s),0);
    for(int i = 0 ; i < n ; i++)
    {
        v[i] = new char[256];
        f.getline(v[i],255);
    }
    f.close();
    bk(1);
    g.close();
    delete v;
    delete s;
    return 0;
}

/*/
//PROBLEMA 3

#include <ctime>
#include <cmath>

ofstream g("p3.out");

int n , *s;

int valid(int k)
{
    for(int i = 1 ; i < k ; i++)
        if(s[i] == s[k])
            return 0;
    return 1;
}

int cond(int k)
{
    for(int i = 1 ; i < k ; i++)
        if(abs(s[i]-s[i+1]) < 2)
            return 0;
    return 1;
}

void afis(int k)
{
    for(int i = 1 ; i <= k ; i++)
        g << s[i] << " ";
    g << endl;
}

void bk(int k)
{
    for(int i = 1 ; i <= n ; i++)
        {
            s[k] = i;
            if(valid(k))
                if(k == n && cond(k))
                    afis(k);
                else bk(k+1);
        }
}

int main()
{
    ofstream out("p3.in");
    srand(time(NULL));
    out << (rand()*rand() % 4 + 4);
    out.close();
    ifstream f("p3.in");
    f >> n;
    f.close();
    s = new int[n+1];
    fill(s, s + sizeof(s), 0);
    bk(1);
    g.close();
    return 0;
}