#include <iostream>
#include <list>

using namespace std;

struct drzewo{
    int i;
    drzewo * ojciec;
    list<drzewo *> synowie;
    bool kamera;
};

drzewo * korzen;

void Wczytywanie_danych_do_drzewa(int liczba_skrzyzowan){
    drzewo ** tab_wierzcholkow;
    tab_wierzcholkow= new drzewo * [liczba_skrzyzowan];

    int x,y;
    for(int i=0;i<liczba_skrzyzowan;i++){
        tab_wierzcholkow[i]= new drzewo;
        tab_wierzcholkow[i]->i=i+1;
        tab_wierzcholkow[i]->kamera=false;
    }
    for(int i=1;i<liczba_skrzyzowan;i++){
        cin>>x>>y;
        tab_wierzcholkow[x-1]->synowie.push_back(tab_wierzcholkow[y-1]);
        tab_wierzcholkow[y-1]->ojciec=tab_wierzcholkow[x-1];
    }
    tab_wierzcholkow[0]->ojciec=NULL;
    tab_wierzcholkow[0]->kamera=true;
    korzen=tab_wierzcholkow[0];
    delete [] tab_wierzcholkow;
}
int Liczenie_odleglosci(drzewo *k){
    int licznik=0;
    drzewo *wsk=k->ojciec;
    while(true){
        if(wsk->kamera){
            break;
        }else{
            licznik++;
            wsk=wsk->ojciec;
        }
    }
    return licznik;
}
void Preorder(drzewo * k,list<int> &wyjscie,int minimum)
{
    if(k!=korzen){ //jeśli jest nie jest ratuszem(korzeniem)
        //if(!k->kamera){
            int licznik=Liczenie_odleglosci(k); //liczy odległość od ostatniej kamery
            if(licznik>0){ //jeśli ojciec nie ma kamery;
                 if(licznik>=3){ //jeśli to jest nte skrzyżowanie bez kamery
                    k->kamera=true; //wstawiamy kamerę
                    wyjscie.push_back(k->i);    //i dajemy ją do wyjścia
                }else if(k->synowie.size()>=minimum-1){ //i zgadza się minimalna ilość dró dochodzących do skrzyżowania
                    k->kamera=true; //wstawiamy kamerę
                    wyjscie.push_back(k->i);    //i wpisujemy skrzyżowanie do wyjścia
                }
            }
        //}
    }else{
        wyjscie.push_back(k->i);    //w Ratuszu zawszę musi być kamera więc dajemy ją
    }
    list<drzewo *>::iterator it;
    it=k->synowie.begin();
    while(it!=k->synowie.end()){
        Preorder(*it,wyjscie,minimum);
        it++;
    }
}
void Kasuj(drzewo *k){  //postorderem kasuje drzewo
        list<drzewo *>::iterator it;
        it=k->synowie.begin();
        while(it!=k->synowie.end()){
            Kasuj(*it);
            it++;
        }
        delete k;
}
int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_skrzyzowan;
    int minmum_drog;
    list<int> wyjscie;
    cin>> liczba_skrzyzowan>>minmum_drog;
    Wczytywanie_danych_do_drzewa(liczba_skrzyzowan);
    Preorder(korzen,wyjscie,minmum_drog);
    Kasuj(korzen);
    wyjscie.sort();
    for(auto &a : wyjscie){
        cout<<a<<" ";
    }
    wyjscie.clear();
    return 0;
}