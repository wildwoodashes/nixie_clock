//testcode.c
//A. Briggs
//8.6.10
#define F_CPU 8000000 //8Mhz clock

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "rtc.h"
#include "tubes.h"

#define TRUE 1
#define FALSE 0

#define I2C_START 0
#define I2C_DATA  1
#define I2C_STOP  2


//*******************************************************
//			timer2_init
//initializes timer2 to handle updating measurements
//
void timer2_init(void){
  //TCCR2B |= (1<<CS22)|(1<<CS21)|(1<<CS20); // Cio/1024
  TCCR2B |= (1<<CS22);                     // Cio/64
  OCR2A = 0x0F;			  	   // Freq ~ 15.6kHz
  TIMSK2 |= (1<<OCIE1A);		   // Enable interrupt
}
//*******************************************************

//*******************************************************
//			Timer 2 Interrupt
// 
ISR(TIMER2_COMPA_vect){

 
 
}
//*******************************************************

//******************************************************************************
//                            chk_button                                      
//Checks the state of the button number passed to it. It shifts in ones till   
//the button is pushed. Function returns a 1 only once per debounced button    
//push so a debounce and toggle function can be implemented at the same time.  
//Adapted to check all buttons from Ganssel's "Guide to Debouncing"            
//Expects active low pushbuttons on PINA port.  Debounce time is determined by 
//external loop delay times 12. 
//
uint8_t chk_button(uint8_t button) {
  static uint16_t state[3] = {0,0,0}; //holds present state for 3 seperate buttons
  uint8_t switch_bit = PD3;
  
  switch(button){
		case(0):
			switch_bit = PD3;
			break;
		case(1):
			switch_bit = PD4;
			break;
		case(2):
			switch_bit = PD5;
			break;
  }
  
  state[button] = (state[button] << 1) | (! bit_is_clear(PIND, switch_bit)) | 0xE000;
  if (state[button] == 0xF000) return 1;
  return 0;
}
//******************************************************************************


//*******************************************************
uint8_t main(void){
	uint8_t read_data;
	uint8_t minutes;
    uint8_t hours;
	uint8_t i = 0;
    uint8_t dot = 0;
	
	//Button
	DDRD |= (1<<PD6) | (1<<PD7); // Set PD6 and PD7 as outputs
	DDRD &= ~(1<<PD3); // SW4
	DDRD &= ~(1<<PD4); // SW3
	DDRD &= ~(1<<PD5); // SW2
	PORTD |= (1<<PD3) | (1<<PD4) | (1<<PD5); //enable pullups
	PORTD |= (1<<PD6); 		//keep LEDs off to start
	PORTD |= (1<<PD7); 		//keep LEDs off to start

	PORTD &= ~(1<<PD6);
	PORTD &= ~(1<<PD7);

	twi_init();
	spi_init_master();
	// timer2_init();

	// sei(); 
	
	// write_rtc(0x00, 0x80)  ; // Initialize the RTC oscillator
	// write_rtc(0x02, (1<<5)); // Set the hours to 12;

    set_tubes(0, 0, FALSE);

    PORTC |= (1<<PC3);

	while(TRUE){
		
		// read_data=read_rtc(0x01); // Read the minutes
        // minutes = (read_data>>4)*10+(read_data&0x0F);

		// read_data=read_rtc(0x02); // Read the hours
        // hours = ((read_data>>4)&0x1)*10+(read_data&0x0F);

		// Wait for button press before begining I2C command seq
		while(!chk_button(0)){
			_delay_us(10000);
		}
        // i++;
        // dot = (minutes%2==0) ? FALSE : TRUE;
        set_tubes(i%5, (minutes%10), dot);
        PORTD ^= (1<<PD7);	

        /*
		read_data=read_rtc(0x01); // Read the minutes

		for(i=0; i<8; i++){
			
			// Wait for button press
			while(!chk_button(0)){
				_delay_us(10000);
			}
			
			// Send out next bit on LED
			if(read_data>>i & 0x01){
				PORTD &= ~(1<<PD6);	
			}
			else{
				PORTD |= (1<<PD6);	
			}
			
            set_tubes(2, i, FALSE);
			// Turn on second LED on last bit
			if(i==7){
				PORTD &= ~(1<<PD7);	
                set_tubes(2, i, TRUE);
			}
			// Turn off Second LED on first bit
			else if(i==0){
				PORTD |= (1<<PD7);	
			}

			
		}
        */

	}
	return 0;
}
