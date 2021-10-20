#define TRUE  1
#define FALSE 0

//szablony cyfr (od 0 do 9) dla wyœwietlacza LED
//przechowywane w pamiêci programu (__code)
__code unsigned char WZOR[10] = { 0b0111111, 0b0000110,
            0b1011011, 0b1001111, 0b1100110, 0b1101101,
            0b1111101, 0b0000111, 0b1111111, 0b1101111 };

//bit 6 portu 1 w³¹cza/wy³¹cza wyœwietlacz LED
__bit __at (0x96) SEG_OFF;

void main()
{
    //bufor wybieraj¹cy bitowo aktywny wyœwietlacz
    __xdata unsigned char * led_wyb =
                        (__xdata unsigned char *) 0xFF30;
    //bufor wybieraj¹cy aktywne segmenty wyœwietlacza
    __xdata unsigned char * led_led =
                        (__xdata unsigned char *) 0xFF38;

    unsigned char led_p, //indeks aktywnego wyœwietlacza
                  led_b; //aktywny wyœwietlacz (bitowo)

    while (TRUE) { //pêtla nieskoñczona

        //pêtla przebiegaj¹ca po 6 wyœwietlaczach
        for (led_p = 0, led_b = 1;
             led_p < 6;
             led_p++, led_b += led_b) {

            SEG_OFF = TRUE;         //wy³¹cza wyœwietlacz
            *led_wyb = led_b;       //wybiera wyœwietlacz
            *led_led = WZOR[led_p + 1]; //wybiera segmenty
            SEG_OFF = FALSE;        //w³¹cza wyœwietlacz
        }
    }
}
