#define FALSE 0
#define TRUE 1
#define BUZZ_ON  0
#define BUZZ_OFF 1

#define CSKB0 0xFF22     // adres klawiatury: klawisze 8…Enter

#define T0_DAT 65535-902 // dana dla licznika T0 (przerw. co 1ms)
#define TL_0 T0_DAT%256; // tak bêdzie ³atwiej
#define TH_0 T0_DAT/256; // prze³adowaæ liczniki timer'a
#define T100 100         // okres testowania klawiatury

#include <8051.h>

//zmienne globalne
unsigned char timer_buf; // licznik czasomierza  programowego
unsigned char send_buf;  // bufor dla nadawanego bajtu


// flagi bitowe
__bit __at (0x95) BUZZ;  // bit 5 portu P1 steruj¹cy brzêczykiem
__bit __at (0x97) DLED;  // bit 7 portu P1 steruj¹cy diod¹ LED
__bit rec_flag;          // flaga odebrania znaku
__bit can_send;          // nadajnik gotowy do transmisj
__bit send_data;         // dane gotowe do transmisj
__bit timer_flag;        // flaga timer'a
__bit t0_flag;           // flaga przerwania od licznika T0


//deklaracje funkcji
void rec_service();
void send_service();
void t0_service();
void key_service();


/*
 *-----------------------------------------------------
 *    START PROGRAMU
 *-----------------------------------------------------
 */
void main(){


    //kompilator SDCC generuje kod ustawiaj¹cy Stack Pointer

    // PRZYGOTOWANIE ŒRODOWISKA
    //-------------------------
    P1 = 0xFF; // stan wysoki na wszystkich
    P3 = 0xFF; // liniach portów P1 i P3

    //ustawienie rejestrow kontrolnych
    //--------------------------------
    PCON = 0x80; // zegar dla sio: taktowanie T1 (19200 b/s)
    SCON = 0b01010000;   // ustawienie parametrów transmisji
                         // tryb 1: 8 bitów, szybkoœæ: T1
    TMOD = 0b00100001;   // ustawienie T1 w tryb 2; T0 w tryb 1
    TCON = 0b00000000;   // bez przerwañ INT_0 i INT_1

    TL0 = TL_0; //ustawienie m³odszego
    TH0 = TH_0; //i starszego bajtu T0

    TL1 = 0xFD; //ustawienie m³odszego
    TH1 = 0xFD; //i starszego bajtu T1 (19200)

    //inne ustawienia
    //---------------
    timer_buf  = T100;   // ³aduj timeout licznika (100ms)
    can_send   = TRUE;   // ustaw flagê gotowoœci nadajnika
    send_data  = FALSE;  // kasuj flagê gotowoœci danych
    rec_flag   = FALSE;  // kasuj flagê gotowoœci odbiornika
    timer_flag = FALSE;  // zeruj flagê czasomierza T0
    t0_flag    = FALSE;  // zeruj flagê przerwania t0_int

    PS  = TRUE; // ustaw najwy¿szy priorytet przerwania od UART
    ET0 = TRUE; // aktywuj przerwanie od licznika T0
    ES  = TRUE; // aktywuj przerwanie od UART
    EA  = TRUE; // aktywuj wszystkie przerwania
    TR0 = TRUE; // uruchom licznik T0
    TR1 = TRUE; // uruchom licznik T1

    // PÊTLA PROGRAMOWA
    //-----------------
    while( TRUE ){

        if( rec_flag ){        //odebrany bajt w buforze UART
            rec_flag = FALSE;  //kasuj flagê odebrania bajtu
            rec_service();     //wykonaj obs³ugê odbioru bajtu
        }

        if(    send_data       //gotowoœæ danych do transmisji
            && can_send ){     //gotowoœæ nadajnika UART
            send_data = FALSE; //zeruj flagê wa¿noœci danych
            can_send = FALSE;  //zeruj flagê gotowoœci nadajnika
            send_service();    //wykonaj obs³ugê nadawania
        }

                               //podczas ostaniego obrotu pêtli
        if( t0_flag ){         //wystapi³o przerwanie zegarowe 1ms
            t0_flag = FALSE;   //zeruj flagê
            t0_service();      //obs³u¿ przerwanie od T0
        }

        if( timer_flag ){      //warunek spe³niony co 100 ms
            timer_flag = FALSE;// zeruj flagê
            DLED = !DLED;      //zmieñ stan diody LED
            key_service();     //obs³u¿ klawiaturê (63)
        }

    } // while

} // main

