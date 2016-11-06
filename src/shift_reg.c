//shift_reg.c
//A. Briggs
//10/09/16

#include "shift_reg.h"

#define TRUE 1
#define FALSE 0

#define SER PB3
#define SRCLK PB5
#define SCLR PB0
#define OE PB1
#define RCLK PB2

// Initialize SPI Master Device (without interrupt)
void spi_init_master (void)
{
    // Set MOSI, SCK, SCLR, OE, and RCLK as Output
    DDRB = (1<<SER)|(1<<SRCLK)|(1<<SCLR)|(1<<OE)|(1<<RCLK);
 
    // Enable SPI, Set as Master
    //Prescaler: Fosc/16, disable Interrupts
    SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0);

    PORTB |= (1<<SCLR); // SCLR is active low, so disable CLR
    PORTB &= ~(1<<OE); // Disable output initially
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
    PORTB &= ~(1<<OE); // Disable output initially

    upper =  annode | dot | ((1<<digit >> 8));
    lower = ((1<<digit)&0xFF);

    write_shift_reg(upper);
    write_shift_reg(lower);

    PORTB |= (1<<RCLK); // create rising edge on parallel clock
    _delay_us(10);
    PORTB &= ~(1<<RCLK); // toggle parallel clock low

    PORTB |= (1<<OE); // enable output
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

/********************read_rtc*************************/
// Read from the RTC SRAM
//
uint8_t read_rtc(uint8_t addr){

	twi_start();
	twi_write(WRITE_RTC); // Send command to read from address
	twi_write(addr); // Send address of part number
	twi_start();
	twi_write(READ_RTC); // Send command to read data
	return twi_read_nack();

}
/**************************************************************/
