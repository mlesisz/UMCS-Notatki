#include <iostream>
#include <string>
#include <math.h>
#include <algorithm>
#include <string.h>

struct Samochod{
unsigned long long obroty;
std::string nazwa;
};

void sortowanie(Samochod tab[],int n){
    for(int i=0;i<n;i++)
    {
        Samochod pom;
        for(int j=1;j<n-i;j++)
        {
            if(tab[j-1].obroty>tab[j].obroty)
            {
                std::swap(tab[j-1],tab[j]);
            }
            if(tab[j-1].obroty==tab[j].obroty)
            {
                if (tab[j - 1].nazwa > tab[j].nazwa)

                std::swap(tab[j-1],tab[j]);
            }
        }
    }
}

int main() {

    std::ios_base::sync_with_stdio(false);
    unsigned int n;
    double kilometry;
    double srednica;
    double pi=3.141593;
    std::string pom;
    Samochod tablica[4];
    std::cin>>n;

    for(int i=0;i<3;i++) {
       // std::cin.sync();
        std::getline(std::cin,pom);
        std::getline(std::cin, tablica[i].nazwa);
        std::cin >> kilometry;
        std::cin >> srednica;
        tablica[i].obroty = static_cast<unsigned long long>(floor((kilometry * 100000) /( srednica * 2.54 * pi)));
    }

    sortowanie(tablica,3);

    for(int i=4;i<=n;i++)
    {
        //std::cin.sync();
        std::getline(std::cin,pom);
        std::getline(std::cin,tablica[3].nazwa);
        std::cin>>kilometry;
        std::cin>>srednica;
        tablica[3].obroty= static_cast<unsigned long long>(floor((kilometry * 100000) /( srednica * 2.54 * pi)));
        sortowanie(tablica,4);
    }

    for(int i=0;i<3;i++)
    {
        std::cout<<tablica[i].nazwa<<std::endl;
        std::cout<<tablica[i].obroty<<std::endl;
    }

    return 0;
}