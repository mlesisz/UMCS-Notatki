#include <iostream>
#include <deque>

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

    bool algorytm_Forda_Belmana(int v){
        for(int i=0;i<ilosc_wezlow;++i) d[i]= 2147483647;   // Ustawiam wszystkie wartości w tablicy d.

        d[v]=0;     //W punkcie od ktorego mierze odleglosci ustawiam odleglosc 0.

        int i,x;
        bool test;

        for(i=0;i<ilosc_wezlow/2;++i){
            test=true;
            x=0;
            while(x<ilosc_wezlow){
                for(int k=0;k<Sasiedzi[x].size();++k){
                    if(d[Sasiedzi[x][k].first]>d[x]+Sasiedzi[x][k].second){
                        test=false;
                        d[Sasiedzi[x][k].first]=d[x]+Sasiedzi[x][k].second;
                    }
                }
                ++x;
            }
            if(test) return true;
        }

        //sprawdzamy czy jest cykl ujemny
        x=0;
        while(x<ilosc_wezlow){
            i=0;
            while(i<Sasiedzi[x].size()){
                if(d[Sasiedzi[x][i].first]>d[x]+Sasiedzi[x][i].second){
                    return false;
                }
                ++i;
            }
            ++x;
        }
        /*for(x=0;x<ilosc_wezlow;++x){
            for(int k=0;k<Sasiedzi[x].size();++k){
                if(d[Sasiedzi[x][k].first]>d[x]+Sasiedzi[x][k].second){
                    return false;
                }
            }
        }*/

        return true;
    }
    void Wyswietl(){
        for(int i=0;i<ilosc_wezlow;i++){
            for(int k=0;k<Sasiedzi[i].size();k++){
                cout<<i<<" "<<Sasiedzi[i][k].first<<" "<<Sasiedzi[i][k].second;
            }
            cout<<endl;
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
    double minuty,kilometry,waga1,waga2,ewentualny_zarobek;
    cin>> liczba_wezlow>>liczba_sciezek;
    Graf a(liczba_wezlow);
    Graf b(liczba_wezlow);
    for(int i=0;i<liczba_sciezek;++i){
        cin>>pierwszy_wezel>>drugi_wezel;
        cin>>kilometry>>minuty>>ewentualny_zarobek;
        waga1=minuty*wartosc_za_minute+kilometry*wartosc_za_kilometr-ewentualny_zarobek;
        cin>>kilometry>>minuty>>ewentualny_zarobek;
        waga2=minuty*wartosc_za_minute+kilometry*wartosc_za_kilometr-ewentualny_zarobek;
        a.Dodaj(pierwszy_wezel,drugi_wezel,waga1,waga2);
        b.Dodaj(pierwszy_wezel,drugi_wezel,waga2,waga1);
    }
    //a.Wyswietl();
    //b.Wyswietl();
    bool ciagly_profit=false;
    if(!a.algorytm_Forda_Belmana(0) || !b.algorytm_Forda_Belmana(0)){
        ciagly_profit=true;
    }
    //cin>>liczba_sklepow_do_odwiedzenia;
    int gdzie_jedziemy;
    /*for(int i=0;i<liczba_sklepow_do_odwiedzenia;++i){
        cin>>gdzie_jedziemy;
        srednia_kosztow+=a.Wartoscw_d(gdzie_jedziemy);
        srednia_kosztow+=b.Wartoscw_d(gdzie_jedziemy);
    }*/
    if(!ciagly_profit){
        cin>>liczba_sklepow_do_odwiedzenia;
        for(int i=0;i<liczba_sklepow_do_odwiedzenia;++i){
            cin>>gdzie_jedziemy;
            srednia_kosztow+=a.Wartoscw_d(gdzie_jedziemy);
            srednia_kosztow+=b.Wartoscw_d(gdzie_jedziemy);
        }
        srednia_kosztow=srednia_kosztow/liczba_sklepow_do_odwiedzenia;
        printf("%.3f",srednia_kosztow);
    }else{
        cout<<"DO DOMU!";
    }
    return 0;
}