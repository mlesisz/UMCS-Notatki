#include <iostream>
#include <vector>
using namespace std;

//kolejka
template <typename T>
class Kolejka {
    struct Node {
        T value;
        Node *next;
    };
    Node *head, *tail;
public:
    Kolejka();
    ~Kolejka();
    bool empty();
    T &front();
    void push(const T&);
    void pop();
    void clear();
};
template <typename T>
Kolejka<T>::Kolejka() {
    head=nullptr;
    tail=nullptr;
}
template <typename T>
Kolejka<T>::~Kolejka() {
    clear();
}
template <typename T>
void Kolejka<T>::clear() {
    if(empty()) return;
    Node *temp = head;
    Node *next = temp->next;
    while (true){
        delete temp;
        temp=next;
        if (!temp) break;
        next = temp->next;
    }
    head=tail=nullptr;
}
template <typename T>
bool Kolejka<T>::empty() {
    return head==nullptr;
}
template <typename T>
T &Kolejka<T>::front() {
    return head->value;
}
template <typename T>
void Kolejka<T>::push(const T &value) {
    Node *p= new Node{value, nullptr};
    if(empty()){
        head=p;
    }
    else {
        tail->next=p;
    }
    tail=p;

}
template <typename T>
void Kolejka<T>::pop() {
    /*if(empty())
        return;*/
    if(head == tail)
    {
        delete head;
        head = nullptr;
        tail = nullptr;
        return;
    }else {

        Node *temp = head;
        head = temp->next;
        delete temp;
    }
}
//stos
template <typename T>
class Stos {

    struct Node {
        T value;
        Node *next;
    };

    Node *head;
    int count;

public:
    Stos();
    ~Stos();
    bool empty();
    T &top();
    void push(const T&);
    void pop();
    void clear();
    int size();
};
template <typename T>
Stos<T>::Stos() {
    head=nullptr;
    count=0;
}
template <typename T>
Stos<T>::~Stos() {
    clear();
}
template <typename T>
void Stos<T>::clear() {
    if(empty()) return;
    Node *temp = head;
    Node *next = temp->next;
    while (true){
        delete temp;
        temp=next;
        if (!temp) break;
        next = temp->next;
    }
    head=nullptr;
    count=0;
}
template <typename T>
bool Stos<T>::empty() {
    return head==nullptr;
}
template <typename T>
T &Stos<T>::top() {
    return head->value;
}
template <typename T>
void Stos<T>::push(const T &value) {
    count++;
    Node *p = new Node{value, head};
    head = p;
}
template <typename T>
void Stos<T>::pop() {
    /*if(empty())
        return;*/
    Node *temp = head;
    head = temp->next;
    count--;
    delete temp;
}
template <typename T>
int Stos<T>::size() {
    return count;
}
//PARSER MATEMATYCZNY
typedef enum //definiuje kierunek łączenia operatora
{
    left,
    right
} direction;

class math_parser
{
private:
    struct oper
    {
        string name;        //nazwa operatora
        int priority;       //piorytet operatora
        direction dir;      //kierunek łączenia operatora
        double( * func )( double, double );    //wskaźnik na funkcję dla danego operatora
    };

    vector < oper > ops;        //tablica struktur oper
    int op_count;               //liczba operatorów
    bool err;

    bool IsOperator( string ch, oper * op );        //sprawdza czy dany znak nie jest operatorem
    Kolejka < string > ConvertToONP( string exp );//konwertuje na odwrotną notację Polską

public:
    math_parser();
    ~math_parser();
    //funkcja do dodawania operatorów
    void AddOperator( string name, int priority, direction dir, double( * func )( double, double ) );
    double Parse( string exp );// wywołuje ConvertToONP() a potem liczy wartość
};

math_parser::math_parser()
{
    err = false;
    op_count = 0;
}

