#include <iostream>
#include <algorithm>
#include <deque>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    int liczba_zestawow_danych; //liczba zestawów danych
    int liczba_porgramow,oplata_za_1min,dodatkowe_min_oplata;  //liczba programow,opłata za pierwszą min,opłata za 
    // dodatkowe minuty;
    int Oplaty=0;
    cin>>liczba_zestawow_danych;
    deque<int> poczatki;
    deque<int> konce;
    int koszt;
    for(int i=0;i<liczba_zestawow_danych;i++){
        cin>>liczba_porgramow>>oplata_za_1min>>dodatkowe_min_oplata;
        for(int j=0;j<liczba_porgramow;j++){
            int pom1,pom2;
            cin>>pom1>>pom2;
            poczatki.push_back(pom1);
            konce.push_back(pom2);
        }
        sort(poczatki.begin(),poczatki.end());
        sort(konce.begin(),konce.end());
        for(int j=0;j<liczba_porgramow;j++){
            koszt=oplata_za_1min+(konce[j]-poczatki[j])*dodatkowe_min_oplata;
            Oplaty+=koszt;
        }
        deque<int>::iterator poczatek;
        poczatek=poczatki.begin();
            for(int ik=konce.size()-1;ik>=0;ik--){
                poczatek=upper_bound(poczatki.begin(),poczatki.end(),konce[ik]);
                if(poczatek!=poczatki.end()){
                    if((*poczatek-konce[ik])*dodatkowe_min_oplata<oplata_za_1min){
                        Oplaty-=oplata_za_1min+(konce[ik]-*poczatek)*dodatkowe_min_oplata;
                        poczatki.erase(poczatek);
                    }else{
                        poczatki.erase(poczatek);
                    }
                }else{
                    continue;
                }
            }
        poczatki.clear();
        konce.clear();
        cout<<Oplaty<<endl;
        Oplaty=0;
    }
    return 0;
}