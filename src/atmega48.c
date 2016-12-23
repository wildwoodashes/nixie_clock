//testcode.c
//A. Briggs
//8.6.10
#define F_CPU 8000000 //8Mhz clock

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include "rtc.h"
#include "tubes.h"

#define TRUE 1
#define FALSE 0

#define I2C_START 0
#define I2C_DATA  1
#define I2C_STOP  2

// Ugh, globals...
struct time{
    uint8_t seconds;
    uint8_t seconds_ones;
    uint8_t seconds_tens;
    uint8_t minutes;
    uint8_t minutes_ones;
    uint8_t minutes_tens;
    uint8_t hours;
    uint8_t hours_ones;
    uint8_t hours_tens;
    uint8_t pm_am_n;
};

struct time clock_time;
struct time pwr_dwn_start_time;
struct time pwr_dwn_stop_time;
struct time EEMEM pwr_dwn_start_time_eeprom;
struct time EEMEM pwr_dwn_stop_time_eeprom;

//******************************************************************************
//                            chk_button_momt                                     
//Checks the state of the button number passed to it. It shifts in ones till   
//the button is pushed. Function returns a 1 only once per debounced button    
//push so a debounce and toggle function can be implemented at the same time.  
//Adapted to check all buttons from Ganssel's "Guide to Debouncing"            
//Expects active low pushbuttons on PIND port.  Debounce time is determined by 
//external loop delay times 12. 
//
uint8_t chk_button_momt(uint8_t button) {
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

//******************************************************************************
//                            chk_button_hold                                      
//
uint8_t chk_button_hold(uint8_t button) {
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
  if (state[button] == 0xE000) return 1;
  return 0;
}
//******************************************************************************

void init_time(struct time *obj){
    obj->minutes = 0;
    obj->minutes_ones = 0;
    obj->minutes_tens = 0;
    obj->hours = 0;
    obj->hours_ones = 0;
    obj->hours_tens = 0;
    obj->pm_am_n = 0;
}

void write_seconds(void){
	// write_rtc(0x00, ((1<<7)|((clock_time.seconds_tens&0x7) << 4)|(clock_time.seconds_ones&0xF)))  ; // set the seconds + enable the RTC oscillator 
	write_rtc(0x00, ((1<<7)|((0&0x7) << 4)|(clock_time.seconds_ones&0xF)))  ; // set the seconds + enable the RTC oscillator 
}

void write_hours(void){
    write_rtc(0x02,((1<<6)|(clock_time.pm_am_n << 5)|((clock_time.hours_tens&0x1) << 4)|(clock_time.hours_ones&0xF))); 
}

void write_minutes(void){
    write_rtc(0x01, (((clock_time.minutes_tens&0x7)<<4)|(clock_time.minutes_ones&0xF)));
}

void update_time(void){
    write_minutes(); 
    write_hours();
    set_tubes(clock_time.minutes_ones, clock_time.minutes_tens, clock_time.hours_ones, clock_time.hours_tens , TRUE);
}

void increment_hours(struct time *obj){
    if(obj->hours < 9){
        // increment *obj->hours by one;
        obj->hours_ones++;
    }
    else if(obj->hours == 9){
        obj->hours_tens=1;
        obj->hours_ones=0;
    }
    else if(obj->hours < 12){
        obj->hours_ones++;
        obj->pm_am_n = (obj->hours == 11) ? !obj->pm_am_n : obj->pm_am_n; // Switch to AM/PM depending on current state of rolling from 11 to 12.
    }
    else{
        obj->hours_tens=0;
        obj->hours_ones=1;
    }
    obj->hours = obj->hours_tens*10 + obj->hours_ones;
}

void increment_minutes(struct time *obj){
    if((obj->minutes_ones%10 != 9)){
        obj->minutes_ones++; // increment *obj->minutes by one;
    }
    else if(obj->minutes_ones%10 == 9 && obj->minutes_tens == 5){
        obj->minutes_ones = 0;
        obj->minutes_tens = 0;
         // increment *obj->minutes by one;
        increment_hours(obj);
    }
    else{
        obj->minutes_ones = 0;
        obj->minutes_tens++; // increment *obj.minutes by one;
    }
    obj->minutes = obj->minutes_tens*10 + obj->minutes_ones;
}

void cathode_poisin_prevention(void){
    static uint8_t hold_cnt;
    static uint8_t digit = 0;

    hold_cnt++;

    if(hold_cnt == 255){
        digit = digit == 9 ? 0 : digit + 1;
    }
    set_tubes( digit, digit, digit, digit , FALSE);
}

void get_time(void){
	uint8_t read_data;
    read_data=read_rtc(0x00); // Read the clock_time.seconds
    clock_time.seconds_ones = (read_data&0x0F);
    clock_time.seconds_tens = (read_data>>4)&0x7;
    clock_time.seconds = clock_time.seconds_tens*10 + clock_time.seconds_ones;

    read_data=read_rtc(0x01); // Read the clock_time.minutes
    clock_time.minutes_ones = (read_data&0x0F);
    clock_time.minutes_tens = (read_data>>4);
    clock_time.minutes = clock_time.minutes_tens*10 + clock_time.minutes_ones;

    read_data=read_rtc(0x02); // Read the clock_time.hours
    clock_time.hours_ones = (read_data&0x0F);
    clock_time.hours_tens = ((read_data>>4)&0x1);
    clock_time.pm_am_n = ((read_data>>5)&0x1);
    clock_time.hours = clock_time.hours_tens*10 + clock_time.hours_ones;
}

void convt_24hr(uint8_t *hrs_tens_24, uint8_t *hrs_ones_24, struct time *obj){
    if(obj->pm_am_n){
        if(*hrs_tens_24 == 1 && *hrs_ones_24 == 2){
            *hrs_tens_24 = *hrs_tens_24;
            *hrs_ones_24 = *hrs_ones_24;
        }
        else{
            *hrs_tens_24 = (obj->hours+12)/10;
            *hrs_ones_24 = (obj->hours+12)%10;
        }
    }
    else{
        if(*hrs_tens_24 == 1 && *hrs_ones_24 == 2){
            *hrs_tens_24 = 0;
            *hrs_ones_24 = 0;
        }
        else{
            *hrs_tens_24 = *hrs_tens_24;
            *hrs_ones_24 = *hrs_ones_24;
        }
    }
}

void get_time_change(struct time *obj, uint16_t top_cnt){
    static uint16_t dot_cnt;
    uint8_t hours_tens_24hr;
    uint8_t hours_ones_24hr;

    if(chk_button_momt(0)){
        increment_hours(obj);
    }
    else if(chk_button_momt(1)){
        increment_minutes(obj);
    }
    dot_cnt = (dot_cnt >= top_cnt) ? 0 : dot_cnt + 1;

    hours_tens_24hr = obj->hours_tens;
    hours_ones_24hr = obj->hours_ones;
    convt_24hr(&hours_tens_24hr, &hours_ones_24hr, obj);

    set_tubes(obj->minutes_ones, obj->minutes_tens, hours_ones_24hr, hours_tens_24hr, (dot_cnt <128));
}

// Create routine for trimming RTC crystal to prevent drift
// Current trim value was computted to be +15
// due to average RTC Fmeas = ~32,767.682Hz
// See mcp7940n.pdf pg. 30 for calculation of this number.
void trim_rtc(void){
    static uint8_t trim_comp = 0;

    write_rtc(0x8, ((1<<7)|((14+trim_comp)<<0))); // Trim for observed drift

    //alternate trim comp by 1 every time this is called to achieve a half value.
    // trim_comp = (trim_comp == 0) ? 1 : 0;
}

//*******************************************************
//			timer1 init
//initializes timer1 to handle updating time.
//Do this twice a second. This is probably still to frequent,
// but should be safe enough.
void timer1_init(void){
  cli();
  TCCR1A = 0;
  TCCR1B |= (1<<WGM12)|(1<<CS12)|(1<<CS10); // Cio/1024
  // OCR1A = 0x30D;			  	   // Freq ~ 10Hz
  OCR1A = 0xF41;	               // Freq ~ 2Hz
  TIMSK1 |= (1<<OCIE1A);		   // Enable interrupt
  sei();
}
//*******************************************************

//*******************************************************
//			Timer 2 Interrupt
// 
ISR(TIMER1_COMPA_vect){
    get_time();
}
//*******************************************************

//*******************************************************
uint8_t main(void){
    uint8_t mode = 0; // 0 = time, 1 = time_set, 2=power_off_start, 3=power_off_stop
    uint8_t power_en;
    uint8_t user_override = FALSE;

    // Power off nixie supply ASAP
	PORTC &= ~(1<<PC3); //keep Nixie Supply off at poweron
    DDRC |= (1<<PC3);   // Set PC3 as an output
	
	//Buttons
	DDRD |= (1<<PD6) | (1<<PD7); // Set PD6 and PD7 as outputs
	DDRD &= ~(1<<PD3); // SW4
	DDRD &= ~(1<<PD4); // SW3
	DDRD &= ~(1<<PD5); // SW2
	PORTD |= (1<<PD3) | (1<<PD4) | (1<<PD5); //enable pullups
	PORTD |= (1<<PD6); 		//keep LEDs off to start
	PORTD |= (1<<PD7); 		//keep LEDs off to start


	// PORTD &= ~(1<<PD6);
	// PORTD &= ~(1<<PD7);

	twi_init();
	spi_init_master();
    nixie_tube_supply(FALSE);

	timer1_init();
	
    get_time(); // Get the current time
    write_seconds(); // Initialize the oscillator (preserve time)
    write_hours(); // Set the hours to 12 mode (preserve time)
    write_rtc(0x3, 1<<3); // Enable battery backup

    write_rtc(0x7, (1<<6) | (1<<0)); // Enable output oscilator
    // write_rtc(0x7, (1<<6) | (1<<2) | (1<<0)); // Enable output oscilator
    trim_rtc(); // Set the RTC TRIM

    // Get power down values from EEPROM
    eeprom_read_block((void*)&pwr_dwn_start_time, (const void*) &pwr_dwn_start_time_eeprom, sizeof(pwr_dwn_start_time_eeprom));
    eeprom_read_block((void*)&pwr_dwn_stop_time, (const void*) &pwr_dwn_stop_time_eeprom, sizeof(pwr_dwn_stop_time_eeprom));

    power_en = TRUE;
    nixie_tube_supply(power_en);


	while(TRUE){
        if(power_en == FALSE){
            // Turn the dispaly back on with user override of any button press
            if(chk_button_momt(0) || chk_button_momt(1) || chk_button_momt(2)){
                power_en = TRUE;
                user_override = TRUE;
                nixie_tube_supply(power_en);
            }
            // /*
            else if((clock_time.pm_am_n == pwr_dwn_stop_time.pm_am_n) && (clock_time.hours == pwr_dwn_stop_time.hours) && (clock_time.minutes  == pwr_dwn_stop_time.minutes)){
                // Restore power at user selected time
                power_en = TRUE;
                user_override = FALSE;
                nixie_tube_supply(power_en);
            }
            // */
        }
        else if(chk_button_hold(0) && chk_button_hold(1)){
            // Reset all times to zero
            init_time(&pwr_dwn_stop_time);
            init_time(&pwr_dwn_start_time);
        }
        else if(chk_button_momt(2)){
            mode = mode < 3 ? mode + 1 : 0; // 0 = time, 1 = time_set, 2=power_off_start, 3=power_off_stop
            // Write power down settings to memory on returning to time
            if(mode == 0){
                eeprom_write_block ((const void*)&pwr_dwn_start_time, (void*) &pwr_dwn_start_time_eeprom, sizeof(pwr_dwn_start_time_eeprom));
                eeprom_write_block ((const void*)&pwr_dwn_stop_time, (void*) &pwr_dwn_stop_time_eeprom, sizeof(pwr_dwn_stop_time_eeprom));
            }            
        }
        else if(mode == 1){
            get_time_change(&clock_time, 255);
            write_minutes(); 
            write_hours();
        }
        else if(mode == 2){
            get_time_change(&pwr_dwn_start_time, 511);
        }
        else if(mode == 3){
            get_time_change(&pwr_dwn_stop_time, 1023);
        }
        else if((clock_time.pm_am_n == 0) && (clock_time.hours == 3) && (clock_time.minutes < 30)){
            cathode_poisin_prevention();
        }
        else if(chk_button_hold(0)){
            set_tubes(clock_time.seconds_ones, clock_time.seconds_tens, clock_time.minutes_ones, clock_time.minutes_tens , TRUE);
        }
        else{
            if(!user_override && (clock_time.pm_am_n == pwr_dwn_start_time.pm_am_n) && (clock_time.hours == pwr_dwn_start_time.hours) && (clock_time.minutes == pwr_dwn_start_time.minutes)){
                // Turn off display at user indicated time (assuming there is a delta in time)
                if((pwr_dwn_stop_time.pm_am_n != pwr_dwn_start_time.pm_am_n) || (pwr_dwn_stop_time.hours != pwr_dwn_start_time.hours) || (pwr_dwn_stop_time.minutes  != pwr_dwn_start_time.minutes)){
                    power_en = FALSE;
                    user_override = FALSE;
                    nixie_tube_supply(power_en);
                }
            }
            else if((clock_time.pm_am_n == pwr_dwn_stop_time.pm_am_n) && (clock_time.hours == pwr_dwn_stop_time.hours) && (clock_time.minutes  == pwr_dwn_stop_time.minutes)){
                // Restore power at user selected time
                user_override = FALSE;
            }
            set_tubes(clock_time.minutes_ones, clock_time.minutes_tens, clock_time.hours_ones, clock_time.hours_tens , TRUE);
        }
        _delay_us(1000);


	}
	return 0;
}

// Old test code

    // Wait for button press before begining sequence
    // while(!chk_button(1)){
        // _delay_us(10000);
    // }

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