math_parser::~math_parser()
{
    //
}
//dodawanie operatora
void math_parser::AddOperator( string name, int priority, direction dir, double( * func )( double, double) )
{
    oper op;                //tworzy nowy operator
    op.name = name;
    op.priority = priority;
    op.dir = dir;
    op.func = func;
    ops.push_back( op );    //dodaje go do tablicy operatorów
    op_count++;             //+1 do licznika operatorów
}
//czy operator jest zdefiniowany
bool math_parser::IsOperator( string ch, oper * op )
{
    bool IsOperator = false;
    for( int i = 0; i < op_count; i++ )
    {
        if( ops[ i ].name == ch )
        {
            IsOperator = true;
            * op = ops[ i ];
            break;
        }
    }
    return IsOperator;
}
Kolejka < string > math_parser::ConvertToONP( string exp )
{
    Kolejka < string > out;
    Stos < string > stack;
    int length = exp.size();
    string ch;
    string ch2;
    for( int i = 0; i < length; ++i )
    {
        ch = exp[ i ];
        if( atoi( ch.c_str() ) <= 9 &&( atoi( ch.c_str() ) > 0 || ch == "0" ) )//sprawdza czy jest cyfrą
        {
            // sprawdza czy następny element jest cyfrą
            ch2 = exp[ ++i ];
            string c = ch;
            while( atoi( ch2.c_str() ) <= 9 &&( atoi( ch2.c_str() ) > 0 || ch2 == "0" || ch2 == "." ) )
            {
                c += ch2;
                ch2 = exp[ ++i ];
                continue;
            }
            i--;
            out.push( c );
        }
        else   if( ch == "(" || ch=="[" || ch=="[")//sprawdza czy jest to nawias otwierający
        {
            stack.push( ch );   //jeśli tak to dodaje go do stosu
        }
        else if( ch == ")" )    //jeśli nawias zamykający przepisuje wszystko ze stosu aż nie natrafi na
        {                       //nawias zamykający, analogicznie w innych nawiasach
            while( stack.top() != "(" )
            {
                out.push( stack.top() );
                stack.pop();
            }
            stack.pop();
        }
        else if( ch == "}" )
        {
            while( stack.top() != "{" )
            {
                out.push( stack.top() );
                stack.pop();
            }
            stack.pop();
        }
        else if( ch == "]" )
        {
            while( stack.top() != "[" )
            {
                out.push( stack.top() );
                stack.pop();
            }
            stack.pop();
        }
        else
        {   // Symbol jest operatorem
            oper cur;
            IsOperator( ch, & cur ); // Pobranie aktualnego operatora do zmiennej cur

            if( stack.size() <= 0 )
            {
                // Nie ma żadnych operatorów na stosie
                stack.push( ch );
                continue;
            }
            oper op;
            while( IsOperator( stack.top(), & op ) == true ) // Dopóki na stosie znajduje się odpowiedni operator
            {
                if(( cur.dir ==( direction ) 0 && cur.priority <= op.priority ) ||( cur.dir ==( direction ) 1
                                                                                    && cur.priority < op.priority ) )
                {
                    out.push( stack.top() );
                    stack.pop();
                }
                else
                    break;
                if( stack.size() <= 0 )
                {
                    break;
                }
            }
            stack.push( ch );
        }
    }
    while( stack.size() > 0 )
    {
        // Dodanie wszystkiego do wyjścia, jeśli jeszcze coś jest na nim
        out.push( stack.top() );
        stack.pop();
    }
    return out;
}
double math_parser::Parse( string exp )
{
    Kolejka < string > symbols = ConvertToONP( exp );
    Stos < double > stack;

    while(!symbols.empty()){//działa dopóki kolejka jest pełna
        string sym=symbols.front(); //bierze z kolejki element
        symbols.pop();
        if(atoi(sym.c_str())>0 || sym =="0"){ //sprawdza czy to liczba
            stack.push(atoi(sym.c_str()));    //jesli tak dodaje do stosu i zamienia na double
        }else if(sym=="+"){
            //bierze dwie liczby z stosu i wykonuje na nich działanie
            double a=stack.top();
            stack.pop();
            double b=stack.top();
            stack.pop();
            double ret=(ops[0].func)(b,a);
            stack.push(ret);//wynik zapisuje na stosie
        }else if(sym=="-"){
            double a=stack.top();
            stack.pop();
            double b=stack.top();
            stack.pop();
            double ret=(ops[1].func)(b,a);
            stack.push(ret);//wynik zapisuje na stosie
        }else if(sym=="*"){
            double a=stack.top();
            stack.pop();
            double b=stack.top();
            stack.pop();
            double ret=(ops[2].func)(b,a);
            stack.push(ret);//wynik zapisuje na stosie
        }else{
            double a=stack.top();
            stack.pop();
            double b=stack.top();
            stack.pop();
            double ret=(ops[3].func)(b,a);
            stack.push(ret);//wynik zapisuje na stosie
        }
    }
    return stack.top();

}
double _dodawanie( double arg1, double arg2 )
{
    return arg1 + arg2;
}

double _odejmowanie( double arg1, double arg2 )
{
    return arg1 - arg2;
}

double _mnozenie( double arg1, double arg2 )
{
    return arg1 * arg2;
}

double _dzielenie( double arg1, double arg2 )
{
    return arg1 / arg2;
}

int main() {
    std::ios_base::sync_with_stdio(false);
    int n; //ilość równań
    cin >> n;
    //stos do sprawdzania nawiasów
    Stos<char> nawiasy;
    //zczytuje dane
    string rownanie, pompom, pom;
    math_parser mp;
    //dodaje operatory do mp
    mp.AddOperator("+", 1, (direction) 0, _dodawanie);
    mp.AddOperator("-", 1, (direction) 0, _odejmowanie);
    mp.AddOperator("*", 2, (direction) 0, _mnozenie);
    mp.AddOperator("/", 2, (direction) 0, _dzielenie);
    getline(cin, pompom);
    for (int i = 0; i < n; ++i) {
        getline(cin, rownanie);
        for (int j = 0; j < rownanie.size(); ++j) {
            char ten_char = rownanie[j];
            //sprawdzam czy jest wystarczająca ilość nawiasów i czy są w dobrej koljnosci
            if (ten_char == '(' || ten_char == '[' || ten_char == '{') {//jeśli trafi na nawias otwierający
                nawiasy.push(ten_char);  //dodaje go do stosu
            } else if (nawiasy.empty()) { //jeśli jest pusty stos nawiasów
                if (ten_char == ')' || ten_char == ']' || ten_char == '}')   //i trafi na nawias zamykający
                    nawiasy.push(ten_char);//dodaje do stosu  nawaias zamykający
            } else {
                if (ten_char == ')') {
                    if (nawiasy.top() == '(') {// jeśli są takie same nawiasy otwieraj. i zamykjące
                        nawiasy.pop();// kasuje nawias otw. ze stosu
                    } else {
                        nawiasy.push(ten_char);//jeśli nie dodaje nawias zamykający do stosu
                        break;
                    }//analogicznie z innymi rodzajami nawiasów
                } else if (ten_char == ']') {
                    if (nawiasy.top() == '[') {
                        nawiasy.pop();
                    } else {
                        nawiasy.push(ten_char);
                        break;
                    }
                } else if (ten_char == '}') {
                    if (nawiasy.top() == '{') {
                        nawiasy.pop();
                    } else {
                        nawiasy.push(ten_char);
                        break;
                    }
                }
            }
        }
        if (!nawiasy.empty()) {
            cout << "BLAD" << endl;
            nawiasy.clear();
        } else {
            double ret = mp.Parse(rownanie);
            cout << ret << endl;
        }
    }
    return 0;
}