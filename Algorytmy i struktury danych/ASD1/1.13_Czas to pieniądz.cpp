#include <iostream>
#include <list>

using namespace std;

void Zapelnianie_magazynu_produktami(int **magazyn,int liczba_produktow){
    int ilosc,cena;
    for(int i=0;i<liczba_produktow;i++){
        cin>>ilosc>>cena;
        magazyn[i][0]=ilosc;
        magazyn[i][1]=cena;
    }
}

void Kasowanie_magazynu(int **magazyn,int liczba_produktow){
    for(int i=0;i<liczba_produktow;i++){
        delete [] magazyn[i];
    }
    delete [] magazyn;
}

struct Klient{
    int indeks_klienta;
    double ktory_w_kolejce;
    int portfel;
};

class Kopiec{
public:
    Klient * tablica;
    int rozmiar;
    Kopiec(int liczba_klientow);
    ~Kopiec();
    void push(Klient a);
    void pop();
    void Czy_kopiec();
    bool empty();
    Klient top();
};

Kopiec::Kopiec(int liczba_klientow) {
    tablica= new Klient[liczba_klientow];
    rozmiar=0;
}

Kopiec::~Kopiec() {
    delete [] tablica;
}

bool Kopiec::empty() {
    return rozmiar==0;
}

Klient Kopiec::top() {
    return tablica[0];
}

bool Porownywanie_klientow(Klient a,Klient b){
    if(a.portfel<b.portfel){
        return true;
    }else if(a.portfel==b.portfel){
        return a.ktory_w_kolejce>b.ktory_w_kolejce;
    }else{
        return false;
    }
}

void Kopiec::push(Klient a) {
    int pozycja_wstawianego_elementu=rozmiar++;
    int indeks_ojca=(pozycja_wstawianego_elementu-1)/2;
    if(pozycja_wstawianego_elementu!=0)
        while(pozycja_wstawianego_elementu>0 && Porownywanie_klientow(tablica[indeks_ojca],a)){
            tablica[pozycja_wstawianego_elementu]=tablica[indeks_ojca];
            pozycja_wstawianego_elementu=indeks_ojca;
            indeks_ojca=(pozycja_wstawianego_elementu-1)/2;
        }
    tablica[pozycja_wstawianego_elementu]=a;
}

void Kopiec::pop() {
    Klient a;
    int indeks_lewego_syna,pozycja;
    if(rozmiar--){
        a=tablica[rozmiar];
        pozycja=0;
        indeks_lewego_syna=1;
        while(indeks_lewego_syna<rozmiar){
            if(indeks_lewego_syna+1<rozmiar &&
               Porownywanie_klientow(tablica[indeks_lewego_syna],tablica[indeks_lewego_syna+1])) indeks_lewego_syna++;
            if(Porownywanie_klientow(tablica[indeks_lewego_syna],a)) break;
            tablica[pozycja]=tablica[indeks_lewego_syna];
            pozycja=indeks_lewego_syna;
            indeks_lewego_syna=2*indeks_lewego_syna+1;
        }
        tablica[pozycja]=a;
    }
}

void Kopiec::Czy_kopiec() {
    Klient a;
    int indeks_lewego_syna,pozycja;
    a=tablica[0];
    pozycja=0;
    indeks_lewego_syna=1;
    while(indeks_lewego_syna<rozmiar){
        if(indeks_lewego_syna+1<rozmiar &&
           Porownywanie_klientow(tablica[indeks_lewego_syna],tablica[indeks_lewego_syna+1])) indeks_lewego_syna++;
        if(Porownywanie_klientow(tablica[indeks_lewego_syna],a)) break;
        tablica[pozycja]=tablica[indeks_lewego_syna];
        pozycja=indeks_lewego_syna;
        indeks_lewego_syna=2*indeks_lewego_syna+1;
    }
    tablica[pozycja]=a;
}

void Wstawianie_klientow_do_kolejki(int liczba_klientow,Kopiec &kolejka,list<int> co_chca_kupic []){
    int liczba_porduktow_na_liscie_zakupow,produkt,pieniadze;

    for(int i=0;i<liczba_klientow;i++){
        Klient a;
        cin>>pieniadze;
        a.portfel=pieniadze;
        a.ktory_w_kolejce=i;
        a.indeks_klienta=i;
        cin>>liczba_porduktow_na_liscie_zakupow;
        for(int k=0;k<liczba_porduktow_na_liscie_zakupow;k++){
            cin>>produkt;
            co_chca_kupic[i].push_back(produkt);
        }
        kolejka.push(a);
    }
}


int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_produktow;
    int liczba_klientow,kolej;
    int **magazyn_produktow;
    cin>>liczba_produktow>>liczba_klientow;
    kolej=liczba_klientow;
    list<int> co_chca_kupic[liczba_klientow];
    list<int> co_kupili[liczba_klientow];
    magazyn_produktow= new int * [liczba_produktow];
    for(int i=0;i<liczba_produktow;i++){
        magazyn_produktow[i]= new int[2];
    }
    Zapelnianie_magazynu_produktami(magazyn_produktow,liczba_produktow);
    Kopiec kolejka(liczba_klientow);

    Wstawianie_klientow_do_kolejki(liczba_klientow,kolejka,co_chca_kupic);
    int pom,indeks;
    while (!kolejka.empty()){
        while(true){
            indeks=kolejka.top().indeks_klienta;
            if(co_chca_kupic[indeks].empty()){
                kolejka.pop();
                break;
            }
            pom=co_chca_kupic[indeks].front();
            if(magazyn_produktow[pom][0]>0){
                if(magazyn_produktow[pom][1]<kolejka.tablica[0].portfel){
                    co_kupili[kolejka.top().indeks_klienta].push_back(pom);
                    kolejka.tablica[0].portfel-=magazyn_produktow[pom][1];
                    co_chca_kupic[indeks].pop_front();
                    kolejka.tablica[0].ktory_w_kolejce=kolej++;
                    kolejka.Czy_kopiec();
                    magazyn_produktow[pom][0]--;
                    break;
                }else if(magazyn_produktow[pom][1]==kolejka.tablica[0].portfel){
                    co_kupili[kolejka.top().indeks_klienta].push_back(pom);
                    kolejka.tablica[0].portfel-=magazyn_produktow[pom][1];
                    co_chca_kupic[indeks].pop_front();
                    kolejka.pop();
                    magazyn_produktow[pom][0]--;
                    break;
                }
                else{
                    co_chca_kupic[indeks].pop_front();
                }
            }else{
                co_chca_kupic[indeks].pop_front();
            }
        }
    }
    for(int i=0;i<liczba_klientow;i++){
        if(co_kupili[i].empty()){
            cout<<"-\n";
        }else{
            for(auto a :co_kupili[i]){
                cout<<a<<" ";
            }
            cout<<"\n";
        }
    }
    return 0;
}