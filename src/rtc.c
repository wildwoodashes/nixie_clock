//rtc.c
//A. Briggs
//10/09/16

#include <avr/interrupt.h>
#include "rtc.h"

#define TRUE 1
#define FALSE 0

#define READ_RTC 0b11011111
#define WRITE_RTC 0b11011110

void twi_init(void)
{
    //set SCL to 200kHz
    TWSR = 0x00;
    TWBR = 0x0C;
    //enable TWI
    TWCR = (1<<TWEN);
}

// send a start signal
void twi_start(void)
{
    TWCR = (1<<TWINT)|(1<<TWSTA)|(1<<TWEN);
    while ((TWCR & (1<<TWINT)) == 0);
}

//send stop signal
void twi_stop(void)
{
    TWCR = (1<<TWINT)|(1<<TWSTO)|(1<<TWEN);
}

// write to the RTC
void twi_write(uint8_t u8data)
{
    TWDR = u8data;
    TWCR = (1<<TWINT)|(1<<TWEN);
    while ((TWCR & (1<<TWINT)) == 0);
}

//read byte with ACK
uint8_t twi_read_ack(void)
{
    TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWEA);
    while ((TWCR & (1<<TWINT)) == 0);
    return TWDR;
}

//read byte with NACK
uint8_t twi_read_nack(void)
{
    TWCR = (1<<TWINT)|(1<<TWEN);
    while ((TWCR & (1<<TWINT)) == 0);
    return TWDR;
}


/********************write_rtc*************************/
// Write a value to the RTC
//
void write_rtc(uint8_t addr, uint8_t data){
	cli(); // Prevent interrupts from breaking I2C command
	twi_start();
	twi_write(WRITE_RTC); // Send command to read from address
	twi_write(addr); // Send address of part number
	twi_write(data); // Send command to read data
    sei(); // Renable interrupts
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
