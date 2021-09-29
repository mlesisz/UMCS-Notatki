#include <iostream>
#include <deque>
#include <queue>
using namespace std;

struct Krawedz{
    int v1,v2;
    int waga;
};

struct Porownywanie{    //rosnaco
    bool operator()(const Krawedz & Krawedz_1,const Krawedz & Krawedz_2){
        if(Krawedz_1.waga>Krawedz_2.waga) return true;
        if(Krawedz_1.waga<Krawedz_2.waga) return false;
        return false;
    }
};

typedef priority_queue<Krawedz,deque<Krawedz>,Porownywanie> Kolejka_piorytetowa;



//struktura zbiorow rozlacznych
class Zbiory_rozloczne{
private:
    int * tab,* ile;
public:
    Zbiory_rozloczne(int n){
        tab= new int[n];    //tablica w ktorej sa przechowywane wartosci do ktorego nalezy drzewa dany wierzcholek
        ile= new int[n];    //ile jest elementow w danym drzewie
        for(int i=0;i<n;i++){
            tab[i]=i;
            ile[i]=1;
        }
    }
    ~Zbiory_rozloczne(){
        delete [] tab;
        delete [] ile;
    }
    //zwraca indeks reprezentanta zbioru ,w ktorym jest v
    int Find(int v){
        if(tab[v]==v) return v;
        int fv= Find(tab[v]);
        tab[v]=fv;
        return fv;
    }
    //laczy zbiory v i e
    bool Union(Krawedz e){
        int fa=Find(e.v1);
        int fb=Find(e.v2);
        if(fa!=fb){
            if(ile[fa]<=ile[fb]){
                ile[fb]+=ile[fa];
                tab[fa]=fb;
            }else{
                ile[fa]+=ile[fb];
                tab[fb]=fa;
            }
            return true;
        }else{
            return false;
        }
    }
};

int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_stanowsik,liczba_polaczen,a,b,waga;
    cin>>liczba_stanowsik>>liczba_polaczen;
    int stanowiska_interesujace[liczba_stanowsik];
    int dodatkowe_koszty=0;
    bool czy_w_drzewie[liczba_stanowsik];
    int licznik_interesujacych_stanowsik=0;
    for(int i=0;i<liczba_stanowsik;i++){
        cin>>stanowiska_interesujace[i];
        if(stanowiska_interesujace[i]==1) licznik_interesujacych_stanowsik++;
        czy_w_drzewie[i]= false;
    }
    Zbiory_rozloczne z(liczba_stanowsik);
    Kolejka_piorytetowa kolejka;
    deque<Krawedz> drzewo;
    //zczytuje krawedzie i zapisuje tylko potrzebne do kolejki
    for(int i=0;i<liczba_polaczen;i++){
        cin>>a>>b>>waga;
        if(stanowiska_interesujace[a]==1 && stanowiska_interesujace[b]==1){
            Krawedz kr;
            kr.v1=a;
            kr.v2=b;
            kr.waga=waga;
            kolejka.push(kr);
        }
    }

    Krawedz kr;
    while(!kolejka.empty()){
        kr=kolejka.top();
        kolejka.pop();
        if(z.Union(kr)){    //zwraca true jesli poloczy odzielne drzewa
            drzewo.push_back(kr);   //dodaje ta krawedz do zbioru krawedzi drzewa
        }
    }
    for(Krawedz n : drzewo){
        dodatkowe_koszty+=n.waga;   //sumuje koszty
    }
    cout<<dodatkowe_koszty;
    return 0;
}