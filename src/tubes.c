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
#define SHTDN PC3

// Initialize SPI Master Device (without interrupt)
void spi_init_master (void)
{
    // Set MOSI, SCK, SCLR_N, OE_N, and RCLK as Output
    DDRB |= (1<<SER)|(1<<SRCLK)|(1<<SCLR_N)|(1<<OE_N)|(1<<RCLK);

    // Enable SHTDN function
    DDRC |= (1<<SHTDN);
    PORTC |= (1<<SHTDN);
 
    // Enable SPI, Set as Master
    //Prescaler: Fosc/16, disable Interrupts
    SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0);

    PORTB |= (1<<SCLR_N); // Disable CLR
    PORTB |= (1<<OE_N);   // Disable output initially

    // Enable power supply
    PORTC &= ~(1<<SHTDN);
}

/********************set_nixie*************************/
// Set the different annondes/cathodes
//
//Function to send and receive data for both master and slave
void set_tubes (uint8_t nix_sel, uint8_t digit, uint8_t colon_en)
{
    uint8_t dot = (colon_en == TRUE) ? (0x3 << 2) : 0x00;
    uint8_t annode = (nix_sel == 0) ? 0x00 : ((1<<(nix_sel-1)) << 4);
    uint8_t upper = 0;
    uint8_t lower = 0;

    PORTB &= ~(1<<RCLK); // make sure parallel clock is low
    PORTB |= (1<<OE_N);  // Disable output initially

    upper =  annode | dot | ((1<<digit >> 8));
    lower = ((1<<digit)&0xFF);

    write_shift_reg(upper);
    write_shift_reg(lower);

    PORTB |= (1<<RCLK); // create rising edge on parallel clock
    _delay_us(10);
    PORTB &= ~(1<<RCLK); // toggle parallel clock low

    PORTB &= ~(1<<OE_N); // enable output
}
/**************************************************************/

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