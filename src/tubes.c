//tubes.c
//A. Briggs
//10/09/16
#define F_CPU 8000000 //8Mhz clock

#include <util/delay.h>
#include "tubes.h"

#define TRUE 1
#define FALSE 0

#define SER PB3
#define SRCLK PB5
#define SCLR_N PB0
#define OE_N PB1
#define RCLK PB2
#define EN_180V PC3
#define COL_SEL PB7

// Initialize SPI Master Device (without interrupt)
void spi_init_master (void)
{
    // Set MOSI, SCK, SCLR_N, OE_N, and RCLK as Output
    DDRB |= (1<<SER)|(1<<SRCLK)|(1<<SCLR_N)|(1<<OE_N)|(1<<RCLK);

    // Enable COL_SEL pin
    DDRB |= (1<<COL_SEL);

    // Enable SHTDN function
    DDRC |= (1<<EN_180V);
    PORTC |= (1<<EN_180V);
 
    // Enable SPI, Set as Master
    //Prescaler: Fosc/16, disable Interrupts
    SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0);

    PORTB |= (1<<SCLR_N); // Disable CLR
    PORTB |= (1<<OE_N);   // Disable output initially

    // Disable power supply by default
    PORTC &= ~(1<<EN_180V);
}

void nixie_tube_supply (uint8_t status){
    // Set power supply based on intput
    if(status == TRUE){
        PORTC |= (1<<EN_180V);
    }
    else{
        PORTC &= ~(1<<EN_180V);
    }
}

/********************set_nixie*************************/
// Set the different annondes/cathodes
//
//Function to send and receive data for both master and slave
void set_tubes (uint8_t nix0, uint8_t nix1, uint8_t nix2, uint8_t nix3, uint8_t colon_en)
{
    uint8_t upper = 0;
    uint8_t lower = 0;

    uint8_t n0_digit = dec_to_bin_normal(nix0);
    uint8_t n1_digit = dec_to_bin_normal(nix1);
    uint8_t n2_digit = dec_to_bin_normal(nix2);
    uint8_t n3_digit = dec_to_bin_fucked(nix3);

    PORTB &= ~(1<<RCLK); // make sure parallel clock is low
    PORTB |= (1<<OE_N);  // Disable output initially

    upper =  (n1_digit<<4) | n0_digit;
    lower =  (n3_digit<<4) | n2_digit;

    write_shift_reg(upper);
    write_shift_reg(lower);

    PORTB |= (1<<RCLK); // create rising edge on parallel clock
    _delay_us(10);
    PORTB &= ~(1<<RCLK); // toggle parallel clock low

    PORTB &= ~(1<<OE_N); // enable output

    // Set Colon based on input
    if(colon_en == TRUE){
        PORTB |= (1<<COL_SEL);
    }
    else{
        PORTB &= ~(1<<COL_SEL);
    }
}
/**************************************************************/

/********************dec_to_bin_ordered*************************/
// Convert decimal number to binary for SN74141
//
// Conversion table:
//    DCBA
// 4'b0000 = 0
// 4'b0001 = 1
// 4'b0010 = 2
// 4'b0011 = 3
// 4'b0100 = 4
// 4'b0101 = 5
// 4'b0110 = 6
// 4'b0111 = 7
// 4'b1000 = 8
// 4'b1001 = 9
// 4'b1010-4'b1111 = RESERVED! DO NOT USE!
// This function is overkill, but helps keep only legal values assinged
uint8_t dec_to_bin_normal (uint8_t decimal){
    uint8_t ret_bin = 0;

    switch(decimal){
        case 0 : 
            ret_bin = 0b0000;
            break;
        case 1 : 
            ret_bin = 0b0001;
            break;
        case 2 : 
            ret_bin = 0b0010;
            break;
        case 3 : 
            ret_bin = 0b0011;
            break;
        case 4 : 
            ret_bin = 0b0100;
            break;
        case 5 : 
            ret_bin = 0b0101;
            break;
        case 6 : 
            ret_bin = 0b0110;
            break;
        case 7 : 
            ret_bin = 0b0111;
            break;
        case 8 : 
            ret_bin = 0b1000;
            break;
        case 9 : 
            ret_bin = 0b1001;
            break;
        default:
            ret_bin = 0b0000;
    }

    return ret_bin;
}

/********************dec_to_bin_fucked*************************/
// Convert decimal number to binary for SN74141
//
// Conversion table:
//    DCBA
// 4'b0000 = 0
// 4'b0001 = 1
// 4'b0010 = 2
// 4'b0011 = 3
// 4'b0100 = 4
// 4'b0101 = 5
// 4'b0110 = 6
// 4'b0111 = 7
// 4'b1000 = 8
// 4'b1001 = 9
// 4'b1010-4'b1111 = RESERVED! DO NOT USE!
// Nixie tube 4 has a pin swap (DOH!) -- unfuck that here
uint8_t dec_to_bin_fucked (uint8_t decimal){
    uint8_t ret_bin = 0;

    switch(decimal){
        case 0 : 
            ret_bin = 0b0000;
            break;
        case 1 : 
            ret_bin = 0b0001;
            break;
        case 2 : 
            ret_bin = 0b0010;
            break;
        case 3 : 
            ret_bin = 0b0011;
            break;
        case 4 : 
            ret_bin = 0b0101;
            break;
        case 5 : 
            ret_bin = 0b0100;
            break;
        case 6 : 
            ret_bin = 0b0110;
            break;
        case 7 : 
            ret_bin = 0b0111;
            break;
        case 8 : 
            ret_bin = 0b1000;
            break;
        case 9 : 
            ret_bin = 0b1001;
            break;
        default:
            ret_bin = 0b0000;
    }

    return ret_bin;
}

/********************write_shift_reg*************************/
// Write a value to the RTC
//
//Function to send and receive data for both master and slave
void write_shift_reg (uint8_t data)
{
    // Load data into the buffer
    SPDR = data;
 
    //Wait until transmission complete
    while(!(SPSR & (1<<SPIF) ));
}
/**************************************************************/