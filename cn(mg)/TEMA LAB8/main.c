// compile:
// gcc -o shannon shannon.c -lm
// run:
// ./shannon tom_sawyer_intro_mini.txt

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

// numele fisierului este specificat la rulare
FILE *citire_fisier(char *nume_fisier){
    FILE *in = fopen(nume_fisier, "r");
    return in;
}

// determin lungimea fisierului
int fileLength(FILE *inFile) {
    fseek(inFile, 0, SEEK_END);
    int len = ftell(inFile);
    rewind(inFile);
    return len;
}

// aloc memorie pentru a incarca continutul fisierului in "buffer"
void allocate(int len, char **buffer, FILE *inFile){
    if(((*buffer)=malloc(len*sizeof(char)))==NULL) {
        printf("Eroare alocare memorie\n");
        exit(0);
    }
    fread((*buffer), len, 1, inFile);
    fclose(inFile);
}

// afisez codurile  ASCII ale primelor 10 caractere din text
void printFirstTenASCII(const char *buffer) {
    for (int i = 0; i < 10; i++) {
        printf("%i \n", *(buffer + i));
    }
}

// array nr. de aparitii N_ap pentru fiecare caracter (coduri ASCII intre 0 si 127)
void arrayCountingChar(int n, int **n_ap, const char *buffer, int len){
    (*n_ap) = (int*)malloc(n * sizeof(int));
    // initializare
    for (int i = 0; i < n; i++) {
        (*n_ap)[i] = 0;
    }

    // incrementez nr de aparatii pentru fiecare caracter N_ap[j]
    for (int i = 0; i < len; i++) {
        int j = *(buffer+i);
        (*n_ap)[j] = (*n_ap)[j] + 1;
    }
}

// calculez probabilitatea de aparitie a unui caracter = nr. aparitii / nr. total caractere
void arrayProb(int n, float **p, const int *N_ap, int len){
    (*p) = malloc( n*sizeof(float)); // probabilitatea de aparitie

    // calculez probabilitatea de aparitie a unui caracter = nr. aparitii / nr. total caractere
    for (int i = 0; i < n; i++) {
        (*p)[i] = (float)N_ap[i] / (float)len;
        if ((*p)[i]!=0)
            printf( "%i %4.14f\n", i, (*p)[i]);
    }

}

float Entropy(float *p, int n){
    float Info = 0.;
    for (int i = 0; i < n; i++) {
        if (p[i] != 0.) {
            Info = Info - p[i] * log(p[i]) / log(2.0);
        }
    }
    return Info;
}

int main( int argc, char **argv)
{
    int len, N;
    int *N_ap;
    float Info;
    float *p;
    char *buffer;

    FILE *inFile = citire_fisier(argv[1]);
    len = fileLength(inFile);
    allocate(len, &buffer, inFile);
    printFirstTenASCII(buffer);
    N = 128;
    arrayCountingChar(N, &N_ap, buffer, len);  // nr. de aparatii
    arrayProb(N, &p, N_ap, len);
    Info = Entropy(p, N);

    // Afisez Informatia Shannon
    // Rezultatul (4.23) reprezinta informatia medie masurata in bits pe care o
    // primesc cand aflu un caracter nou din text
    printf( "Info = %.14f \n", Info);


    free(buffer);
    free(N_ap);
    free(p);

    return 0;

}

/*
     semnalul de test (mytext1.txt)              Info = 2.80004477500916
     semnalul de test (mytext.txt)              Info = 3.13817763328552
     text in lb. Engleza (tom_sawyer_intro_mini) Info = 4.23109102249146
     stire in lb. Romana (ziare.txt)             Info = 4.25613021850586
     lore ipsum                                  Info = 4.24875879287720
    
*/

//-------------------------------------------------------------/