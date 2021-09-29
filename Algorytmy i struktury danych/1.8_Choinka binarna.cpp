#include <iostream>
#include <vector>

using namespace std;

int wynik=0;

struct Drzewo_bin{
    Drzewo_bin * lewy;
    Drzewo_bin * prawy;
    int dlugosc;
};

Drzewo_bin * korzen;

void Dodawanie(int a){
    Drzewo_bin ** tab_drzewa;
    tab_drzewa= new Drzewo_bin *[a+1]; //tworzę dynamiczną tablicę wskaźników do drzewa
    int do_ktorego;
    int kogo=1;
    int pom=0;
    int dana;
    for(int i=0;i<=a;i++){  //tworzę węzły 
        tab_drzewa[i]=new Drzewo_bin;
    }
    for(do_ktorego=0;do_ktorego<=a;do_ktorego++){ //odpowiednio je złączam ze sobą 
        if(kogo<=a){
            tab_drzewa[do_ktorego]->lewy=tab_drzewa[kogo];
            kogo++;
            if(kogo<=a){
                tab_drzewa[do_ktorego]->prawy=tab_drzewa[kogo];
                kogo++;
            } else{
                tab_drzewa[do_ktorego]->prawy=NULL;
            }
        }else{
            tab_drzewa[do_ktorego]->lewy=NULL;
            tab_drzewa[do_ktorego]->prawy=NULL;
        }
        if(do_ktorego>0) {
            cin >> dana;
            tab_drzewa[do_ktorego]->dlugosc = dana;
        }
    }
    tab_drzewa[0]->dlugosc=0;// w korzeniu długosc ustawiam na zero
    korzen=tab_drzewa[0];//ustawiam korzen
    delete [] tab_drzewa; //kasuje tablicę bez usuwania węzłów 
}
void Kasuj(Drzewo_bin *k){//kasuje postorderem
    if(k){
        Kasuj(k->lewy);
        Kasuj(k->prawy);

        delete k;
    }
}

void postorder(Drzewo_bin * k,int dlug,vector <int> &obliczeniowy){
    vector<int> l,p; //w tych wektorach zapisują się tymczasowo dane z lewgo i prawego węzła 
    //postorderem rozwiązuje zadanie
    if(k->lewy!=NULL)
        postorder(k->lewy,dlug,l);
    if(k->prawy!=NULL)
        postorder(k->prawy,dlug,p);
    vector<int>::iterator it;
    if(!(k==korzen)) { //jesli korzen to pomijam ddawanie do wektora 
        if (k->dlugosc > dlug) {}
        else if (k->dlugosc == dlug) {
            wynik++;
        } else {
            obliczeniowy.push_back(k->dlugosc);
        }
    }
    for(auto &a : p){//patrze czy suma z lewej i prawej tablicy są równe długości lampek
        for(auto &b : l){
            if(a+b==dlug)
                wynik++;
        }
    }
    if(!(k==korzen)) {//jeśli korzen pomijam dodawanie elementów do wektora obliczeniowego
        if (k->lewy != NULL) { //patrzę czy jest lewy węzęł 
            it=l.begin();
            while( it < l.end()) { //jeśli tak patrzę czy
                if (*it + k->dlugosc == dlug) {// czy suma długosci + elementu z lewje tablicy jest równa 
                    wynik++;    //jeśli tak wynik zwiększam o jeden
                    l.erase(it);    //i kasuje element z tablicy
                } else if (*it + k->dlugosc > dlug) {
                    l.erase(it); //jesli jest większa suma od długosci kasuje element
                } else { //mniejsza suma to doaje do wartości długośc tego węzła
                    *it = *it + k->dlugosc;
                    it++;
                }
            }
        }
        //analogicznie robię z prawą tablica 
        if (k->prawy != NULL) {
            it = p.begin();
            while (it < p.end()) {
                if (*it + k->dlugosc == dlug) {
                    wynik++;
                    p.erase(it);
                } else if (*it + k->dlugosc > dlug) {
                    p.erase(it);
                } else {
                    *it = *it + k->dlugosc;
                    it++;
                }
            }
        }
        //przepisuje lewą i prawą tablicę do tablicy obliczeniwej
        for (auto &a : p) {
            obliczeniowy.push_back(a);
        }
        for (auto &a : l) {
            obliczeniowy.push_back(a);
        }
    }
    }
void Liczenie(int dlug){
    vector <int> a;
    postorder(korzen,dlug,a);
}

int main() {
    std::ios_base::sync_with_stdio(false);
    int t, a,k;
    cin>>t;
    for(int i=0;i<t;i++) {
        cin >> a >> k;
        Dodawanie(a);
        Liczenie(k);
        cout  << wynik<< endl;
        Kasuj(korzen);
        wynik=0;
    }
    return 0;
}