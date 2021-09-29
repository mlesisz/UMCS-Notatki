#include <iostream>
#include <string>


using namespace std;

struct Uczen {
    string kod; // oznacza kod ucznia
    float srednia_zocen;
    unsigned int odleglosc;
    unsigned short int miesiac;
};

void sortowanie(Uczen tab[], unsigned int n,char dana1,char dana2)
{//sortowanie przez "wstawianie"
    int j;
    Uczen pom;
    switch(dana1){
        case 's':
            switch(dana2){
                case 'd':
                    for(unsigned   i=1;i<n;i++) {
                        pom = tab[i];
                        j=i-1;
                        while (j >= 0) {
                            if (tab[j].srednia_zocen < pom.srednia_zocen) {
                                tab[j + 1] = tab[j];
                                j--;
                            } else if (tab[j].srednia_zocen == pom.srednia_zocen) {
                                if (tab[j].odleglosc < pom.odleglosc) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else if (tab[j].odleglosc == pom.odleglosc && tab[j].miesiac < pom.miesiac) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else
                                    break;
                            }
                            else
                                break;
                        }
                        tab[j + 1] = pom;
                    }
                    break;
                case 'm':
                    for(unsigned   i=1;i<n;i++) {
                        pom = tab[i];
                        j=i-1;
                        while (j >= 0) {
                            if (tab[j].srednia_zocen < pom.srednia_zocen) {
                                tab[j + 1] = tab[j];
                                j--;
                            } else if (tab[j].srednia_zocen == pom.srednia_zocen) {
                                if (tab[j].miesiac < pom.miesiac) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else if (tab[j].miesiac == pom.miesiac && tab[j].odleglosc < pom.odleglosc) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else
                                    break;
                            }
                            else
                                break;
                        }
                        tab[j + 1] = pom;
                    }
                    break;

            }
            break;
        case 'd':
            switch(dana2){
                case 's':
                    for(unsigned   i=1;i<n;i++) {
                        pom = tab[i];
                        j=i-1;
                        while (j >= 0) {
                            if (tab[j].odleglosc < pom.odleglosc) {
                                tab[j + 1] = tab[j];
                                j--;
                            } else if (tab[j].odleglosc == pom.odleglosc) {
                                if (tab[j].srednia_zocen < pom.srednia_zocen) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else if (tab[j].srednia_zocen == pom.srednia_zocen && tab[j].miesiac < pom.miesiac) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else
                                    break;
                            }
                            else
                                break;
                        }
                        tab[j + 1] = pom;
                    }
                    break;
                case 'm':
                    for(unsigned   i=1;i<n;i++) {
                        pom = tab[i];
                        j=i-1;
                        while (j >= 0) {
                            if (tab[j].odleglosc < pom.odleglosc) {
                                tab[j + 1] = tab[j];
                                j--;
                            } else if (tab[j].odleglosc == pom.odleglosc) {
                                if (tab[j].miesiac < pom.miesiac) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else if (tab[j].miesiac == pom.miesiac && tab[j].srednia_zocen < pom.srednia_zocen) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else
                                    break;
                            }
                            else
                                break;
                        }
                        tab[j + 1] = pom;
                    }
                    break;
            }
            break;
        case 'm':

            switch(dana2){
                case 's':
                    for(unsigned   i=1;i<n;i++) {
                        pom = tab[i];
                        j=i-1;
                        while (j >= 0) {
                            if (tab[j].miesiac < pom.miesiac) {
                                tab[j + 1] = tab[j];
                                j--;
                            } else if (tab[j].miesiac == pom.miesiac) {
                                if (tab[j].srednia_zocen < pom.srednia_zocen) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else if (tab[j].srednia_zocen == pom.srednia_zocen && tab[j].odleglosc < pom.odleglosc) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else
                                    break;
                            }
                            else
                                break;
                        }
                        tab[j + 1] = pom;
                    }
                    break;
                case 'd':
                    for(unsigned   i=1;i<n;i++) {
                        pom = tab[i];
                        j=i-1;
                        while (j >= 0) {
                            if (tab[j].miesiac < pom.miesiac) {
                                tab[j + 1] = tab[j];
                                j--;
                            } else if (tab[j].miesiac == pom.miesiac) {
                                if (tab[j].odleglosc < pom.odleglosc) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else if (tab[j].odleglosc == pom.odleglosc && tab[j].srednia_zocen < pom.srednia_zocen) {
                                    tab[j + 1] = tab[j];
                                    j--;
                                }
                                else
                                    break;
                            }
                            else
                                break;
                        }
                        tab[j + 1] = pom;
                    }
                    break;
            }
            break;
    }
}

int main(int argc, char** argv) {

    std::ios_base::sync_with_stdio(false);

    unsigned int n; // liczba par
    cin >> n;

    char dana1, dana2, dana3; //zczytuje jak ma sortować
    cin>>dana1;
    cin>>dana2;
    cin>>dana3;

    Uczen chlopcy[n];
    Uczen dziewczynki[n];

    for(int i=0;i<n;i++)
    {     //pierwsza osoba z pary(dziewczynka)
        cin>>dziewczynki[i].kod;
        cin>>dziewczynki[i].srednia_zocen;
        cin>>dziewczynki[i].odleglosc;
        cin>>dziewczynki[i].miesiac;
        //druga osoba z pary(chłopiec)
        cin>>chlopcy[i].kod;
        cin>>chlopcy[i].srednia_zocen;
        cin>>chlopcy[i].odleglosc;
        cin>>chlopcy[i].miesiac;
    }

    sortowanie(chlopcy,n,dana1,dana2);
    sortowanie(dziewczynki,n,dana1,dana2);

    for(int i=0;i<n;i++)
    {
        cout <<dziewczynki[i].kod<<' '<<chlopcy[i].kod<<' ';
    }

    return 0;
}