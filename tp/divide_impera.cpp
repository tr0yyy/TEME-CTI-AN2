// NICOI ALEXANDRU - GRUPA 153 - CALCULATOARE SI TEHNOLOGIA INFORMATIEI - TEMA DIVIDE ET IMPERA

#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;
/*/
//PROBLEMA 1

void divide(int sticla, int st, int dr)
{
	int mij = (st + dr) / 2;
	if (mij > sticla) {
		cout << "Maria a aruncat sticla de la etajul " << mij << " si s-a spart!" << endl;
		divide(sticla, st, mij);
	}
	else if (mij < sticla) {
		cout << "Maria a aruncat sticla de la etajul " << mij << " si nu s-a spart!" << endl;
		divide(sticla, mij + 1, dr);
	}
	else {
		cout << "Maria a gasit etajul maxim, acesta fiind: " << mij << endl;
		exit(0);
	}
}

int main()
{
	srand(time(NULL)); // functie regasita in libraria <ctime> (<time.h> pt C) care face ca rand-ul sa dea valori diferite
					   // la fiecare executie, chiar daca valoarea citita n este aceeasi
	int sticla; // variabila sticla are ca valoare numarul etajului maxim unde sticla nu se sparge
	int n;
	cout << "Numarul de etaje: ";
	cin >> n;
	cout << endl;
	sticla = (rand()*rand()) % n;
	cout << "Etajul maxim de la care poate fi aruncata sticla este " << sticla << endl << endl;
	divide(9, 0, n);
	return 0;
}

/*/

// PROBLEMA 2

struct student
{
	int nr; // numarul de ordine al unui student
	int h;  // inaltimea studentului
};

void interclasare(student t[], int st, int mij, int dr)
{
	int i = st, j = mij + 1, k = 0;
	student *aux = new student[dr - st + 1];
	while (i <= mij && j <= dr)
		if (t[i].h <= t[j].h)
			aux[k++] = t[i++];
		else aux[k++] = t[j++];
	while (i <= mij)
		aux[k++] = t[i++];
	while (j <= dr)
		aux[k++] = t[j++];
	k = 0;
	for (i = st; i <= dr; i++)
		t[i] = aux[k++];
	free(aux);
}

void mergesort(student t[], int st, int dr)
{
	if (st < dr)
	{
		int mij = (st + dr) / 2;
		mergesort(t, st, mij);
		mergesort(t, mij + 1, dr);
		interclasare(t, st, mij, dr);
	}
}

int main()
{
	int n;
	cin >> n;
	student *t = new student[n];
	for (int i = 0; i < n; i++) {
		cout << "Inaltime student " << i + 1 << " : ";
		int x;
		cin >> x;
		t[i].nr = i + 1;
		t[i].h = x;
		cout << endl;
	}
	mergesort(t, 0, n - 1);
	cout << "Solutie: ";
	for (int i = 0; i < n; i++)
		cout << t[i].nr << " ";
	return 0;
}