EESchema Schematic File Version 2
LIBS:tube_shield-rescue
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
LIBS:tube_shield-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "Tube Shield"
Date "2016-09-14"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8050 1800 950  2250
U 51B41911
F0 "Nixie Tubes" 50
F1 "nixie_tubes.sch" 50
F2 "NIXIE_ONE_CAT" I L 8050 2600 60 
F3 "NIXIE_TWO_CAT" I L 8050 2700 60 
F4 "NIXIE_THREE_CAT" I L 8050 2800 60 
F5 "NIXIE_FOUR_CAT" I L 8050 2900 60 
F6 "NIXIE_FIVE_CAT" I L 8050 3000 60 
F7 "NIXIE_SIX_CAT" I L 8050 3100 60 
F8 "NIXIE_SEVEN_CAT" I L 8050 3200 60 
F9 "NIXIE_EIGHT_CAT" I L 8050 3300 60 
F10 "NIXIE_NINE_CAT" I L 8050 3400 60 
F11 "NIXIE_ZERO_CAT" I L 8050 2500 60 
F12 "NIXIE_0_SEL" I L 8050 1900 60 
F13 "NIXIE_1_SEL" I L 8050 2000 60 
F14 "NIXIE_2_SEL" I L 8050 2100 60 
F15 "NIXIE_3_SEL" I L 8050 2200 60 
$EndSheet
$Sheet
S 8050 4450 950  500 
U 54DBB7B0
F0 "Colon Tubes" 60
F1 "colon_tubes.sch" 60
F2 "SEL_DOT_TOP" I L 8050 4650 60 
F3 "SEL_DOT_BOT" I L 8050 4750 60 
$EndSheet
$Sheet
S 4700 2300 2300 1350
U 51B53B8A
F0 "Nixie Control" 50
F1 "nixie_control.sch" 50
F2 "MCU_SEL_ZERO" I L 4700 2500 60 
F3 "MCU_SEL_ONE" I L 4700 2600 60 
F4 "MCU_SEL_TWO" I L 4700 2700 60 
F5 "MCU_SEL_THREE" I L 4700 2800 60 
F6 "MCU_SEL_FOUR" I L 4700 2900 60 
F7 "MCU_SEL_FIVE" I L 4700 3000 60 
F8 "MCU_SEL_SIX" I L 4700 3100 60 
F9 "MCU_SEL_SEVEN" I L 4700 3200 60 
F10 "MCU_SEL_EIGHT" I L 4700 3300 60 
F11 "MCU_SEL_NINE" I L 4700 3400 60 
F12 "NIX_SEL_ZERO" O R 7000 2500 60 
F13 "NIX_SEL_ONE" O R 7000 2600 60 
F14 "NIX_SEL_TWO" O R 7000 2700 60 
F15 "NIX_SEL_THREE" O R 7000 2800 60 
F16 "NIX_SEL_FOUR" O R 7000 2900 60 
F17 "NIX_SEL_FIVE" O R 7000 3000 60 
F18 "NIX_SEL_SIX" O R 7000 3100 60 
F19 "NIX_SEL_SEVEN" O R 7000 3200 60 
F20 "NIX_SEL_EIGHT" O R 7000 3300 60 
F21 "NIX_SEL_NINE" O R 7000 3400 60 
$EndSheet
Wire Wire Line
	700  2200 8050 2200
Wire Wire Line
	800  2100 8050 2100
Wire Wire Line
	900  2000 8050 2000
Wire Wire Line
	1000 1900 8050 1900
Wire Wire Line
	7000 3400 8050 3400
Wire Wire Line
	7000 3300 8050 3300
Wire Wire Line
	7000 3200 8050 3200
Wire Wire Line
	7000 3100 8050 3100
Wire Wire Line
	7000 3000 8050 3000
Wire Wire Line
	7000 2900 8050 2900
Wire Wire Line
	7000 2800 8050 2800
Wire Wire Line
	7000 2700 8050 2700
Wire Wire Line
	7000 2600 8050 2600
Wire Wire Line
	7000 2500 8050 2500
Wire Wire Line
	4000 3400 4700 3400
