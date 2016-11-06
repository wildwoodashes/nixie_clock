//tubes.h
//A. Briggs
//10/09/16

#include <avr/io.h>

void spi_init_master (void);
void set_tubes (uint8_t nix_sel, uint8_t digit, uint8_t colon_en);
void write_shift_reg (uint8_t data);
