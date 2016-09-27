EESchema Schematic File Version 2
LIBS:nixie_clock-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nixie_lib
LIBS:nixie_clock-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74HC595-RESCUE-nixie_clock U3
U 1 1 54DAD391
P 4450 3600
F 0 "U3" H 4600 4200 70  0000 C CNN
F 1 "74HC595" H 4450 3000 70  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4450 3600 60  0001 C CNN
F 3 "" H 4450 3600 60  0000 C CNN
	1    4450 3600
	1    0    0    -1  
$EndComp
$Comp
L 74HC595-RESCUE-nixie_clock U4
U 1 1 54DAD398
P 7750 3650
F 0 "U4" H 7900 4250 70  0000 C CNN
F 1 "74HC595" H 7750 3050 70  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 7750 3650 60  0001 C CNN
F 3 "" H 7750 3650 60  0000 C CNN
	1    7750 3650
	1    0    0    -1  
$EndComp
Text HLabel 9950 2800 2    60   Output ~ 0
SEL_ZERO
Text HLabel 9950 2900 2    60   Output ~ 0
SEL_ONE
Text HLabel 9950 3000 2    60   Output ~ 0
SEL_TWO
Text HLabel 9950 3100 2    60   Output ~ 0
SEL_THREE
Text HLabel 9950 3200 2    60   Output ~ 0
SEL_FOUR
Text HLabel 9950 3300 2    60   Output ~ 0
SEL_FIVE
Text HLabel 9950 3400 2    60   Output ~ 0
SEL_SIX
Text HLabel 9950 3500 2    60   Output ~ 0
SEL_SEVEN
Text HLabel 9950 3600 2    60   Output ~ 0
SEL_EIGHT
Text HLabel 9950 3700 2    60   Output ~ 0
SEL_NINE
Text HLabel 9950 4250 2    60   Output ~ 0
SEL_NIX1
Text HLabel 9950 4350 2    60   Output ~ 0
SEL_NIX2
Text HLabel 9950 4450 2    60   Output ~ 0
SEL_NIX3
Text HLabel 9950 4150 2    60   Output ~ 0
SEL_NIX0
Entry Wire Line
	9650 2800 9750 2900
Entry Wire Line
	9650 2900 9750 3000
Entry Wire Line
	9650 3000 9750 3100
Entry Wire Line
	9650 3100 9750 3200
Entry Wire Line
	9650 3300 9750 3400
Entry Wire Line
	9650 3200 9750 3300
Entry Wire Line
	9650 3400 9750 3500
Entry Wire Line
	9650 3500 9750 3600
Entry Wire Line
	9650 3600 9750 3700
Entry Wire Line
	9650 2700 9750 2800
Entry Wire Line
	9650 4150 9750 4250
Entry Wire Line
	9650 4250 9750 4350
Entry Wire Line
	9650 4350 9750 4450
Entry Wire Line
	9650 4050 9750 4150
Text Label 9600 2150 2    60   ~ 0
DIGIT_SEL
Text Label 9500 4000 2    60   ~ 0
TUBE_SEL
Text Label 9850 2800 2    60   ~ 0
S0
Text Label 9850 2900 2    60   ~ 0
S1
Text Label 9850 3000 2    60   ~ 0
S2
Text Label 9850 3100 2    60   ~ 0
S3
Text Label 9850 3200 2    60   ~ 0
S4
Text Label 9850 3300 2    60   ~ 0
S5
Text Label 9850 3400 2    60   ~ 0
S6
Text Label 9850 3500 2    60   ~ 0
S7
Text Label 9850 3600 2    60   ~ 0
S8
Text Label 9850 3700 2    60   ~ 0
S9
Text Label 9850 4150 2    60   ~ 0
S0
Text Label 9850 4250 2    60   ~ 0
S1
Text Label 9850 4350 2    60   ~ 0
S2
Text Label 9850 4450 2    60   ~ 0
S3
Text HLabel 2400 3300 0    60   Input ~ 0
SER
Text HLabel 2400 3450 0    60   Input ~ 0
SRCLK
Text HLabel 2400 3550 0    60   Input ~ 0
SCLR
Text HLabel 2400 3850 0    60   Input ~ 0
OE
Text HLabel 2400 3750 0    60   Input ~ 0
RCLK
$Comp
L GND #PWR042
U 1 1 54DAEE96
P 6900 4200
F 0 "#PWR042" H 6900 3950 60  0001 C CNN
F 1 "GND" H 6900 4050 60  0000 C CNN
F 2 "" H 6900 4200 60  0000 C CNN
F 3 "" H 6900 4200 60  0000 C CNN
	1    6900 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 54DAEEAC
