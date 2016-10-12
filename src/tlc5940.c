//tlc5940.c
//A. Briggs
//8.6.10
#include "tlc5940.h"

#define DIG1 (1<<PD1)
#define DIG2 (1<<PD3)
#define DIG3 (1<<PD2)
#define DIG4 (1<<PD0)

uint8_t ASCI_2_7SEG[11] = 
 {0b10111011,				//0
  0b00010010,				//1
  0b10001111,				//2
  0b00011111,				//3
  0b00110110,				//4
  0b00111101,				//5
  0b10111101,				//6
  0b00011010,				//7
  0b10111111,				//8
  0b00111110,				//9
  0b01000000};				//.


volatile uint16_t outputReg[8];
volatile uint16_t outputPWM = 1000;		// 0 - 4096
volatile uint16_t LED_gs[ 16 * NUMOFTLC5940];
volatile uint8_t dot_value = 0;
volatile uint8_t FirstCycleFlag = FALSE;
volatile uint8_t num_of_tlc5940 = 0;
volatile uint8_t gs_update_needed = FALSE;
volatile uint8_t dc_update_needed = FALSE;

//******************************************************************************
//                            chk_button                                      
//Checks the state of the button number passed to it. It shifts in ones till   
//the button is pushed. Function returns a 1 only once per debounced button    
//push so a debounce and toggle function can be implemented at the same time.  
//Adapted to check all buttons from Ganssel's "Guide to Debouncing"            
//Expects active low pushbuttons on PINA port.  Debounce time is determined by 
//external loop delay times 12. 
//
uint8_t chk_button(void) {
  static uint16_t state = 0; //holds present state button
  state = (state << 1) | (! bit_is_clear(PINC, 3)) | 0xE000;
  if (state == 0xF000) return TRUE;
  return FALSE;
}
//******************************************************************************

//*******************************************************
//			set_seg(uint8_t digit){
// sets the output register of the TCL5940 to the digit
// indicated by "digit"
//
void set_seg(uint8_t digit){
  uint8_t i = 0;
  uint16_t tmp = ((outputReg[digit+4]<<8)|(outputReg[digit]));
  for(i = 0; i < 16; i++){
    if(tmp & (1<<i)){
      set_gs_data(i, outputPWM);
    }
    else{
      set_gs_data(i, 0);
    }
  }
  grayscale_update();
}
//*******************************************************


//*******************************************************
//                     switch_seg(uint8_t digit)
// switches to next segment when called
//
void switch_seg(uint8_t digit){
  PORTD |= (DIG1 + DIG2 + DIG3 + DIG4);
  switch(digit){
    case 0:
      PORTD &= ~DIG1;
      break;
    case 1:
      PORTD &= ~DIG2;
      break;
    case 2:
      PORTD &= ~DIG3;
      break;
    default:
      PORTD &= ~DIG4;
  }
}
//******************************************************
 

//*******************************************************
//			set_DC(uint8_t percent)
// sets dot correction to 3F
//
void set_DC_single(uint8_t LED, uint8_t dot_value){
}
//*******************************************************


//*******************************************************
//			set_DC_all(void)
// sets dot correction for all LEDs
// input must be between 0 and 0x3F (63)
//
void set_DC_all(void){
  uint8_t i = 0;

  if(dot_value > 0x3F){
    dot_value = 0x3F;
  }

  PORTD |= (1<<VPRG);

  for(i = 0; i<4*NUMOFTLC5940; i++){
   //First set
   // transmission
   SPDR = (((dot_value << 2) & 0xFC) | ((dot_value >> 4) & 0x03));
   //wait for transmission to complete
   while(!(SPSR & (1<<SPIF)));

   //Second set
   // transmission
   SPDR = (((dot_value << 4) & 0xF0) | ((dot_value >> 2) & 0x0F));
   //wait for transmission to complete
   while(!(SPSR & (1<<SPIF)));

   //third Set
   // transmission
   SPDR = (((dot_value << 6) & 0xC0) | (dot_value & 0x3F));
   //wait for transmission to complete
   while(!(SPSR & (1<<SPIF)));

  }
  
  //pulse XLAT;
  PORTB |= (1<<XLAT);
  PORTB &= ~(1<<XLAT);

  //set first cycle flag
  FirstCycleFlag = TRUE;
}
//*******************************************************


