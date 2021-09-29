#include <iostream>
#include <deque>
#include <queue>
#include <utility>

using namespace std;

class Graf{
    typedef pair<int,double> Para;
    int ilosc_wezlow;
    deque<pair<int,double>> * Sasiedzi;
    double * d;
public:
    Graf(int liczba_wezlow){
        this->ilosc_wezlow=liczba_wezlow;
        Sasiedzi= new deque<Para> [liczba_wezlow];
        d= new double [liczba_wezlow];
    }
    void Dodaj(int w,int e, double waga1, double waga2){
        Sasiedzi[w].push_back(make_pair(e,waga1));
        Sasiedzi[e].push_back(make_pair(w,waga2));
    }
    void algDjkstry(int v){
        for(int i=0;i<ilosc_wezlow;i++) d[i]= 2147483647;   // Ustawiam wszystkie wartości w tablicy d.

        d[v]=0;     //W punkcie od ktorego mierze odleglosci ustawiam odleglosc 0.

        priority_queue <Para,deque<Para>,greater<Para>> Kolejka;    //tworze kojekę piorytetowa par

        Kolejka.push(make_pair(v,0));   //dodaje pkt początkowy

        while(!Kolejka.empty()){    //algorytm wykonuje sie dopóki kolejka nie jest pusta
            int pom=Kolejka.top().first;    //zczytueje pkt pierwszy
            Kolejka.pop();                  //i kasuje go z kolejki

            int i=0;
            while(i<Sasiedzi[pom].size()){  //bierzemy kazdego sasiada pom
                int p=Sasiedzi[pom][i].first;
                double waga=Sasiedzi[pom][i].second;

                if(d[p]>d[pom]+waga){   //sprawdzamy czy odleglosc jest krotsza jesli tak:
                    d[p]=d[pom]+waga;   //podmieniamy odleglosc na nowa
                    Kolejka.push(make_pair(p,d[p]));    //dodajemy sasiada do kolejki 
                }
                ++i;
            }
        }
    }
    double Wartoscw_d(int v){
        return d[v];
    }
};

int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_wezlow; //sklepow+ dom
    int liczba_sciezek;
    int liczba_sklepow_do_odwiedzenia;
    double srednia_kosztow=0;
    double wartosc_za_minute= 0.18;
    double wartosc_za_kilometr=0.49;
    int pierwszy_wezel,drugi_wezel;
    double minuty,kilometry,waga1,waga2;
    cin>> liczba_wezlow>>liczba_sciezek;
    Graf a(liczba_wezlow);
    Graf b(liczba_wezlow);
    for(int i=0;i<liczba_sciezek;++i){
        cin>>pierwszy_wezel>>drugi_wezel;
        cin>>kilometry>>minuty;
        waga1=minuty*wartosc_za_minute+kilometry*wartosc_za_kilometr;
        cin>>kilometry>>minuty;
        waga2=minuty*wartosc_za_minute+kilometry*wartosc_za_kilometr;
        a.Dodaj(pierwszy_wezel,drugi_wezel,waga1,waga2);
        b.Dodaj(pierwszy_wezel,drugi_wezel,waga2,waga1);
    }
    a.algDjkstry(0);
    b.algDjkstry(0);
    cin>>liczba_sklepow_do_odwiedzenia;
    int gdzie_jedziemy;
    for(int i=0;i<liczba_sklepow_do_odwiedzenia;i++){
        cin>>gdzie_jedziemy;
        srednia_kosztow+=a.Wartoscw_d(gdzie_jedziemy);
        srednia_kosztow+=b.Wartoscw_d(gdzie_jedziemy);
    }
    srednia_kosztow=srednia_kosztow/liczba_sklepow_do_odwiedzenia;
    printf("%.3f",srednia_kosztow);
    return 0;
}