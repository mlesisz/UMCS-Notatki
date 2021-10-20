#define TRUE  1
#define FALSE 0

//szablony cyfr (od 0 do 9) dla wy�wietlacza LED
//przechowywane w pami�ci programu (__code)
__code unsigned char WZOR[10] = { 0b0111111, 0b0000110,
            0b1011011, 0b1001111, 0b1100110, 0b1101101,
            0b1111101, 0b0000111, 0b1111111, 0b1101111 };

//bit 6 portu 1 w��cza/wy��cza wy�wietlacz LED
__bit __at (0x96) SEG_OFF;

void main()
{
    //bufor wybieraj�cy bitowo aktywny wy�wietlacz
    __xdata unsigned char * led_wyb =
                        (__xdata unsigned char *) 0xFF30;
    //bufor wybieraj�cy aktywne segmenty wy�wietlacza
    __xdata unsigned char * led_led =
                        (__xdata unsigned char *) 0xFF38;

    unsigned char led_p, //indeks aktywnego wy�wietlacza
                  led_b; //aktywny wy�wietlacz (bitowo)

    while (TRUE) { //p�tla niesko�czona

        //p�tla przebiegaj�ca po 6 wy�wietlaczach
        for (led_p = 0, led_b = 1;
             led_p < 6;
             led_p++, led_b += led_b) {

            SEG_OFF = TRUE;         //wy��cza wy�wietlacz
            *led_wyb = led_b;       //wybiera wy�wietlacz
            *led_led = WZOR[led_p + 1]; //wybiera segmenty
            SEG_OFF = FALSE;        //w��cza wy�wietlacz
        }
    }
}