Wire Wire Line
	4000 3300 4700 3300
Wire Wire Line
	4000 3200 4700 3200
Wire Wire Line
	4000 3100 4700 3100
Wire Wire Line
	4000 3000 4700 3000
Wire Wire Line
	4000 2900 4700 2900
Wire Wire Line
	4000 2500 4700 2500
Wire Wire Line
	4000 2700 4700 2700
Wire Wire Line
	4000 2600 4700 2600
Wire Wire Line
	4000 2800 4700 2800
Wire Wire Line
	3850 3500 4550 3500
Wire Wire Line
	4550 3500 4550 4650
Wire Wire Line
	4550 4650 8050 4650
Wire Wire Line
	3850 3600 4450 3600
Wire Wire Line
	4450 3600 4450 4750
Wire Wire Line
	4450 4750 8050 4750
Wire Wire Line
	1650 3400 1650 3850
$Comp
L GND #PWR01
U 1 1 575DFA60
P 1650 3850
F 0 "#PWR01" H 1650 3850 30  0001 C CNN
F 1 "GND" H 1650 3780 30  0001 C CNN
F 2 "" H 1650 3850 60  0000 C CNN
F 3 "" H 1650 3850 60  0000 C CNN
	1    1650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2500 1900 2500
Connection ~ 1650 2500
Wire Wire Line
	1900 3400 1650 3400
Wire Wire Line
	1250 3600 1900 3600
Connection ~ 1650 3600
Wire Wire Line
	1900 3500 1650 3500
Connection ~ 1650 3500
Wire Wire Line
	1000 1900 1000 2900
Wire Wire Line
	900  2000 900  3000
Wire Wire Line
	800  2100 800  3100
Wire Wire Line
	700  2200 700  3200
Wire Wire Line
	1650 2400 1650 2500
NoConn ~ 1900 3300
Wire Wire Line
	1000 2900 1900 2900
Wire Wire Line
	900  3000 1900 3000
Wire Wire Line
	800  3100 1900 3100
Wire Wire Line
	700  3200 1900 3200
$Comp
L PWR_FLAG #FLG02
U 1 1 575E9CB3
P 1250 3550
F 0 "#FLG02" H 1250 3645 50  0001 C CNN
F 1 "PWR_FLAG" H 1250 3730 50  0000 C CNN
F 2 "" H 1250 3550 50  0000 C CNN
F 3 "" H 1250 3550 50  0000 C CNN
	1    1250 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3600 1250 3550
Text Notes 700  4200 0    60   ~ 0
Add power flag to stop DRC\nerrors due to no "Power Output"
$Comp
L CONN_01X01 P2
U 1 1 575DFF28
P 1550 5750
F 0 "P2" H 1550 5850 50  0000 C CNN
F 1 "CONN_01X01" V 1650 5750 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO7380_Pad" H 1550 5750 50  0001 C CNN
F 3 "" H 1550 5750 50  0000 C CNN
	1    1550 5750
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P3
U 1 1 575E0D8B
P 2200 5750
F 0 "P3" H 2200 5850 50  0000 C CNN
F 1 "CONN_01X01" V 2300 5750 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 2200 5750 50  0001 C CNN
F 3 "" H 2200 5750 50  0000 C CNN
	1    2200 5750
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P4
U 1 1 575E0E84
P 2750 5750
F 0 "P4" H 2750 5850 50  0000 C CNN
F 1 "CONN_01X01" V 2850 5750 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 2750 5750 50  0001 C CNN
F 3 "" H 2750 5750 50  0000 C CNN
	1    2750 5750
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 575E0F84
P 3300 5750
F 0 "P5" H 3300 5850 50  0000 C CNN
F 1 "CONN_01X01" V 3400 5750 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 3300 5750 50  0001 C CNN
F 3 "" H 3300 5750 50  0000 C CNN
	1    3300 5750
	0    -1   -1   0   