P 3600 4150
F 0 "#PWR043" H 3600 3900 60  0001 C CNN
F 1 "GND" H 3600 4000 60  0000 C CNN
F 2 "" H 3600 4150 60  0000 C CNN
F 3 "" H 3600 4150 60  0000 C CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
Entry Wire Line
	5500 3750 5400 3850
Entry Wire Line
	5500 3650 5400 3750
Entry Wire Line
	5500 3550 5400 3650
Entry Wire Line
	5500 3450 5400 3550
Entry Wire Line
	5500 3350 5400 3450
Entry Wire Line
	5500 3250 5400 3350
Entry Wire Line
	5500 3150 5400 3250
Entry Wire Line
	5500 3050 5400 3150
Entry Wire Line
	8750 3200 8650 3300
Entry Wire Line
	8750 3100 8650 3200
Text Label 5400 3150 2    60   ~ 0
S0
Text Label 5400 3250 2    60   ~ 0
S1
Text Label 5400 3350 2    60   ~ 0
S2
Text Label 5400 3450 2    60   ~ 0
S3
Text Label 5400 3550 2    60   ~ 0
S4
Text Label 5400 3650 2    60   ~ 0
S5
Text Label 5400 3750 2    60   ~ 0
S6
Text Label 5400 3850 2    60   ~ 0
S7
Text Label 8650 3200 2    60   ~ 0
S8
Text Label 8650 3300 2    60   ~ 0
S9
Entry Wire Line
	8900 3600 8800 3700
Entry Wire Line
	8900 3500 8800 3600
Entry Wire Line
	8900 3800 8800 3900
Entry Wire Line
	8900 3700 8800 3800
Text HLabel 9950 3800 2    60   Output ~ 0
SEL_DOT_TOP
Text HLabel 9950 3900 2    60   Output ~ 0
SEL_DOT_BOT
Entry Wire Line
	9650 3700 9750 3800
Entry Wire Line
	9650 3800 9750 3900
Text Label 9850 3800 2    60   ~ 0
D0
Text Label 9850 3900 2    60   ~ 0
D1
Entry Wire Line
	8750 3400 8650 3500
Entry Wire Line
	8750 3300 8650 3400
Text Label 8650 3400 2    60   ~ 0
D0
Text Label 8650 3500 2    60   ~ 0
D1
$Comp
L GND #PWR044
U 1 1 54DB0426
P 3050 3050
F 0 "#PWR044" H 3050 2800 60  0001 C CNN
F 1 "GND" H 3050 2900 60  0000 C CNN
F 2 "" H 3050 3050 60  0000 C CNN
F 3 "" H 3050 3050 60  0000 C CNN
	1    3050 3050
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-nixie_clock C19
U 1 1 54DB0624
P 6350 2850
F 0 "C19" H 6400 2950 50  0000 L CNN
F 1 "0.1u" H 6400 2750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6388 2700 30  0001 C CNN
F 3 "" H 6350 2850 60  0000 C CNN
	1    6350 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR045
U 1 1 54DB062A
P 6350 3100
F 0 "#PWR045" H 6350 2850 60  0001 C CNN
F 1 "GND" H 6350 2950 60  0000 C CNN
F 2 "" H 6350 3100 60  0000 C CNN
F 3 "" H 6350 3100 60  0000 C CNN
	1    6350 3100
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-nixie_clock C18
U 1 1 575C6D39
P 3050 2800
F 0 "C18" H 3100 2900 50  0000 L CNN
F 1 "0.1u" H 3100 2700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3088 2650 30  0001 C CNN
F 3 "" H 3050 2800 60  0000 C CNN
	1    3050 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3150 3550 3150
Wire Wire Line
	3550 3150 3550 2300
Wire Bus Line
	9650 2150 9650 3800
Wire Bus Line
	8900 4000 9650 4000
Wire Bus Line
	9650 4000 9650 4400
Wire Wire Line
	9750 2800 9950 2800
Wire Wire Line
	9950 2900 9750 2900
Wire Wire Line
	9750 3000 9950 3000
Wire Wire Line
	9950 3100 9750 3100
Wire Wire Line
	9950 3200 9750 3200
Wire Wire Line
	9950 3300 9750 3300
Wire Wire Line
	9750 3400 9950 3400
Wire Wire Line
	9750 3500 9950 3500
Wire Wire Line
	9750 3600 9950 3600
Wire Wire Line
	9750 3700 9950 3700
Wire Wire Line
	9750 4150 9950 4150
Wire Wire Line
	9750 4250 9950 4250
Wire Wire Line
	9750 4350 9950 4350
