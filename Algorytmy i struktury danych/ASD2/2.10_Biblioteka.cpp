#include <iostream>
#include <string>
#include <deque>

using namespace std;

int H(string nazwa_dziela){
    int h = 0;
    for(auto i:nazwa_dziela){
        h=h+i;
    }
    return h%200;
}

struct Para{
    string nazwa_dziela;
    string polozenie;
};

int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_rozkazow;
    cin>>liczba_rozkazow;
    string nazwa_dziela,polozenie;
    char rozkaz;
    deque<Para> * tablica;
    tablica= new deque<Para> [200];
    for(int i =0;i<liczba_rozkazow;i++){
        cin>>rozkaz>>nazwa_dziela;
        if(rozkaz=='A'){
            cin>>polozenie;
            int pst=H(nazwa_dziela);
            Para z;
            z.nazwa_dziela=nazwa_dziela;
            z.polozenie=polozenie;
            tablica[pst].push_back(z);
        }else{
            //szukanie dzieła 
            int pst=H(nazwa_dziela);
            bool czy_nie_jest= true;
            for(auto a: tablica[pst]){
                if(a.nazwa_dziela==nazwa_dziela){
                    polozenie=a.polozenie;
                    czy_nie_jest=false;
                    break;
                }
            }
            if(czy_nie_jest){
                cout<<"-\n";
            } else{
                cout<<polozenie<<"\n";
            }
        }
    }
    return 0;
}