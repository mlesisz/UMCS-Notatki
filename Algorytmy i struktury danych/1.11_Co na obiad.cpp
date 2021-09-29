#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
int wynik;
void Liczenie(vector<int> &produkty,int suma,int ktory,int liczba_kalorii){
    if(suma>liczba_kalorii){
        return;
    }
    if(suma==liczba_kalorii){
        wynik++;
        return;
    }
    for(int i=ktory;i<produkty.size();i++){
            suma+=produkty[i];
            Liczenie(produkty,suma,i+1,liczba_kalorii);
            suma-=produkty[i];
    }
}
int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_testow;
    int liczba_produktow;
    int liczba_kalorii;
    int produkt;
    wynik=0;
    vector<int> produkty;
    cin>>liczba_testow;
    for(int i=0;i<liczba_testow;i++){
        cin>>liczba_produktow;
        for(int m=0;m<liczba_produktow;m++){
            cin>>produkt;
            produkty.push_back(produkt);
        }
        cin>>liczba_kalorii;
        sort(produkty.begin(),produkty.end(),greater<int>());
        Liczenie(produkty,0,0,liczba_kalorii);
        cout<<wynik<<endl;
        produkty.clear();
        wynik=0;
    }
    return 0;
}