#include <iostream>
#include <deque>
#include <math.h>
#include <algorithm>

using namespace std;

struct Samolot{
    int numer_identyfikacyjny;
    int x,y;
};

struct Odcinek{
    Samolot *a,*b;
    double odleglosc;
};

double odleglosc(Samolot *a, Samolot *b){
    return sqrt(pow(a->x-b->x,2)+pow(a->y-b->y,2));
}

bool jak_sortowacX(Samolot * a,Samolot *b){
    if(a->x<b->x){
        return true;
    }else if(a->x==b->x){
        if(a->numer_identyfikacyjny<b->numer_identyfikacyjny){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

Odcinek Dziel_i_Zwyciezaj1(deque<Samolot *>::iterator poczatek, deque<Samolot *> ::iterator koniec){
    //licze ile jest samolotow
    int liczba_elementow=distance(poczatek,koniec);
    Odcinek z;
    //jesli jeden daje na wynik "odcinek" z jednym samolotem z odległością = nieskończoność 
    if(liczba_elementow==1){
        z.odleglosc=1.79769e+308;
        z.a=*poczatek;
        z.b=NULL;
        //jeśli są dwa: liczę odległość i daje na wyjśćiu wynik
    }else if(liczba_elementow==2){
        z.odleglosc=odleglosc(*poczatek,*(poczatek+1));
        //patrzę który samolot ma mniejszy numer i go daje na pierwszym miejscu
        if((*poczatek)->numer_identyfikacyjny<(*(poczatek+1))->numer_identyfikacyjny){
            z.a=*poczatek;
            z.b=*(poczatek+1);
        }else{
            z.a=*(poczatek+1);
            z.b=*poczatek;
        }
    }else{
        // jeśli jest więcej samolotó niż 2:
        deque<Samolot *>::iterator poczatekY,koniecY,srodek;
        //szukam środkowego elementu
        srodek=(poczatek+(liczba_elementow/2));
        //szuakam odzielnie w pierwszej połowie i drugiej połowie tablicy
        Odcinek pom1 = Dziel_i_Zwyciezaj1(poczatek,srodek);
        Odcinek pom2= Dziel_i_Zwyciezaj1(srodek,koniec);
        //sprawdzam która kolizja jest bardziej prawdopodobna
        if(pom1.odleglosc<pom2.odleglosc){
            z=pom1;
            //jeśli odległości są równe sprawdzam po numerach samolotów 
        }else if(pom1.odleglosc==pom2.odleglosc){
            if(pom1.a->numer_identyfikacyjny<pom2.a->numer_identyfikacyjny){
                z=pom1;
            }else if(pom1.a->numer_identyfikacyjny==pom2.a->numer_identyfikacyjny){
                if(pom1.b->numer_identyfikacyjny<pom2.b->numer_identyfikacyjny){
                    z=pom1;
                }else{
                    z=pom2;
                }
            }else{
                z=pom2;
            }
        }else{
            z=pom2;
        }
        //ustwiam początek tak aby wszystkie samoloty od linii miały mniejszą odległość niż pkt z
        for(poczatekY=srodek;poczatekY>=poczatek;poczatekY--){
            if((*srodek)->x-(*poczatekY)->x>z.odleglosc){
                poczatekY++;
                break;
            }
        }

        if(poczatekY<poczatek){
            poczatekY=poczatek;
        }
        koniecY=srodek;
        //tak samo z końcem 
        while(koniecY<koniec){
            if((*koniecY)->x-(*srodek)->x>z.odleglosc){
                break;
            }
            koniecY++;
        }

        double odleglosc1;
        //szukam  od linii l samolotów z potencjalnie mniejszą odległością niż obecna  
        for(deque<Samolot *>::iterator i=poczatekY;i<koniecY;i++){
            for(deque<Samolot *>::iterator j=i+1;j<koniecY;j++){
                odleglosc1=odleglosc(*i,*(j));
                //jeśli znajdę odległość zamieniam z na nowe 
                if(odleglosc1<z.odleglosc){
                    z.odleglosc=odleglosc1;
                    if((*i)->numer_identyfikacyjny<(*j)->numer_identyfikacyjny){
                        z.a=*i;
                        z.b=*(j);
                    }else{
                        z.a=*(j);
                        z.b=*i;
                    }
                    //jeśli odległośći są równe sprawdzam który samoloty mają "pierszeństwo"
                }else if(odleglosc1==z.odleglosc){
                    if((*i)->numer_identyfikacyjny<(*j)->numer_identyfikacyjny){
                        if((*i)->numer_identyfikacyjny<z.a->numer_identyfikacyjny){
                            z.a=*i;
                            z.b=*(j);
                        }else if((*i)->numer_identyfikacyjny==z.a->numer_identyfikacyjny){
                            if((*j)->numer_identyfikacyjny<z.b->numer_identyfikacyjny){
                                z.a=*i;
                                z.b=*(j);
                            }
                        }
                    }else{
                        if((*j)->numer_identyfikacyjny<z.a->numer_identyfikacyjny){
                            z.a=*(j);
                            z.b=*i;
                        }else if((*j)->numer_identyfikacyjny==z.a->numer_identyfikacyjny){
                            if((*i)->numer_identyfikacyjny<z.b->numer_identyfikacyjny){
                                z.a=*(j);
                                z.b=*i;
                            }
                        }
                    }
                }
            }
        }
    }
    //zwracam odcinek z samolotami o najmniejszej odległości
    return z;
}

int main()
{
    std::ios_base::sync_with_stdio(false);
    int liczba_samolotow,numer,x,y;
    double odleglosc;
    deque<Samolot *> lista_samolotow;
    //Zczytuje wartości
    cin>>liczba_samolotow>>odleglosc;
    for(int i=0;i<liczba_samolotow;i++){
        cin>>numer>>x>>y;
        Samolot *bomba= new Samolot;
        bomba->numer_identyfikacyjny=numer;
        bomba->x=x;
        bomba->y=y;
        lista_samolotow.push_back(bomba);
    }
    //sortuje po X
    sort(lista_samolotow.begin(),lista_samolotow.end(),jak_sortowacX);

    Odcinek  wynik;
    //szukam kolizji do puki są minimum 2 samoloty
    while(lista_samolotow.size()>1){
        //szukam potencjalnej kolizji
        wynik=Dziel_i_Zwyciezaj1(lista_samolotow.begin(),lista_samolotow.end());
        //jeśli odleglosc jest zbyt duza do kolizji , reszta samolotow jest w jeszcze większej odleglosci
        // wiec kończe działanie pętli 
        if(wynik.odleglosc>odleglosc){ break;}
        //wyświetlam kolizje
        cout<<wynik.a->numer_identyfikacyjny<<" "<<wynik.b->numer_identyfikacyjny<<"\n";
        //kasuje te samoloty które już są wyświetlone
        for(int i=0;i<liczba_samolotow;i++){
            if(lista_samolotow[i]->numer_identyfikacyjny==wynik.a->numer_identyfikacyjny){
                lista_samolotow.erase(lista_samolotow.begin()+i);
                break;
            }
        }
        for(int i=0;i<liczba_samolotow;i++){
            if(lista_samolotow[i]->numer_identyfikacyjny==wynik.b->numer_identyfikacyjny){
                lista_samolotow.erase(lista_samolotow.begin()+i);
                break;
            }
        }
    }
    return 0;
}