#include <iostream>
#include <math.h>

using namespace std;

/*double butelka(double cm) {
    return 10 - (cm-2) * (cm-2);
}*/
double powierzchnia_trapezu(double a,double b,double h){
    return ((a+b)*h)/2;
}
double Obliczanie_objetosci(double j){
    double n=0.005;
    double pkt1,pkt2;
    double powierzchnia=0;
    pkt1=0;
    pkt2=pkt1+n;
    //obliczanie z wzoru V=PI*(a^2+b^2)*h/2
    while(true){

        if(pkt2>j){
            if(pkt1<j){
                powierzchnia+=powierzchnia_trapezu(pow(butelka(pkt1),2)/*a^2*/,pow(butelka(j),2)/*b^2*/,j-pkt1);
            }
            break;
        }else{
            powierzchnia+=powierzchnia_trapezu(pow(butelka(pkt1),2)/*a^2*/,pow(butelka(pkt2),2)/*b^2*/,pkt2-pkt1);
        }
        pkt1=pkt2;
        pkt2=pkt2+n;
    }
    return M_PI*powierzchnia;
}

int main() {
    std::ios_base::sync_with_stdio(false);
    double pojemnosc_akwarium,pom;
    int liczba_butelek;
    cin>>pojemnosc_akwarium;    //zczytywanie x
    cin>>pom;   //y
    pojemnosc_akwarium=pojemnosc_akwarium*pom;
    cin>>pom;   //z
    pojemnosc_akwarium=pojemnosc_akwarium*pom;
    cin>>pom; //stopien wypełnienia akwarium;
    pojemnosc_akwarium=pojemnosc_akwarium*(1-pom);  //liczenie ile zostało miejsca w akwarium
    cin>>liczba_butelek;
    int i;
    for(i=0;i<liczba_butelek;i++){
        cin>>pom;
        pojemnosc_akwarium-=Obliczanie_objetosci(pom);
        if(pojemnosc_akwarium<0){
            cout<<(i+1);
            break;
        }
    }
    if(i==liczba_butelek){
        cout<<"NIE";
    }
    return 0;
}