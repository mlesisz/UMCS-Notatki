__bit __at (0x95) BUZ; // bit 5 portu P1 ma adres 0x95 w SFR
__bit __at (0x97) LED; // bit 7 portu P1 ma adres 0x97 w SFR

unsigned int okres;

void main(void){

    LED = 1;  //wy³¹cza diodê LED

    while( 1 ){

        //pêtla opóŸniaj¹ca - bardzo z³a praktyka
        for( okres = 0; okres < 32468; okres++ )
        ;
        BUZ =  LED; // prze³¹cza brzêczyk
        LED = !LED; // prze³¹cza diodê LED
    }
}