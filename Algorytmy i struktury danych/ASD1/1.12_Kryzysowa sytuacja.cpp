#include <iostream>
#include <list>

using namespace std;

double ** tablica;

void Wypelnianie_skrzynek(int liczba_dostarczonych_skrzynek,int ilosc_butelek_w_skrzynce){
    double pomocnicza;
    tablica= new double *[liczba_dostarczonych_skrzynek];
    for(int i=0;i<liczba_dostarczonych_skrzynek;i++){
        tablica[i]=new double [ilosc_butelek_w_skrzynce+1];
        tablica[i][0]=0;
    }
    for(int i=0;i<liczba_dostarczonych_skrzynek;i++){
        for(int j=1;j<ilosc_butelek_w_skrzynce+1;j++){
            cin>>pomocnicza;
            tablica[i][j]=pomocnicza;
            tablica[i][0]+=pomocnicza;
        }
    }
}
void Kasowanie_tablicy(int liczba_dostarczonych_skrzynek){
    for(int i=0;i<liczba_dostarczonych_skrzynek;i++){
        delete [] tablica[i];
    }
    delete [] tablica;
}

void Sortowanie_przez_wstawianie(double ** tablica,int rozmiar){
    double *temp=new double;
    int j;
   for(int i=1;i<rozmiar;i++){
       temp=tablica[i];
       for(j=i-1;j>=0 && *tablica[j]<*temp;j--){
           tablica[j+1]=tablica[j];
       }
       tablica[j+1]=temp;
   }
}

void Sortowanie_kubelkowe(double **tablica,int ilosc_skrzynek,int ilosc_butelek,int ladowanosc_samolotu){
    double *** kubelki;
    int rozmiar[ilosc_skrzynek];
    int pozycja[ilosc_skrzynek];
    int indeks;
    int ile_w_ladowni=0;
    kubelki= new double **[ilosc_skrzynek];
    for(int i=0;i<ilosc_skrzynek;i++){
        pozycja[i]=0;
        rozmiar[i]=5;
        kubelki[i]=new double *[5];
    }
    for(int i=0;i<ilosc_skrzynek;i++){
        indeks=(int)tablica[i][0]*(ilosc_skrzynek-1)/ilosc_butelek;
        if(pozycja[indeks]<rozmiar[indeks]){
            kubelki[indeks][pozycja[indeks]]=tablica[i];
            pozycja[indeks]++;
        }else{
            double ** pomocnicza=new double *[(rozmiar[indeks]*2)];
            rozmiar[indeks]=rozmiar[indeks]*2;
            for(int m=0;m<=pozycja[indeks];m++){
                pomocnicza[m]=kubelki[indeks][m];
            }
            pomocnicza[pozycja[indeks]]=tablica[i];
            pozycja[indeks]++;
            delete [] kubelki[indeks];
            kubelki[indeks]=pomocnicza;
        }
    }
    for(int i=ilosc_skrzynek-1;i>=0 && ile_w_ladowni<=ladowanosc_samolotu;i--){
        ile_w_ladowni+=pozycja[i];
        Sortowanie_przez_wstawianie(kubelki[i],pozycja[i]);
    }
    indeks=0;
    for(int i=ilosc_skrzynek-1;i>=0;i--){
        for(int j=0;j<pozycja[i];j++){
            tablica[indeks]=kubelki[i][j];
            indeks++;
        }
    }
}

int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_dostarczonych_skrzynek;
    int ilosc_butelek_w_skrzynce,pojemnosc_ladowni_samolotu;
    cin>>liczba_dostarczonych_skrzynek;
    cin>>ilosc_butelek_w_skrzynce;
    cin>>pojemnosc_ladowni_samolotu;
    Wypelnianie_skrzynek(liczba_dostarczonych_skrzynek,ilosc_butelek_w_skrzynce);
    Sortowanie_kubelkowe(tablica,liczba_dostarczonych_skrzynek,ilosc_butelek_w_skrzynce,pojemnosc_ladowni_samolotu);
    for(int i=0;i<pojemnosc_ladowni_samolotu;i++){
        for(int j=1;j<ilosc_butelek_w_skrzynce+1;j++){
            cout<<tablica[i][j]<<" ";
        }
        cout<<"\n";
    }
    Kasowanie_tablicy(liczba_dostarczonych_skrzynek);
    return 0;
}