//******************************************************
//			update_tlc5940
// checks for update flag and takes coresponding action
//
void update_tlc5940(){
  
  //Update grayscale data if needed
  if(gs_update_needed == TRUE){
    //make sure VPRG is low
    PORTD &= ~(1<<VPRG);

    //turn on LEDs 
    PORTB &= ~(1<<BLANK);
  
    //turn on GSCLK
    TCCR0A |= (1<<COM0A0);
    TCCR0B |= (1<<CS00);
    
    uint8_t i = 0;
    uint8_t upper_nibble = 0;
    uint8_t lower_nibble = 0;
    uint8_t data_out = 0;
 
    for( i = 0; i < (8 * NUMOFTLC5940); i++){
       //set up first portion
       data_out = ((LED_gs[(16*NUMOFTLC5940 - 1) - (2*i)] & 0x0FF0) >> 4);
       //start
       SPDR = data_out;
       //wait for transmission to complete
       while(bit_is_clear(SPSR,SPIF)){}
 
       //set up second portion
       upper_nibble = ((LED_gs[(16*NUMOFTLC5940 - 1) - (2*i)] & 0x0F) << 4 );
       lower_nibble = ((LED_gs[(16*NUMOFTLC5940 -1) - (2*i+1)] & 0x0F00) >> 8);
       data_out = upper_nibble | lower_nibble;
       //start transmission
       SPDR = data_out;
       //wait for transmission to complete
       while(!(SPSR & (1<<SPIF)));
  
       //set up third portion
       data_out = ((LED_gs[(16*NUMOFTLC5940 - 1)- (2*i+1)] & 0xFF));
       //start transmission
       SPDR = data_out;
       //wait for transmission to complete
       while(!(SPSR & (1<<SPIF)));
    } 
    gs_update_needed = FALSE;
  }
  //update dc data if needed
  if(dc_update_needed == TRUE){
  //COMPLETE LATER
    dc_update_needed = FALSE; 
    set_DC_all();
  }
}
//*******************************************************


//*******************************************************
//			clear_all_gs()
//clears all LEDs to zero
//
void clear_all_gs(){
  uint8_t i = 0;

  for(i = 0; i < NUMOFTLC5940*16; i++){
    LED_gs[i] = 0;
  }
}
//******************************************************


//*******************************************************
// 			grayscale_update()
// sets update flag for grayscale data
//
void grayscale_update(void){
  gs_update_needed = TRUE;
}
//*******************************************************


//*******************************************************
//			Timer 2 interrupt
// XTAL pulse generated every interrupt
ISR(TIMER2_COMPB_vect){
  static uint8_t outputDigit = 0;
  
  //turn off GSCLK
  TCCR0A &= ~(1<<COM0A0);
  TCCR0B &= ~(1<<CS00);
  PORTD &= ~(1<<GSCLK);  
  
  //turn off LEDs
  PORTB |= (1<<BLANK);

  //pulse XLAT
  PORTB |= (1<<XLAT);
  PORTB &= ~(1<<XLAT);
  
  //add extra sclk pulse for first GS cycle
  if(FirstCycleFlag == TRUE){
    //disable SPI control
    SPCR &= ~(1<<SPE);

    //pulse SCLK
    PORTB |= (1<<SCLK);
    PORTB &= ~(1<<SCLK);
  
    //enable SPI control
    SPCR |= (1<<SPE);
  
    FirstCycleFlag = FALSE;
  }
  //switch to new digit
  switch_seg(outputDigit);
  //increment digit
  if(outputDigit < 3){
    outputDigit++;
  } else{
    outputDigit = 0;
  }
  set_seg(outputDigit);
  update_tlc5940();
 

}
//*****************************************************


