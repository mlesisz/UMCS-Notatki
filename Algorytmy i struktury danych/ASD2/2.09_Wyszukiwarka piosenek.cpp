#include <iostream>
#include <deque>
#include <string>
#include <algorithm>

using namespace std;

struct Node{
    Node *ojciec;
    deque<Node*> synowie;
    char klucz;
    bool nazwa_utworu;
};


class Drzewo_trie{
    Node * korzen;
public:
    Drzewo_trie(){
        Node *pst= new Node;
        pst->ojciec=NULL;
        pst->nazwa_utworu=false;
        this->korzen=pst;
    }
    void Insert(string nazwa){
        Node * pst=korzen;
        bool czy_tworzyc_nowy_wezel;
        for(auto a : nazwa){
            czy_tworzyc_nowy_wezel=true;
            for(auto b: pst->synowie){
                if(a==b->klucz){
                    pst=b;
                    czy_tworzyc_nowy_wezel=false;
                    break;
                }
            }
            if(czy_tworzyc_nowy_wezel){
                Node * pom= new Node;
                pom->ojciec=pst;
                pom->klucz=a;
                pom->nazwa_utworu=false;
                deque<Node *>::iterator iter;
                for(iter=pst->synowie.begin();iter!=pst->synowie.end();++iter){
                    Node *pst=*iter;
                    if(pst->klucz>pom->klucz){
                        break;
                    }
                }
                pst->synowie.insert(iter,pom);
                pst=pom;
            }
        }
        pst->nazwa_utworu=true;
    }
    Node * Search(string nazwa){
        Node * pst=korzen;
        bool istnieje_sciezka=true;
        for(auto a: nazwa){
            istnieje_sciezka=false;
            for(auto b: pst->synowie){
                if(a==b->klucz){
                    pst=b;
                    istnieje_sciezka=true;
                    break;
                }
            }
            if(istnieje_sciezka){
                continue;
            }else{
                pst=NULL;
                break;
            }
        }
        return pst;
    }
    void Preorder(Node * pst,string nazwa,deque<string> &lista){
        if(pst->nazwa_utworu){
            lista.push_back(nazwa);
        }
        //cout<<nazwa<<endl;
        for(auto a: pst->synowie){
            nazwa=nazwa+a->klucz;
            Preorder(a,nazwa,lista);
            nazwa.erase(nazwa.end()-1);
        }
    }
    void Szukanie_i_wyswietlanie(string nazwa){
        Node * pst=Search(nazwa);
        if(pst==NULL){
            cout<<"-"<<endl;
        }else{
            deque<string> lista;
            Preorder(pst,nazwa,lista);
            sort(lista.begin(),lista.end());
            for(auto a : lista){
                cout<<a<<endl;
            }
        }
    }
};

int main()
{
    std::ios_base::sync_with_stdio(false);
    int liczba_komend;
    cin>>liczba_komend;
    char rozkaz;
    string nazwa;
    Drzewo_trie drzewo;
    for(int i=0;i<liczba_komend;i++){
        cin>>rozkaz>>nazwa;
        if(rozkaz=='A'){
            drzewo.Insert(nazwa);
        }else{
            drzewo.Szukanie_i_wyswietlanie(nazwa);
        }
    }
    return 0;
}