Wire Wire Line
	9750 4450 9950 4450
Wire Wire Line
	5150 4050 6050 4050
Wire Wire Line
	6050 4050 6050 3350
Wire Wire Line
	6050 3350 7050 3350
Wire Wire Line
	2400 3450 3750 3450
Wire Wire Line
	3250 3450 3250 4900
Wire Wire Line
	3250 4900 6200 4900
Wire Wire Line
	6200 4900 6200 3500
Wire Wire Line
	6200 3500 7050 3500
Wire Wire Line
	2400 3550 3750 3550
Wire Wire Line
	3300 3550 3300 4850
Wire Wire Line
	3300 4850 6250 4850
Wire Wire Line
	6250 4850 6250 3600
Wire Wire Line
	6250 3600 7050 3600
Wire Wire Line
	2400 3750 3750 3750
Wire Wire Line
	3350 3750 3350 4800
Wire Wire Line
	3350 4800 6300 4800
Wire Wire Line
	6300 4800 6300 3800
Wire Wire Line
	6300 3800 7050 3800
Wire Wire Line
	2400 3850 3750 3850
Wire Wire Line
	3400 3850 3400 4750
Wire Wire Line
	3400 4750 6350 4750
Wire Wire Line
	6350 4750 6350 3900
Wire Wire Line
	6350 3900 7050 3900
Wire Wire Line
	3750 4000 3600 4000
Wire Wire Line
	3600 4000 3600 4150
Wire Wire Line
	7050 4050 6900 4050
Wire Wire Line
	6900 4050 6900 4200
Wire Wire Line
	2400 3300 3750 3300
Connection ~ 3250 3450
Connection ~ 3300 3550
Connection ~ 3350 3750
Connection ~ 3400 3850
Wire Bus Line
	5500 2150 5500 3850
Wire Bus Line
	5500 2150 9650 2150
Wire Bus Line
	8750 2150 8750 3500
Wire Wire Line
	5150 3850 5400 3850
Wire Wire Line
	5400 3750 5150 3750
Wire Wire Line
	5150 3650 5400 3650
Wire Wire Line
	5400 3550 5150 3550
Wire Wire Line
	5400 3450 5150 3450
Wire Wire Line
	5400 3350 5150 3350
Wire Wire Line
	5400 3250 5150 3250
Wire Wire Line
	5400 3150 5150 3150
Wire Wire Line
	8450 3200 8650 3200
Wire Wire Line
	8450 3300 8650 3300
Wire Bus Line
	8900 3500 8900 4000
Wire Wire Line
	8450 3600 8800 3600
Wire Wire Line
	8450 3700 8800 3700
Wire Wire Line
	8450 3800 8800 3800
Wire Wire Line
	8450 3900 8800 3900
Wire Wire Line
	9750 3800 9950 3800
Wire Wire Line
	9750 3900 9950 3900
Wire Wire Line
	8450 3500 8650 3500
Wire Wire Line
	3050 3050 3050 3000
Wire Wire Line
	3050 2600 3050 2500
Wire Wire Line
	3050 2500 3550 2500
Connection ~ 3550 2500
Wire Wire Line
	7050 3200 6850 3200
Wire Wire Line
	6850 3200 6850 2350
Wire Wire Line
	6350 3100 6350 3050
Wire Wire Line
	6350 2650 6350 2550
Wire Wire Line
	6350 2550 6850 2550
Connection ~ 6850 2550
Wire Wire Line
	8450 3400 8650 3400
$Comp
L +3.3V #PWR046
U 1 1 575E5831
P 6850 2350
F 0 "#PWR046" H 6850 2200 50  0001 C CNN
F 1 "+3.3V" H 6850 2490 50  0000 C CNN
F 2 "" H 6850 2350 50  0000 C CNN
F 3 "" H 6850 2350 50  0000 C CNN
	1    6850 2350
	1    0    0    -1  
$EndComp
NoConn ~ 8450 4100
$Comp
L +3.3V #PWR047
U 1 1 575EC85F
P 3550 2300
F 0 "#PWR047" H 3550 2150 50  0001 C CNN
F 1 "+3.3V" H 3550 2440 50  0000 C CNN
F 2 "" H 3550 2300 50  0000 C CNN
F 3 "" H 3550 2300 50  0000 C CNN
	1    3550 2300
	1    0    0    -1  
$EndComp
Text Label 8650 3600 2    60   ~ 0
S0
Text Label 8650 3700 2    60   ~ 0
S1
Text Label 8650 3800 2    60   ~ 0
S2
Text Label 8650 3900 2    60   ~ 0
S3
$EndSCHEMATC
