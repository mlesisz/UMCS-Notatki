#include <iostream>
#include <string>

using namespace std;

struct Node{
    int klucz;
    string nazwa;
    Node * ojciec;
    Node * lewy;
    Node * prawy;
};

class DrzewoBST{
private:
    Node *korzen;
public:
    DrzewoBST(){
        korzen= nullptr;
    }

    void Insert(int klucz,string nazwa){
        Node *a= new Node;
        a->klucz=klucz;
        a->nazwa= std::move(nazwa);
        a->lewy= nullptr;
        a->prawy= nullptr;
        Node * pom;
        if(korzen== nullptr){
            a->ojciec= nullptr;
            korzen=a;
        }else{
            pom=Wyszukaj_ojca(klucz);
            a->ojciec=pom;
            if(pom->klucz<=klucz){
                pom->prawy=a;
            }else{
                pom->lewy=a;
            }
        }
    }
    Node * Wyszukaj_ojca(int klucz){
        Node * pst=korzen;
        while(true){
            if(pst->klucz<klucz){
                if(pst->prawy){
                    pst=pst->prawy;
                }else{
                    break;
                }
            }else {
                if(pst->lewy){
                    pst=pst->lewy;
                }else{
                    break;
                }
            }
        }
        return pst;
    }
    Node * Search(int klucz){
        Node *a=korzen;
        while(a!= nullptr){
            if(a->klucz<klucz){
                a=a->prawy;
            }else if(a->klucz>klucz){
                a=a->lewy;
            }else{
                break;
            }
        }
        return a;
    }
    Node * Minimum_z_galezi(Node *b){
        Node * pst=b;
        while(true){
            if(pst->lewy!=nullptr){
                pst=pst->lewy;
            }else{
                break;
            }
        }
        return pst;
    }
    Node * Delete(Node * a){
        Node * pst;
        pst=a->ojciec;
        if(a!=korzen){
            if(a->lewy== nullptr && a->prawy== nullptr){
                if(a->ojciec->lewy){
                    if(a->ojciec->lewy->klucz==a->klucz){
                        a->ojciec->lewy= nullptr;
                    }else{
                        a->ojciec->prawy= nullptr;
                    }
                }else{
                    a->ojciec->prawy= nullptr;
                }
                delete a;
            }else if(a->lewy != nullptr && a->prawy== nullptr){
                if(a->ojciec->lewy){
                    if(a->ojciec->lewy->klucz==a->klucz){
                        a->ojciec->lewy=a->lewy;
                        a->lewy->ojciec=a->ojciec;
                    }else{
                        a->ojciec->prawy=a->lewy;
                        a->lewy->ojciec=a->ojciec;
                    }
                }else{
                    a->ojciec->prawy=a->lewy;
                    a->lewy->ojciec=a->ojciec;
                }
                delete a;
            }else if(a->lewy == nullptr && a->prawy!= nullptr){
                if(a->ojciec->lewy){
                    if(a->ojciec->lewy->klucz==a->klucz){
                        a->ojciec->lewy=a->prawy;
                        a->prawy->ojciec=a->ojciec;
                    }else{
                        a->ojciec->prawy=a->prawy;
                        a->prawy->ojciec=a->ojciec;
                    }
                }else{
                    a->ojciec->prawy=a->prawy;
                    a->prawy->ojciec=a->ojciec;
                }
                delete a;
            }else{
                Node * pom;
                pom=Minimum_z_galezi(a->prawy);
                a->nazwa=pom->nazwa;
                a->klucz=pom->klucz;
                if(a->prawy==pom){
                    a->prawy= nullptr;
                }
                Delete(pom);
            }
        }else{
            if(a->lewy== nullptr && a->prawy== nullptr){
                delete a;
            }else if(a->lewy != nullptr && a->prawy== nullptr){
                a->lewy->ojciec= nullptr;
                korzen=a->lewy;
                delete a;
            }else if(a->lewy == nullptr && a->prawy!=nullptr){
                a->prawy->ojciec=nullptr;
                korzen=a->prawy;
                delete a;
            }else{
                Node * pom;
                pom=Minimum_z_galezi(a->prawy);
                if(pom->prawy!=nullptr){
                    if(pom!=a->prawy){
                        pom->ojciec->lewy=pom->prawy;
                        pom->prawy->ojciec=pom->ojciec;
                        pom->lewy=a->lewy;
                        pom->prawy=a->prawy;
                        a->prawy->ojciec=pom;
                    }else{
                        pom->lewy=a->lewy;
                    }
                }else{
                    pom->lewy=a->lewy;
                    if(a->prawy!=pom){
                        pom->ojciec->lewy= nullptr;
                        a->prawy->ojciec=pom;
                        pom->prawy=a->prawy;
                    }

                }
                a->lewy->ojciec=pom;
                pom->ojciec=nullptr;
                korzen=pom;
                delete a;
            }
        }
        return pst;
    }
    void Szukanie_sciezki(int klucz){
        Node* pom= Search(klucz);
        if(pom!=nullptr){
            while(pom){
                cout<<pom->nazwa;
                pom=Delete(pom);
            }
            cout<<"\n";
        }else{
            cout<<"NIE\n";
        }
    }
    void Wyswietl(Node *a){
        if(a->lewy!=nullptr){
            Wyswietl(a->lewy);
        }
        cout<<a->nazwa<<" ";
        if(a->prawy!=nullptr){
            Wyswietl(a->prawy);
        }
    }
};

int main()
{
    std::ios_base::sync_with_stdio(false);
    int ilosc_wezlow,ilosc_wyszukan;
    int a;
    string b;
    cin>>ilosc_wezlow>>ilosc_wyszukan;
    int co_wyszukac[ilosc_wyszukan];
    DrzewoBST drzewo;
    for(int i=0;i<ilosc_wezlow;i++){
        cin>>a>>b;
        drzewo.Insert(a,b);
    }
    for(int i=0;i<ilosc_wyszukan;i++){
        cin>>co_wyszukac[i];
    }
    for(int i=0;i<ilosc_wyszukan;i++){
        drzewo.Szukanie_sciezki(co_wyszukac[i]);
    }
    return 0;
}