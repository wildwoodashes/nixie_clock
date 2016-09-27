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
Sheet 8 9
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
L C2A N1
U 1 1 54DBBE6C
P 5550 2800
F 0 "N1" H 5575 2550 60  0000 C CNN
F 1 "C2A" H 5550 3025 60  0000 C CNN
F 2 "Nixie:neon_ind" H 6960 3600 60  0001 C CNN
F 3 "" H 6960 3600 60  0000 C CNN
	1    5550 2800
	1    0    0    -1  
$EndComp
$Comp
L C2A N2
U 1 1 54DBBEBD
P 5550 3650
F 0 "N2" H 5575 3400 60  0000 C CNN
F 1 "C2A" H 5550 3875 60  0000 C CNN
F 2 "Nixie:neon_ind" H 6960 4450 60  0001 C CNN
F 3 "" H 6960 4450 60  0000 C CNN
	1    5550 3650
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R32
U 1 1 54DBCE6B
P 5400 4200
F 0 "R32" V 5480 4200 50  0000 C CNN
F 1 "4.7k" V 5407 4201 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5330 4200 30  0001 C CNN
F 3 "" H 5400 4200 30  0000 C CNN
	1    5400 4200
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R30
U 1 1 54DBD0E5
P 4550 2800
F 0 "R30" V 4630 2800 50  0000 C CNN
F 1 "24k" V 4557 2801 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4480 2800 30  0001 C CNN
F 3 "" H 4550 2800 30  0000 C CNN
	1    4550 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 2800 4800 2800
Wire Wire Line
	4800 3650 5050 3650
Wire Wire Line
	6050 3650 6450 3650
Wire Wire Line
	6450 3650 6450 4000
Wire Wire Line
	6050 2800 7600 2800
Wire Wire Line
	7600 2800 7600 4000
Wire Wire Line
	3850 3650 4300 3650
Wire Wire Line
	3850 2600 3850 3650
Connection ~ 3850 2800
Wire Wire Line
	5650 4200 6150 4200
Wire Wire Line
	5650 4800 6950 4800
Wire Wire Line
	6950 4800 6950 4200
Wire Wire Line
	6950 4200 7300 4200
Wire Wire Line
	6450 4400 6450 4550
Wire Wire Line
	7600 4400 7600 4550
$Comp
L GND #PWR061
U 1 1 54DBD52A
P 6450 4550
F 0 "#PWR061" H 6450 4300 60  0001 C CNN
F 1 "GND" H 6450 4400 60  0000 C CNN
F 2 "" H 6450 4550 60  0000 C CNN
F 3 "" H 6450 4550 60  0000 C CNN
	1    6450 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR062
U 1 1 54DBD53E
P 7600 4550
F 0 "#PWR062" H 7600 4300 60  0001 C CNN
F 1 "GND" H 7600 4400 60  0000 C CNN
F 2 "" H 7600 4550 60  0000 C CNN
F 3 "" H 7600 4550 60  0000 C CNN
	1    7600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4200 5150 4200
Wire Wire Line
	5150 4800 3700 4800
Text HLabel 3700 4200 0    60   Input ~ 0
SEL_DOT_TOP
Text HLabel 3700 4800 0    60   Input ~ 0
SEL_DOT_BOT
Wire Wire Line
	3850 2800 4300 2800
$Comp
L +180V #PWR063
U 1 1 54D87429
P 3850 2600
F 0 "#PWR063" H 3850 2450 60  0001 C CNN
F 1 "+180V" H 3850 2740 60  0000 C CNN
F 2 "" H 3850 2600 60  0000 C CNN
F 3 "" H 3850 2600 60  0000 C CNN
	1    3850 2600
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R31
U 1 1 575CBBBF
P 4550 3650
F 0 "R31" V 4630 3650 50  0000 C CNN
F 1 "24k" V 4557 3651 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4480 3650 30  0001 C CNN
F 3 "" H 4550 3650 30  0000 C CNN
	1    4550 3650
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R33
U 1 1 575CC742
P 5400 4800
F 0 "R33" V 5480 4800 50  0000 C CNN
F 1 "4.7k" V 5407 4801 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5330 4800 30  0001 C CNN
F 3 "" H 5400 4800 30  0000 C CNN
	1    5400 4800
	0    1    1    0   
$EndComp
$Comp
L MPSA42 Q10
U 1 1 575FD4F2
P 6350 4200
F 0 "Q10" H 6550 4275 50  0000 L CNN
F 1 "MPSA42" H 6550 4200 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 6550 4125 50  0001 L CIN
F 3 "" H 6350 4200 50  0000 L CNN
	1    6350 4200
	1    0    0    -1  
$EndComp
$Comp
L MPSA42 Q11
U 1 1 575FD574
P 7500 4200
F 0 "Q11" H 7700 4275 50  0000 L CNN
F 1 "MPSA42" H 7700 4200 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 7700 4125 50  0001 L CIN
F 3 "" H 7500 4200 50  0000 L CNN
	1    7500 4200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
