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
Sheet 5 9
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
L C-RESCUE-nixie_clock C15
U 1 1 54D9F67D
P 3600 3850
F 0 "C15" H 3600 3950 40  0000 L CNN
F 1 "11pF" H 3606 3765 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3638 3700 30  0001 C CNN
F 3 "~" H 3600 3850 60  0000 C CNN
	1    3600 3850
	0    -1   -1   0   
$EndComp
$Comp
L Battery BT1
U 1 1 54D9F690
P 4400 5350
AR Path="/54D9F690" Ref="BT1"  Part="1" 
AR Path="/51B40844/54D9E22D/54D9F690" Ref="BT1"  Part="1" 
F 0 "BT1" H 4250 5450 50  0000 C CNN
F 1 "BATTERY" H 4200 5200 50  0000 C CNN
F 2 "Nixie:3026_bat_clip" H 4400 5350 60  0001 C CNN
F 3 "~" H 4400 5350 60  0000 C CNN
	1    4400 5350
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-nixie_clock C16
U 1 1 54D9F69D
P 4750 4850
F 0 "C16" H 4750 4950 40  0000 L CNN
F 1 "100pF" H 4756 4765 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4788 4700 30  0001 C CNN
F 3 "~" H 4750 4850 60  0000 C CNN
	1    4750 4850
	-1   0    0    1   
$EndComp
$Comp
L R-RESCUE-nixie_clock R26
U 1 1 54D9F6AB
P 4400 4300
F 0 "R26" V 4480 4300 40  0000 C CNN
F 1 "1k" V 4407 4301 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4330 4300 30  0001 C CNN
F 3 "~" H 4400 4300 30  0000 C CNN
	1    4400 4300
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-nixie_clock C17
U 1 1 54D9F6B8
P 6850 3050
F 0 "C17" H 6850 3150 40  0000 L CNN
F 1 "0.1uF" H 6856 2965 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6888 2900 30  0001 C CNN
F 3 "~" H 6850 3050 60  0000 C CNN
	1    6850 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 3000 3900 3300
Wire Wire Line
	3900 3000 4300 3000
Wire Wire Line
	4300 3000 4300 3400
Wire Wire Line
	4300 3400 5050 3400
Wire Wire Line
	3900 3600 3900 3900
Wire Wire Line
	3900 3900 4300 3900
Wire Wire Line
	4300 3600 5050 3600
Wire Wire Line
	4300 3900 4300 3600
Wire Wire Line
	3900 3850 3800 3850
Connection ~ 3900 3850
Wire Wire Line
	3900 3050 3750 3050
Connection ~ 3900 3050
Wire Wire Line
	3350 3050 3250 3050
Wire Wire Line
	3250 3050 3250 3950
Wire Wire Line
	3250 3850 3400 3850
Connection ~ 3250 3850
Wire Wire Line
	5050 3800 4400 3800
Wire Wire Line
	4400 5500 4400 5750
Wire Wire Line
	4400 3800 4400 4050
Wire Wire Line
	4400 4950 4400 5200
Wire Wire Line
	4400 4550 4400 4650
Wire Wire Line
	4400 4000 4750 4000
Connection ~ 4400 4000
Wire Wire Line
	4400 5700 4750 5700
Connection ~ 4400 5700
Wire Wire Line
	4750 4000 4750 4650
Wire Wire Line
	4750 5700 4750 5050
Wire Wire Line
	4950 4000 5050 4000
Wire Wire Line
	6600 3400 6400 3400
Wire Wire Line
	6600 2700 6600 3400
Wire Wire Line
	6850 2850 6850 2750
Wire Wire Line
	6850 2750 6600 2750
Connection ~ 6600 2750
Wire Wire Line
	6850 3250 6850 3300
Wire Wire Line
	6400 4000 8200 4000
Wire Wire Line
	6400 3800 8200 3800
Wire Wire Line
	6400 3600 8200 3600
$Comp
L C-RESCUE-nixie_clock C14
U 1 1 54D9F676
P 3550 3050
F 0 "C14" H 3550 3150 40  0000 L CNN
F 1 "11pF" H 3556 2965 40  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3588 2900 30  0001 C CNN
F 3 "~" H 3550 3050 60  0000 C CNN
	1    3550 3050
	0    -1   -1   0   
$EndComp
Text HLabel 8200 3800 2    60   Input ~ 0
RTC_SCL
Text HLabel 8200 4000 2    60   BiDi ~ 0
RTC_SDA
Text HLabel 8200 3600 2    60   Output ~ 0
RTC_MFP
$Comp
L Crystal Y1
U 1 1 575C4007
P 3900 3450
F 0 "Y1" H 3900 3600 50  0000 C CNN
F 1 "32.768kHz" H 3900 3300 50  0000 C CNN
F 2 "Nixie:VT200F-6PF20PPM" H 3900 3450 50  0001 C CNN
F 3 "" H 3900 3450 50  0000 C CNN
	1    3900 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 4200 4950 4000
$Comp
L GND #PWR037
U 1 1 575E4DDB
P 3250 3950
F 0 "#PWR037" H 3250 3700 50  0001 C CNN
F 1 "GND" H 3250 3800 50  0000 C CNN
F 2 "" H 3250 3950 50  0000 C CNN
F 3 "" H 3250 3950 50  0000 C CNN
	1    3250 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR038
U 1 1 575E4E1F
P 4400 5750
F 0 "#PWR038" H 4400 5500 50  0001 C CNN
F 1 "GND" H 4400 5600 50  0000 C CNN
F 2 "" H 4400 5750 50  0000 C CNN
F 3 "" H 4400 5750 50  0000 C CNN
	1    4400 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR039
U 1 1 575E4E45
P 4950 4200
F 0 "#PWR039" H 4950 3950 50  0001 C CNN
F 1 "GND" H 4950 4050 50  0000 C CNN
F 2 "" H 4950 4200 50  0000 C CNN
F 3 "" H 4950 4200 50  0000 C CNN
	1    4950 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 575E4E6B
P 6850 3300
F 0 "#PWR040" H 6850 3050 50  0001 C CNN
F 1 "GND" H 6850 3150 50  0000 C CNN
F 2 "" H 6850 3300 50  0000 C CNN
F 3 "" H 6850 3300 50  0000 C CNN
	1    6850 3300
	1    0    0    -1  
$EndComp
$Comp
L MCP7940N U2
U 1 1 575FE778
P 5750 3500
F 0 "U2" H 6050 3800 60  0000 C CNN
F 1 "MCP7940N" H 6050 3900 60  0000 C CNN
F 2 "Housings_SSOP:TSSOP-8_4.4x3mm_Pitch0.65mm" H 5750 3500 60  0001 C CNN
F 3 "" H 5750 3500 60  0000 C CNN
	1    5750 3500
	1    0    0    -1  
$EndComp
$Comp
L D D1
U 1 1 575E1F0E
P 4400 4800
F 0 "D1" H 4400 4900 50  0000 C CNN
F 1 "D" H 4400 4700 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SC-70" H 4400 4800 50  0001 C CNN
F 3 "" H 4400 4800 50  0000 C CNN
	1    4400 4800
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR041
U 1 1 575E35A4
P 6600 2700
F 0 "#PWR041" H 6600 2550 50  0001 C CNN
F 1 "+3.3V" H 6600 2840 50  0000 C CNN
F 2 "" H 6600 2700 50  0000 C CNN
F 3 "" H 6600 2700 50  0000 C CNN
	1    6600 2700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
