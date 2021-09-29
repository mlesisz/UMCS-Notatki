#include <iostream>
#include <stdlib.h>
#include <time.h>

using namespace std;

/*int Grazyna(int HH, int mm){
    if(HH >= 8 && HH < 15) return 0;
    else if(HH >= 15 && HH < 22) return 1;
    return 2;
}*/

int main() {
    std::ios_base::sync_with_stdio(false);
    float * wyniki_losowan= new float [6];
    for(int i=0;i<6;i++){
        wyniki_losowan[i]=0;
    }
    int Co_szukamy;
    int gdzie_wylosowalo;
    int minuty_poczatek;
    int minuty_koniec;
    int pomocnicza;
    char dwukropek;
    cin>>pomocnicza>>dwukropek>>minuty_poczatek;
    minuty_poczatek+=(pomocnicza*60);
    cin>>pomocnicza>>dwukropek>>minuty_koniec;
    cin>>Co_szukamy;
    if(minuty_koniec==0){
        minuty_koniec+=(pomocnicza*60)-1;
    }else{
        minuty_koniec+=(pomocnicza*60);
    }
    srand(time(NULL));
    int liczba_losowan=1000000;
    int zakres_losowan=minuty_koniec-minuty_poczatek;
    for(int i=0;i<liczba_losowan;i++){
        gdzie_wylosowalo=(rand() % zakres_losowan) + minuty_poczatek;
        pomocnicza=Grazyna(gdzie_wylosowalo/60,gdzie_wylosowalo-(gdzie_wylosowalo/60)*60);
        wyniki_losowan[pomocnicza]+=1;
    }

    float wynik_ostateczny=wyniki_losowan[Co_szukamy]/liczba_losowan;
    printf("%.2f",wynik_ostateczny);
    return 0;
}