//*******************************************************
//		set_gs_data(uint8_t LED, uint16_t value)
// sets the LED "LED" to the PWM value of "value"
// returns TRUE on completion, FALSE else
//
uint8_t set_gs_data(uint8_t LED, uint16_t value){
  if(LED < NUMOFTLC5940*16){
    if(value <= MAX_VALUE){
      LED_gs[LED] = value;
      return TRUE;
    }
    else
      return FALSE;
  }
  else
    return FALSE;
}
//*******************************************************


//*******************************************************
//		get_gs_data(uint8_t LED)
// gets the PWM value of LED
// returns value, or 0xFFFF for error
//
uint16_t get_gs_data(uint8_t LED){
//  if(LED <= NUMOFTLC5940*15) 
    return LED_gs[LED];
//  else
//   return 0xFFFF;
}
//*******************************************************


//*******************************************************
//	dec_2_7Seg(uint8_t display, uint16_t value)
// converts decimal 'value' into format for seven segment
// display specified by 'display' with decimal in position
// indicated by 'dec' with 1 being rightmost, 4 being leftmost
// and zero indecating no decimal
//
void dec_2_7Seg(uint8_t display, uint16_t value, uint8_t dec){     
   if(display == 1){
     outputReg[0] = ASCI_2_7SEG[value%10];
     outputReg[1] = ASCI_2_7SEG[(value%100/10)];
     outputReg[2] = ASCI_2_7SEG[(value%1000/100)];
     outputReg[3] = ASCI_2_7SEG[(value/1000)];
     if(dec != 0)
       outputReg[dec - 1] |= ASCI_2_7SEG[10];
   } else if(display == 2){
     outputReg[4] = ASCI_2_7SEG[value%10];
     outputReg[5] = ASCI_2_7SEG[(value%100/10)];
     outputReg[6] = ASCI_2_7SEG[(value%1000/100)];
     outputReg[7] = ASCI_2_7SEG[(value/1000)];
     if(dec != 0)
       outputReg[dec + 3] |= ASCI_2_7SEG[10];
  }
}
//*******************************************************


//*******************************************************
//			tlc5940_init()
//initilizes tlc5940
//
void tlc5940_init(void){
  uint8_t i = 0;

  //PB2 = BLANK, PB0 = XLAT, PD7 = VPRG
  DDRB |= (1<<BLANK)|(1<<XLAT);
  DDRD |= (1<<VPRG);
  
   
  
  // set up initial pin values
  PORTB |= (1<<BLANK);
  PORTD |= (1<<VPRG);
  PORTB &= ~(1<<XLAT);
 
  //Enable digit outputs
  DDRD |= (DIG1 + DIG2 + DIG3 + DIG4);
  PORTD |= (DIG1 + DIG2 + DIG3 + DIG4);

  //PWM clock output
  DDRD |= (1<<GSCLK);
  PORTD &= ~(1<<GSCLK);  
  
  //SPI pins
  DDRB |= (1<<SIN)|(1<<SCLK);
  PORTB &= ~(1<<SCLK);
  //SPI, MSB first, 500kHz
  SPCR |= (1<<SPE)|(1<<SPR0)|(1<<MSTR);
  
  for(i = 0; i < 16*NUMOFTLC5940; i++){
    LED_gs[i] = 0x0;
  } 
 
  //set dot correction values
  set_DC_all();					//<<<--------------------------FIX!!!!!!!!!!!!!
 
  //PWM clock, No Prescaler, CTC mode, toggle on match, 250kHz, OCIE interupt
  TCCR0A |= (1<<COM0A0)|(1<<WGM01);
  TCCR0B |= (1<<CS00); 
  OCR0A = 0x04; //was 0x0F
  
  //XLAT interrupt, Cio/256, 122.xHz
  TCCR2A |= (1<<WGM21);
  TCCR2B |= (1<<CS22)|(1<<CS21)|(1<<CS20);
  TIMSK2 |= (1<<OCIE2B);
  OCR2B = 0x0F; // was 511
  
  //set dot value to turn on 100%
  dot_value = 0x3F;
 
  dc_update_needed = TRUE;

  //set initial gs data
  gs_update_needed = TRUE;

  //set initial output values
  for(i = 0; i < 8; i++){
  outputReg[i] = ASCI_2_7SEG[0];
  }
}
//******************************************************