/*
 * -----------------------------------
 *   PODPROGRAMY
 * -----------------------------------
 */

/*
 * obs³uga przerwania od odbiornika portu RS232
 * ---------------------------------------------------------
 * opis: po odebraniu i skompletowaniu bajtu w buforze odbiornika portu
 * RS232 jest generowane przerwanie, w wyniku którego jest ustawiana
 * flaga rec_flag (patrz sio_int) - program pobiera bajt, zmienia jego
 * kod (zamienia ma³e litery na du¿e) i przekazuje do bufora nadawania.
 */
void rec_service(){

    unsigned char uc = SBUF;   //pobierz bajt z portu szeregowego
    if( ( uc >= 'a' ) && ( uc < 'z' + 1 ) )
        uc -= ' ';             //zamiana kodu ma³ej litery na du¿¹

    send_buf = uc;             //zapamiêtaj w buforze nadawania
    send_data = TRUE;          //ustaw flagê gotowoœci danej

}

/*
 * obs³uga przerwania od nadajnika portu RS232
 * --------------------------------------------------------
 * opis:  po wys³aniu bajtu przez port RS232 jest generowane przerwanie,
 * w wyniku którego jest ustawiana flaga send_flag (patrz sio_int),
 * a bufor nadajnika jest gotowy do przyjêcia nastêpnego bajtu. Podany
 * ni¿ej program pobiera bajt z bufora poœredniego i wysy³a go do bufora
 * nadajnika portu szeregowego (automatycznie rozpoczyna siê wtedy jego
 * nadawanie).
 */
void send_service(){

    SBUF = send_buf;

}


/*
 * obs³uga przerwania od czasomierza  T0 (co 1 ms)
 * ------------------------------------------------------------
 * opis: z odstêpem czasu wskazywanym przez sta³¹ t0_dat (1 ms),
 * licznik T0 generuje przerwanie - w czasie obs³ugi tego przerwania
 * odœwie¿any jest stan rejestrów licznika (patrz t0_int) - program
 * ustawia flage timer_flag co 100 ms -> pozwala to na dodatkowa
 * obs³ugê w pêtli z tym odstêpem czasu.
 */
void t0_service(){

    if( timer_buf )
        timer_buf--;           //zmniejsz stan bufora czasomierza
    else{
        timer_flag = TRUE;     //ustaw flagê gdy up³ynê³o 100ms
        timer_buf  = T100;     //regeneruj stan licznik (100ms)
    }

}

/*
 * obs³uga klawiatury
 * --------------------------------------------
 * opis:  co 100ms powinien byæ sprawdzony stan klawiatury.
 * poni¿sza funkcja testuje stan  klawisza enter (k25)
 * po jego naciœniêciu jest w³¹czany 'buzzer'
 * a po zwolnieniu 'buzzer' jest wy³¹czany.
 */
void key_service(){

    //pointer na drug¹ po³ówkê klawiatury w obszarze adresowym xdata
    __xdata unsigned char * key_addr = (__xdata unsigned char *) CSKB0;

    //zdejmuje aktualny stan klawiatury
    unsigned char key;

    key = ~( *key_addr );

    if( key & 0b10000000 )     //wy³uskuje Enter
        BUZZ = BUZZ_ON;        //w³¹cza brzêczyk
    else
        BUZZ = BUZZ_OFF;       //wy³¹cza brzêczyk

}

/*
 * -----------------------------------
 *   PROCEDURY OBS£UGI PRZERWAÑ
 * -----------------------------------
 */

/*
 *  przerwanie #1 od timer'a 0
 *  wywo³ywane przez LJMP spod adresu 0x000b
 */
void t0_int(void) __interrupt(1){

    TL0 = TL0 + TL_0;          //odœwie¿a licznik T0
    TH0 = TH_0;
    t0_flag = TRUE;            //ustawia flagê sygnalizuj¹c¹
                               //fakt wyst¹pienia przerwania

} // kompilator wstawi RETI

/*
 * przerwanie #4 od UART
 * wywo³ywane przez LJMP spod adresu 0x0023
 */
void sio_int(void) __interrupt(4){

    if( TI ){                  //gdy pusty bufor nadajnika
        TI = FALSE;
        can_send = TRUE;       //ustaw flagê gotowoœci do nadawania
    }
    else{
        RI = FALSE;            //zeruj flagê odbioru znaku
        rec_flag = TRUE;       //ustaw flagê odebrania znaku
    }

} // kompilator wstawi RETI
