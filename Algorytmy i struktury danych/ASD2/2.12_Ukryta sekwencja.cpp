#include <iostream>
#include <deque>

using namespace std;

int H(deque<int>::iterator poczatek, deque<int>::iterator koniec){  //funkcja haszująca
    int h=0;
    while(poczatek<koniec){
        h=h+(*poczatek);
        poczatek++;
    }
    return h%200;
}

int main() {
    std::ios_base::sync_with_stdio(false);
    int v; //ilość liczb w aktualnym okresie
    int p; // liczba liczb reprezentujących subsekwencje
    cin>>v;
    deque<int> lista,subsekwencjaX;
    int pom;
    for(int i=0;i<v;i++){
        cin>>pom;
        lista.push_back(pom);
    }
    cin>>p;
    for(int i=0;i<p;i++){
        cin>>pom;
        subsekwencjaX.push_back(pom);
    }

    int wartosc_h_subsekwencjiX=H(subsekwencjaX.begin(),subsekwencjaX.end());
    int polozenie1=0,polozenie2=0,licznik=0;

    deque<int>::iterator sx=lista.begin();
    int dwa_polozenia=0;
    while(sx+p-2<lista.end()){
       // cout<<*sx<<" "<<*(sx+p-1)<<endl;
        pom=H(sx,sx+p);
        if(wartosc_h_subsekwencjiX==pom){
            bool tak= true;
            for(int i=0;i<subsekwencjaX.size();i++){
                if(subsekwencjaX[i]!=*(sx+i)){
                    tak = false;
                    break;
                }
            }
            if(tak){
                polozenie1=polozenie2;
                polozenie2=licznik;
                dwa_polozenia++;

            }
        }
        if(dwa_polozenia==2){
            break;
        }
        sx++;
        licznik++;
    }
    //polozenie1=polozenie1+polozenie2-lista.size();
    while(polozenie1<v){
        pom=polozenie2;
        polozenie2=polozenie1+polozenie2;
        polozenie1=pom;
    }
    cout<<polozenie1-v;
    return 0;
}