$EndComp
NoConn ~ 1550 5950
NoConn ~ 2200 5950
NoConn ~ 2750 5950
NoConn ~ 3300 5950
Text Notes 2100 6150 0    60   ~ 0
Mounting Holes
Text Label 1650 2500 0    60   ~ 0
+170V
Text Label 4150 2500 0    60   ~ 0
SEL_ZERO
Text Label 4150 2600 0    60   ~ 0
SEL_ONE
Text Label 4150 2700 0    60   ~ 0
SEL_TWO
Text Label 4150 2800 0    60   ~ 0
SEL_THREE
Text Label 4150 2900 0    60   ~ 0
SEL_FOUR
Text Label 4150 3000 0    60   ~ 0
SEL_FIVE
Text Label 4150 3100 0    60   ~ 0
SEL_SIX
Text Label 4150 3200 0    60   ~ 0
SEL_SEVEN
Text Label 4150 3300 0    60   ~ 0
SEL_EIGHT
Text Label 4150 3400 0    60   ~ 0
SEL_NINE
Text Label 3900 3500 0    60   ~ 0
SEL_DOT_TOP
Text Label 3900 3600 0    60   ~ 0
SEL_DOT_BOT
Wire Wire Line
	2400 3500 3100 3500
Wire Wire Line
	2400 3400 3100 3400
Wire Wire Line
	2400 3300 3100 3300
Wire Wire Line
	2400 3200 3100 3200
Wire Wire Line
	2400 2900 3100 2900
Wire Wire Line
	2400 2800 3100 2800
Wire Wire Line
	2400 3600 3100 3600
Wire Wire Line
	1200 2800 1900 2800
Wire Wire Line
	1200 2700 1900 2700
Wire Wire Line
	2400 2700 3100 2700
Wire Wire Line
	2400 3000 3100 3000
Wire Wire Line
	2400 3100 3100 3100
Text Label 2550 3600 0    60   ~ 0
SEL_ZERO
Text Label 1350 2700 0    60   ~ 0
SEL_ONE
Text Label 1350 2800 0    60   ~ 0
SEL_TWO
Text Label 2550 2700 0    60   ~ 0
SEL_THREE
Text Label 2550 2800 0    60   ~ 0
SEL_FOUR
Text Label 2550 2900 0    60   ~ 0
SEL_FIVE
Text Label 2550 3200 0    60   ~ 0
SEL_SIX
Text Label 2550 3300 0    60   ~ 0
SEL_SEVEN
Text Label 2550 3400 0    60   ~ 0
SEL_EIGHT
Text Label 2550 3500 0    60   ~ 0
SEL_NINE
Text Label 2450 3100 0    60   ~ 0
SEL_DOT_TOP
Text Label 2450 3000 0    60   ~ 0
SEL_DOT_BOT
$Comp
L PWR_FLAG #FLG03
U 1 1 5764DCD6
P 1250 2450
F 0 "#FLG03" H 1250 2545 50  0001 C CNN
F 1 "PWR_FLAG" H 1250 2630 50  0000 C CNN
F 2 "" H 1250 2450 50  0000 C CNN
F 3 "" H 1250 2450 50  0000 C CNN
	1    1250 2450
	1    0    0    -1  
$EndComp
$Comp
L +170V #PWR04
U 1 1 57CEBB6B
P 1650 2400
F 0 "#PWR04" H 1650 2250 60  0001 C CNN
F 1 "+170V" H 1650 2540 60  0000 C CNN
F 2 "" H 1650 2400 60  0000 C CNN
F 3 "" H 1650 2400 60  0000 C CNN
	1    1650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2450 1250 2500
Wire Wire Line
	1650 2400 1900 2400
Wire Wire Line
	1900 2400 1900 2300
Wire Wire Line
	1900 2300 2450 2300
Wire Wire Line
	2450 2300 2450 2500
Wire Wire Line
	2450 2500 2400 2500
$Comp
L CONN_02X12_isolate_hv P1
U 1 1 57E0EE1D
P 2150 3050
F 0 "P1" H 2150 3700 50  0000 C CNN
F 1 "CONN_02X12_isolate_hv" V 2150 3050 50  0000 C CNN
F 2 "Nixie:Pin_Header_Straight_2x12_isolate_hv" H 2150 1850 50  0000 C CNN
F 3 "" H 2150 1850 50  0000 C CNN
	1    2150 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC