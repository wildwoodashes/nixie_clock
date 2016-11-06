//tlc5940.h
//A. Briggs
//8.6.10
//TLC5940 driver
#include <avr/io.h>
#include <avr/interrupt.h>

#ifndef NUMOFTLC5940
// prevent compiler error by supplying a default
# warning "NUMOFTLC5940 not defined for tlc5940.h"
# define NUMOFTLC5940 1
#endif


//#define DCPRG PB
#define BLANK PB2
#define XLAT PB0
#define SIN PB3
#define VPRG PD7
#define SCLK PB5
#define GSCLK PD6

#define MAX_VALUE 4095

#define TRUE 1
#define FALSE 0

uint8_t chk_button(void);
void set_seg(uint8_t digit);
void switch_seg(uint8_t digit);
void update_tlc5940();
void clear_all_gs();
void grayscale_update(void);
ISR(TIMER1_COMPA_vect);
void set_DC(void);
uint8_t set_gs_data(uint8_t LED, uint16_t value);
uint16_t get_gs_data(uint8_t LED);
void dec_2_7Seg(uint8_t display, uint16_t value, uint8_t dec);
void tlc5940_init(void);
