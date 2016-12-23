//tubes.h
//A. Briggs
//10/09/16

#include <avr/io.h>

void spi_init_master (void);
void nixie_tube_supply (uint8_t status);
uint8_t dec_to_bin_normal (uint8_t decimal);
uint8_t dec_to_bin_fucked (uint8_t decimal);
void set_tubes (uint8_t nix0, uint8_t nix1, uint8_t nix2, uint8_t nix3, uint8_t colon_en);
void write_shift_reg (uint8_t data);
