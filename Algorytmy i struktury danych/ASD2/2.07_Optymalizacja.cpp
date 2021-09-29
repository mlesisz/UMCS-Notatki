#include <iostream>
#include <string>
#include <vector>
#include <queue>

using namespace std;

struct Klient{
    string nazwa;
    double piorytet;
    int wymagana_liczba_odwiedzen;
};

struct Porownywanie{

    bool operator()(const Klient & klient1,const Klient & klient2){
        //kolejnosc malejaco
        //porownywanie po piorytecie
        if(klient1.piorytet<klient2.piorytet) return true;
        if(klient1.piorytet>klient2.piorytet) return false;
        //porownywanie po odwiedzinach
        if(klient1.wymagana_liczba_odwiedzen<klient2.wymagana_liczba_odwiedzen) return true;
        if(klient1.wymagana_liczba_odwiedzen>klient2.wymagana_liczba_odwiedzen) return false;

        return false;

    }
};


typedef priority_queue<Klient,vector<Klient>,Porownywanie> kolejka;

struct Node{
    Node *ojciec,*lewy,*prawy;
    string nazwa_miasta;
    kolejka kolejka_klientow;
};

class DrzewoSplay{
private:
    Node *korzen;
public:
    DrzewoSplay(){
        korzen= nullptr;
    }
    void Rotacja_w_prawo(Node *a){
        Node * pom=a->lewy;
        Node * z;
        if(pom!= nullptr){
            z=a->ojciec;
            a->lewy=pom->prawy;
            if(a->lewy!= nullptr){
                a->lewy->ojciec=a;
            }
            pom->prawy=a;
            pom->ojciec=z;
            a->ojciec=pom;

            if(z!= nullptr){
                if(z->lewy==a) z->lewy=pom; else z->prawy=pom;
            }else{
                korzen=pom;
            }
        }
    }
    void Rotacja_w_lewo(Node * a){
        Node * pom=a->prawy;
        Node *z;
        if(pom!= nullptr){
            z=a->ojciec;
            a->prawy=pom->lewy;
            if(a->prawy!= nullptr){
                a->prawy->ojciec=a;
            }

            pom->lewy=a;
            pom->ojciec=z;
            a->ojciec=pom;
            if(z!= nullptr){
                if(z->lewy==a) z->lewy=pom; else z->prawy=pom;
            } else{
                korzen= pom;
            }

        }
    }
    void Splay(string klucz){
        if(korzen){
            Node *pst=korzen;
            //szukam wezla o danym kluczu, jesli go nie znajduje pst bedzie nastepnikiem lub poprzednikiem danego klucza
            while(true){
                if(pst->nazwa_miasta>klucz){
                    if(pst->lewy){
                        pst=pst->lewy;
                    }else{
                        break;
                    }
                }else if(pst->nazwa_miasta<klucz){
                    if(pst->prawy){
                        pst=pst->prawy;
                    }else{
                        break;
                    }
                }else{
                    break;
                }
            }
            //przesuwam pst do korzenia
            while(pst->ojciec){
                if(!pst->ojciec->ojciec){   //ojciec jest korzeniem, wykonujemy 1 rotacje i konczymy
                    if(pst->ojciec->prawy==pst){
                        Rotacja_w_lewo(pst->ojciec);
                    }else{
                        Rotacja_w_prawo(pst->ojciec);
                    }
                    break;
                }
                
                if((pst->ojciec->ojciec->prawy==pst->ojciec) && (pst->ojciec->prawy==pst)){
                    Rotacja_w_lewo(pst->ojciec->ojciec);
                    Rotacja_w_lewo(pst->ojciec);
                } else if((pst->ojciec->ojciec->lewy==pst->ojciec) && (pst->ojciec->lewy==pst)){
                    Rotacja_w_prawo(pst->ojciec->ojciec);
                    Rotacja_w_prawo(pst->ojciec);
                }else if(pst->ojciec->prawy!=pst){
                    Rotacja_w_prawo(pst->ojciec);
                } else{
                    Rotacja_w_lewo(pst->ojciec);
                }
            }
        }
    }
    void Insert(string nazwa_miasta, string nazwa_klienta,double piorytet,int liczba_odwiedzin){
        Klient a;
        a.wymagana_liczba_odwiedzen=liczba_odwiedzin;
        a.nazwa=nazwa_klienta;
        a.piorytet=piorytet;
        if(korzen== nullptr){
            Node *pst= new Node;
            pst->ojciec= nullptr;
            pst->prawy= nullptr;
            pst->lewy= nullptr;
            pst->nazwa_miasta=nazwa_miasta;
            pst->kolejka_klientow.push(a);
            korzen=pst;
        }else{
            Splay(nazwa_miasta);    //przesuwam do korzenia odpowiedni wezel
            if(korzen->nazwa_miasta==nazwa_miasta){ //jesli jest miasto w drzewie dodaje klienta do miasta
                korzen->kolejka_klientow.push(a);
                                                    //jeśli nie ma miasta to w korzeniu albo mam poprzednika lub nastepnika
            }else if(korzen->nazwa_miasta>nazwa_miasta){
                Node *pst= new Node;
                pst->ojciec= korzen;
                pst->prawy= nullptr;
                pst->lewy= korzen->lewy;
                korzen->lewy=pst;
                if(pst->lewy) pst->lewy->ojciec=pst;
                pst->nazwa_miasta=nazwa_miasta;
                pst->kolejka_klientow.push(a);
            }else{
                Node *pst= new Node;
                pst->ojciec= korzen;
                pst->prawy= korzen->prawy;
                korzen->prawy=pst;
                if(pst->prawy) pst->prawy->ojciec=pst;
                pst->lewy= nullptr;
                pst->nazwa_miasta=nazwa_miasta;
                pst->kolejka_klientow.push(a);
            }
        }
    }
    void Delete(string nazwa_miasta){
        Splay(nazwa_miasta);
        Node *lewy, *prawy;
        lewy=korzen->lewy;
        prawy=korzen->prawy;
        delete korzen;
        korzen= nullptr;
        if(lewy){
            lewy->ojciec= nullptr;
            korzen=lewy;
            Splay(nazwa_miasta);    //do korzenia trafia poprzednik usunietego wezla
            while(korzen->prawy) Rotacja_w_lewo(korzen);   //idziemy jak najbardziej do prawego wezla aby tam doloaczyc
                                                            //prawe pod drzewo
            korzen->prawy=prawy;
            if(prawy) prawy->ojciec=korzen;
        }else if(prawy){
            prawy->ojciec= nullptr;
            korzen=prawy;
            Splay(nazwa_miasta);    //idziemy do nastepnika
            while(korzen->lewy) Rotacja_w_prawo(korzen);
            korzen->lewy=lewy;
        }
    }
    void Obsluga_klienta(string nazwa_miasta){
        Splay(nazwa_miasta);
        if(korzen->nazwa_miasta!=nazwa_miasta){
            cout<<"BRAK\n";
        }else{
            Klient a=korzen->kolejka_klientow.top();
            korzen->kolejka_klientow.pop();
            cout<<a.nazwa<<"\n";
            a.wymagana_liczba_odwiedzen=a.wymagana_liczba_odwiedzen-1;
            if(a.wymagana_liczba_odwiedzen>0){
                korzen->kolejka_klientow.push(a);
            }
            if(korzen->kolejka_klientow.empty()){
                Delete(nazwa_miasta);
            }
        }
    }

};


int main() {
    std::ios_base::sync_with_stdio(false);
    int liczba_komend;
    DrzewoSplay drzewo;
    cin>>liczba_komend;
    string nazwa_miasta, nazwa_klienta;
    double piorytet;
    int liczba_odwiedzin;
    char komenda;
    for(int i=0;i<liczba_komend;++i){
        cin>>komenda;
        if(komenda=='A'){
            cin>>nazwa_miasta>>nazwa_klienta>>piorytet>>liczba_odwiedzin;
            drzewo.Insert(nazwa_miasta,nazwa_klienta,piorytet,liczba_odwiedzin);
        }else if(komenda=='F'){
            cin>>nazwa_miasta;
            drzewo.Obsluga_klienta(nazwa_miasta);
        }
    }
    return 0;
}