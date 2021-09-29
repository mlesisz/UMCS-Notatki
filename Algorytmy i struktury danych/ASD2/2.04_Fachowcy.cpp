#include <iostream>
#include <vector>
#include <queue>

using namespace std;

/*unsigned long zapytajJanusza(unsigned id) {
    unsigned long value = 0;
    switch( id ) {
        case 3:
            value = 7;
            break;
        case 5:
            value = 9;
            break;
    }
    return value;
}*/

struct Krawedz{
    int v2;//do kogo
    int przepustowosc_kanalu;   // ile makxymalenie moze przeplynac przez krawedz
    int przeplyw_w_kanale;
};

class Graf{
private:
    int liczba_wezlow;
    vector< Krawedz> * Sasiedzi;
    int * poprzednicy;
    int * przepustowaosc;   //tablica przepustowosci rezydualnych dla sciezek
    int  maksymalny_przeplyw;
public:
    Graf(int liczba_wezlow){
        this->liczba_wezlow=liczba_wezlow;
        Sasiedzi= new vector< Krawedz>[liczba_wezlow];
        poprzednicy= new int [liczba_wezlow];
        przepustowaosc= new int [liczba_wezlow];
    }
    void Dodaj(int v1,int v2, int przepustowosc){
        Krawedz  b;
        b.v2=v2;
        b.przepustowosc_kanalu=przepustowosc;
        b.przeplyw_w_kanale=0;
        Sasiedzi[v1].push_back(b);
    }
    bool Algorytm_Edmondsa_Karpa(int zrodlo,int ujscie){
        maksymalny_przeplyw=0;

        bool test= false;   //zmienna zapamietujaca czy jest sciezka od zrodla do ujscia
        int u,cp,i,v;
        //zeruje przeplywy dla kazdej krawedzi
        //tzn. jeszcze przez nie nic nie plynie
        for(u=0;u<liczba_wezlow;++u){
            for(i=0;i<Sasiedzi[u].size();++i){
                Sasiedzi[u][i].przeplyw_w_kanale=0;
            }
        }
        while(true){
            queue<int> kolejka;
            for(int i=0;i<liczba_wezlow;++i){
                poprzednicy[i]=-1;
            }

            przepustowaosc[zrodlo]=2147483647;

            kolejka.push(zrodlo);
            //szukanie sciezki od zrodla do ujscia
            while (!kolejka.empty()){
                test= false;    //brak sciezki
                u=kolejka.front(); kolejka.pop();

                for(auto &xd :Sasiedzi[u]){
                    //wyznaczam przepustowosc rezydualna kanalu
                    cp=xd.przepustowosc_kanalu-xd.przeplyw_w_kanale;

                    if(cp && (poprzednicy[xd.v2]==-1)){
                        //zapamietuje poprzednika
                        poprzednicy[xd.v2]=u;
                        //licze przepustowosc rezydualna do v2
                        przepustowaosc[xd.v2]=cp<przepustowaosc[u] ? cp : przepustowaosc[u];

                        if(xd.v2==ujscie){  //jesli ujscie to:
                            test= true;     //znalezlismy scieszke
                            break;          //wychodze z petli
                        }else{
                            kolejka.push(xd.v2);    //jesli nie wstawiam v2 do kolejki
                        }
                    }
                }
                if(test) break;//jest sciezka i wychodze z drugiej petli
            }
            if(!test)   //nie istnieje sciezka koncze algorytm dla danego ujscia
                return false;
            //zwiekszam maksymalny przeplyw i sprawdzam czy juz jest odpowiedni wedlug Janusza
            maksymalny_przeplyw+=przepustowaosc[ujscie];
            if(maksymalny_przeplyw>=zapytajJanusza(ujscie)){
                return true;
            }
            //cofam sie po sciezce i zwiekszam przeplyw dla danej scieszki
            for(v=ujscie;v!=zrodlo;v=u){
                u=poprzednicy[v];
                for(auto &xd : Sasiedzi[u]){
                    if(xd.v2==v){
                        xd.przeplyw_w_kanale+=przepustowaosc[ujscie];
                        break;
                    }
                }
            }
        }
    }
    int fmax(){
        return maksymalny_przeplyw;
    }
    void Obliczenia(int zrodlo){
        for(int i=liczba_wezlow-1;i>=0;--i){
            if(Sasiedzi[i].empty()){
                if(!Algorytm_Edmondsa_Karpa(zrodlo,i)){
                    cout<<i<<" NIE "<<fmax()<<"\n";
                }else{
                    cout<<i<<" OK\n";
                }
            }
        }
    }
};

int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_wezlow,liczba_polaczen,wezel_poczatkowy;
    int v1,v2,wydajnosc;
    cin>>liczba_wezlow>>liczba_polaczen>>wezel_poczatkowy;
    Graf a(liczba_wezlow);
    for(int i=0;i<liczba_polaczen;++i){
        cin>>v1>>v2>>wydajnosc;
        a.Dodaj(v1,v2,wydajnosc);
    }
    a.Obliczenia(wezel_poczatkowy);
    return 0;
}