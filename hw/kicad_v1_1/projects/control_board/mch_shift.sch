EESchema Schematic File Version 2
LIBS:control_board-rescue
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
LIBS:nixie_clock-rescue
LIBS:control_board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title "Control Board"
Date "2016-09-14"
Rev "1.0"
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
Text HLabel 10250 2800 2    60   Output ~ 0
SEL_N0_A
Text HLabel 10250 2900 2    60   Output ~ 0
SEL_N0_B
Text HLabel 10250 3000 2    60   Output ~ 0
SEL_N0_C
Text HLabel 10250 3100 2    60   Output ~ 0
SEL_N0_D
Text HLabel 10250 3200 2    60   Output ~ 0
SEL_N1_A
Text HLabel 10250 3300 2    60   Output ~ 0
SEL_N1_B
Text HLabel 10250 3400 2    60   Output ~ 0
SEL_N1_C
Text HLabel 10250 3500 2    60   Output ~ 0
SEL_N1_D
Text HLabel 10250 3600 2    60   Output ~ 0
SEL_N2_A
Text HLabel 10250 3700 2    60   Output ~ 0
SEL_N2_B
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
Text Label 9600 2150 2    60   ~ 0
DIGIT_SEL
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
L GND #PWR037
U 1 1 54DAEE96
P 6900 4200
F 0 "#PWR037" H 6900 3950 60  0001 C CNN
F 1 "GND" H 6900 4050 60  0000 C CNN
F 2 "" H 6900 4200 60  0000 C CNN
F 3 "" H 6900 4200 60  0000 C CNN
	1    6900 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 54DAEEAC
P 3600 4150
F 0 "#PWR038" H 3600 3900 60  0001 C CNN
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
N0_A
Text Label 5400 3250 2    60   ~ 0
N0_B
Text Label 5400 3350 2    60   ~ 0
N0_C
Text Label 5400 3450 2    60   ~ 0
N0_D
Text Label 5400 3550 2    60   ~ 0
N1_A
Text Label 5400 3650 2    60   ~ 0
N1_B
Text Label 5400 3750 2    60   ~ 0
N1_C
Text Label 5400 3850 2    60   ~ 0
N1_D
Text Label 8650 3200 2    60   ~ 0
N2_A
Text Label 8650 3300 2    60   ~ 0
N2_B
Text HLabel 10250 3800 2    60   Output ~ 0
SEL_N2_C
Text HLabel 10250 3900 2    60   Output ~ 0
SEL_N2_D
Entry Wire Line
	9650 3700 9750 3800
Entry Wire Line
	9650 3800 9750 3900
Entry Wire Line
	8750 3400 8650 3500
Entry Wire Line
	8750 3300 8650 3400
Text Label 8650 3400 2    60   ~ 0
N2_C
Text Label 8650 3500 2    60   ~ 0
N2_D
$Comp
L GND #PWR039
U 1 1 54DB0426
P 3050 3050
F 0 "#PWR039" H 3050 2800 60  0001 C CNN
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
L GND #PWR040
U 1 1 54DB062A
P 6350 3100
F 0 "#PWR040" H 6350 2850 60  0001 C CNN
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
NoConn ~ 8450 4100
Wire Wire Line
	3550 3150 3750 3150
Wire Wire Line
	3550 2300 3550 2500
Wire Wire Line
	3550 2500 3550 3150
Wire Bus Line
	9650 2150 9650 2700
Wire Bus Line
	9650 2700 9650 2800
Wire Bus Line
	9650 2800 9650 2900
Wire Bus Line
	9650 2900 9650 3000
Wire Bus Line
	9650 3000 9650 3100
Wire Bus Line
	9650 3100 9650 3200
Wire Bus Line
	9650 3200 9650 3300
Wire Bus Line
	9650 3300 9650 3400
Wire Bus Line
	9650 3400 9650 3500
Wire Bus Line
	9650 3500 9650 3600
Wire Bus Line
	9650 3600 9650 3700
Wire Bus Line
	9650 3700 9650 3800
Wire Bus Line
	9650 3800 9650 3900
Wire Bus Line
	9650 3900 9650 4000
Wire Bus Line
	9650 4000 9650 4100
Wire Bus Line
	9650 4100 9650 4200
Wire Wire Line
	9750 2800 10250 2800
Wire Wire Line
	10250 2900 9750 2900
Wire Wire Line
	9750 3000 10250 3000
Wire Wire Line
	10250 3100 9750 3100
Wire Wire Line
	10250 3200 9750 3200
Wire Wire Line
	10250 3300 9750 3300
Wire Wire Line
	9750 3400 10250 3400
Wire Wire Line
	9750 3500 10250 3500
Wire Wire Line
	9750 3600 10250 3600
Wire Wire Line
	9750 3700 10250 3700
Wire Wire Line
	5150 4050 6050 4050
Wire Wire Line
	6050 4050 6050 3350
Wire Wire Line
	6050 3350 7050 3350
Wire Wire Line
	2400 3450 3250 3450
Wire Wire Line
	3250 3450 3750 3450
Wire Wire Line
	3250 3450 3250 4900
Wire Wire Line
	3250 4900 6200 4900
Wire Wire Line
	6200 4900 6200 3500
Wire Wire Line
	6200 3500 7050 3500
Wire Wire Line
	2400 3550 3300 3550
Wire Wire Line
	3300 3550 3750 3550
