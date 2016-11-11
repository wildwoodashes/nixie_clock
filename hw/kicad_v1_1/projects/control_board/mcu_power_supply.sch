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
Sheet 3 6
Title "Control Board"
Date "2016-09-14"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1500 1250 0    60   Input ~ 0
+12V
Text HLabel 1500 1350 0    60   Output ~ 0
+5V
Text HLabel 1500 1450 0    60   Input ~ 0
GND
$Comp
L GND #PWR023
U 1 1 51B54D44
P 1750 1550
F 0 "#PWR023" H 1750 1550 30  0001 C CNN
F 1 "GND" H 1750 1480 30  0001 C CNN
F 2 "" H 1750 1550 60  0000 C CNN
F 3 "" H 1750 1550 60  0000 C CNN
	1    1750 1550
	1    0    0    -1  
$EndComp
Text Notes 950  700  0    60   ~ 0
Inputs/Outputs
$Comp
L C C22
U 1 1 5742BA77
P 6900 3700
F 0 "C22" H 6925 3800 50  0000 L CNN
F 1 "10uF" H 6925 3600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6938 3550 50  0001 C CNN
F 3 "" H 6900 3700 50  0000 C CNN
	1    6900 3700
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 5742D5BF
P 4900 3650
F 0 "C24" H 4925 3750 50  0000 L CNN
F 1 "0.1uF" H 4925 3550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4938 3500 50  0001 C CNN
F 3 "" H 4900 3650 50  0000 C CNN
	1    4900 3650
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 575CB8D3
P 4450 3650
F 0 "C23" H 4475 3750 50  0000 L CNN
F 1 "10uF" H 4475 3550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4488 3500 50  0001 C CNN
F 3 "" H 4450 3650 50  0000 C CNN
	1    4450 3650
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR024
U 1 1 575E2E76
P 4450 2900
F 0 "#PWR024" H 4450 2750 50  0001 C CNN
F 1 "+12V" H 4450 3040 50  0000 C CNN
F 2 "" H 4450 2900 50  0000 C CNN
F 3 "" H 4450 2900 50  0000 C CNN
	1    4450 2900
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR025
U 1 1 575E327A
P 1750 1100
F 0 "#PWR025" H 1750 950 50  0001 C CNN
F 1 "+12V" H 1750 1240 50  0000 C CNN
F 2 "" H 1750 1100 50  0000 C CNN
F 3 "" H 1750 1100 50  0000 C CNN
	1    1750 1100
	1    0    0    -1  
$EndComp
$Comp
L R-78E5.0-0.5 U5
U 1 1 581F12A5
P 5700 2850
F 0 "U5" H 5700 3400 60  0000 C CNN
F 1 "R-78E5.0-0.5" H 5700 3300 60  0000 C CNN
F 2 "Nixie:R-78E5.0-0.5" H 5700 3500 60  0000 C CNN
F 3 "" H 5700 2850 60  0000 C CNN
	1    5700 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 581F154D
P 4450 4100
F 0 "#PWR026" H 4450 3850 50  0001 C CNN
F 1 "GND" H 4450 3950 50  0000 C CNN
F 2 "" H 4450 4100 50  0000 C CNN
F 3 "" H 4450 4100 50  0000 C CNN
	1    4450 4100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR027
U 1 1 581F157B
P 1950 1100
F 0 "#PWR027" H 1950 950 50  0001 C CNN
F 1 "+5V" H 1950 1240 50  0000 C CNN
F 2 "" H 1950 1100 50  0000 C CNN
F 3 "" H 1950 1100 50  0000 C CNN
	1    1950 1100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR028
U 1 1 581F159D
P 6900 3100
F 0 "#PWR028" H 6900 2950 50  0001 C CNN
F 1 "+5V" H 6900 3240 50  0000 C CNN
F 2 "" H 6900 3100 50  0000 C CNN
F 3 "" H 6900 3100 50  0000 C CNN
	1    6900 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 581F16C7
P 6900 4000
F 0 "#PWR029" H 6900 3750 50  0001 C CNN
F 1 "GND" H 6900 3850 50  0000 C CNN
F 2 "" H 6900 4000 50  0000 C CNN
F 3 "" H 6900 4000 50  0000 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 581F18FF
P 5700 3600
F 0 "#PWR030" H 5700 3350 50  0001 C CNN
F 1 "GND" H 5700 3450 50  0000 C CNN
F 2 "" H 5700 3600 50  0000 C CNN
F 3 "" H 5700 3600 50  0000 C CNN
	1    5700 3600
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R19
U 1 1 581F541B
P 7950 3900
F 0 "R19" V 8000 3700 40  0000 C CNN
F 1 "330" V 7957 3901 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7880 3900 30  0001 C CNN
F 3 "~" H 7950 3900 30  0000 C CNN
	1    7950 3900
	1    0    0    -1  
$EndComp
$Comp
L LED-RESCUE-nixie_clock D7
U 1 1 581F5422
P 7950 4550
F 0 "D7" H 7950 4650 50  0000 C CNN
F 1 "LTST-C190GKT" H 8150 4750 50  0000 C CNN
F 2 "LEDs:LED_0603" H 7950 4550 60  0001 C CNN
F 3 "~" H 7950 4550 60  0000 C CNN
	1    7950 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 1250 1750 1250
Wire Wire Line
	1750 1250 1750 1100
Wire Wire Line
	1500 1350 1950 1350
Wire Wire Line
	1950 1350 1950 1100
Wire Wire Line
	1500 1450 1750 1450
Wire Wire Line
	1750 1450 1750 1550
Wire Notes Line
	950  750  950  1950
Wire Notes Line
	950  1950 2450 1950
Wire Notes Line
	2450 1950 2450 750 
Wire Notes Line
	2450 750  950  750 
Wire Wire Line
	5450 3350 5450 3450
Wire Wire Line
	5450 3450 4450 3450
Wire Wire Line
	4450 2900 4450 3500
Connection ~ 4450 3450
Wire Wire Line
	4900 3500 4900 3450
Connection ~ 4900 3450
Wire Wire Line
	4450 3800 4450 4100
Wire Wire Line
	4450 4000 4900 4000
Wire Wire Line
	4900 4000 4900 3800
Connection ~ 4450 4000
Wire Wire Line
	5950 3350 5950 3500
Wire Wire Line
	5950 3500 7950 3500
Wire Wire Line
	6900 3100 6900 3550
Connection ~ 6900 3500
Wire Wire Line
	6900 3850 6900 4000
Wire Wire Line
	5700 3350 5700 3600
Wire Wire Line
	7950 3500 7950 3650
Wire Wire Line
	7950 4150 7950 4350
Wire Wire Line
	7950 4750 7950 4900
$Comp
L GND #PWR031
U 1 1 581F55EB
P 7950 4900
F 0 "#PWR031" H 7950 4650 50  0001 C CNN
F 1 "GND" H 7950 4750 50  0000 C CNN
F 2 "" H 7950 4900 50  0000 C CNN
F 3 "" H 7950 4900 50  0000 C CNN
	1    7950 4900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
