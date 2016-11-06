//rtc.h
//A. Briggs
//10/09/16

#include <avr/io.h>

void twi_init(void);
void twi_start(void);
void twi_write(uint8_t u8data);
uint8_t twi_read_ack(void);
uint8_t twi_read_nack(void);
void write_rtc(uint8_t addr, uint8_t data);
uint8_t read_rtc(uint8_t addr);