Wire Wire Line
	3300 3550 3300 4850
Wire Wire Line
	3300 4850 6250 4850
Wire Wire Line
	6250 4850 6250 3600
Wire Wire Line
	6250 3600 7050 3600
Wire Wire Line
	2400 3750 3350 3750
Wire Wire Line
	3350 3750 3750 3750
Wire Wire Line
	3350 3750 3350 4800
Wire Wire Line
	3350 4800 6300 4800
Wire Wire Line
	6300 4800 6300 3800
Wire Wire Line
	6300 3800 7050 3800
Wire Wire Line
	2400 3850 3400 3850
Wire Wire Line
	3400 3850 3750 3850
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
	5500 2150 5500 3050
Wire Bus Line
	5500 3050 5500 3150
Wire Bus Line
	5500 3150 5500 3250
Wire Bus Line
	5500 3250 5500 3350
Wire Bus Line
	5500 3350 5500 3450
Wire Bus Line
	5500 3450 5500 3550
Wire Bus Line
	5500 3550 5500 3650
Wire Bus Line
	5500 3650 5500 3750
Wire Bus Line
	5500 3750 5500 3850
Wire Bus Line
	5500 2150 9650 2150
Wire Bus Line
	8750 2150 8750 3100
Wire Bus Line
	8750 3100 8750 3200
Wire Bus Line
	8750 3200 8750 3300
Wire Bus Line
	8750 3300 8750 3400
Wire Bus Line
	8750 3400 8750 3500
Wire Bus Line
	8750 3500 8750 3600
Wire Bus Line
	8750 3600 8750 3700
Wire Bus Line
	8750 3700 8750 3800
Wire Bus Line
	8750 3800 8750 3850
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
Wire Wire Line
	9750 3800 10250 3800
Wire Wire Line
	9750 3900 10250 3900
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
	6350 3100 6350 3050
Wire Wire Line
	6350 2450 6350 2650
Wire Wire Line
	8450 3400 8650 3400
Wire Wire Line
	6350 2450 6850 2450
Wire Wire Line
	6850 2350 6850 2450
Wire Wire Line
	6850 2450 6850 3200
Wire Wire Line
	6850 3200 7050 3200
Connection ~ 6850 2450
Entry Wire Line
	8650 3600 8750 3500
Entry Wire Line
	8650 3700 8750 3600
Entry Wire Line
	8650 3800 8750 3700
Entry Wire Line
	8650 3900 8750 3800
Wire Wire Line
	8450 3600 8650 3600
Wire Wire Line
	8450 3700 8650 3700
Wire Wire Line
	8450 3800 8650 3800
Wire Wire Line
	8450 3900 8650 3900
Text Label 8650 3600 2    60   ~ 0
N3_A
Text Label 8650 3700 2    60   ~ 0
N3_B
Text Label 8650 3800 2    60   ~ 0
N3_C
Text Label 8650 3900 2    60   ~ 0
N3_D
Text Label 10000 3600 2    60   ~ 0
N2_A
Text Label 10000 3700 2    60   ~ 0
N2_B
Text Label 10000 3800 2    60   ~ 0
N2_C
Text Label 10000 3900 2    60   ~ 0
N2_D
Text Label 10000 4000 2    60   ~ 0
N3_A
Text Label 10000 4100 2    60   ~ 0
N3_B
Text Label 10000 4200 2    60   ~ 0
N3_C
Text Label 10000 4300 2    60   ~ 0
N3_D
Text Label 10000 2800 2    60   ~ 0
N0_A
Text Label 10000 2900 2    60   ~ 0
N0_B
Text Label 10000 3000 2    60   ~ 0
N0_C
Text Label 10000 3100 2    60   ~ 0
N0_D
Text Label 10000 3200 2    60   ~ 0
N1_A
Text Label 10000 3300 2    60   ~ 0
N1_B
Text Label 10000 3400 2    60   ~ 0
N1_C
Text Label 10000 3500 2    60   ~ 0
N1_D
Text HLabel 10250 4000 2    60   Output ~ 0
SEL_N3_A
Text HLabel 10250 4100 2    60   Output ~ 0
SEL_N3_B
Entry Wire Line
	9650 3900 9750 4000
Entry Wire Line
	9650 4000 9750 4100
Text HLabel 10250 4200 2    60   Output ~ 0
SEL_N3_C
Text HLabel 10250 4300 2    60   Output ~ 0
SEL_N3_D
Entry Wire Line
	9650 4100 9750 4200
Entry Wire Line
	9650 4200 9750 4300
Wire Wire Line
	9750 4000 10250 4000
Wire Wire Line
	9750 4100 10250 4100
Wire Wire Line
	9750 4200 10250 4200
Wire Wire Line
	9750 4300 10250 4300
$Comp
L +5V #PWR?
U 1 1 581F3103
P 6850 2350
F 0 "#PWR?" H 6850 2200 50  0001 C CNN
F 1 "+5V" H 6850 2490 50  0000 C CNN
F 2 "" H 6850 2350 50  0000 C CNN
F 3 "" H 6850 2350 50  0000 C CNN
	1    6850 2350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 581F311F
P 3550 2300
F 0 "#PWR?" H 3550 2150 50  0001 C CNN
F 1 "+5V" H 3550 2440 50  0000 C CNN
F 2 "" H 3550 2300 50  0000 C CNN
F 3 "" H 3550 2300 50  0000 C CNN
	1    3550 2300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
