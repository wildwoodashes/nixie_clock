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
Sheet 3 9
Title ""
Date "10 jun 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1500 2950 0    60   Input ~ 0
NIXIE_ONE_CAT
Text HLabel 1500 3050 0    60   Input ~ 0
NIXIE_TWO_CAT
Text HLabel 1500 3150 0    60   Input ~ 0
NIXIE_THREE_CAT
Text HLabel 1500 3250 0    60   Input ~ 0
NIXIE_FOUR_CAT
Text HLabel 1500 3350 0    60   Input ~ 0
NIXIE_FIVE_CAT
Text HLabel 1500 3450 0    60   Input ~ 0
NIXIE_SIX_CAT
Text HLabel 1500 3550 0    60   Input ~ 0
NIXIE_SEVEN_CAT
Text HLabel 1500 3650 0    60   Input ~ 0
NIXIE_EIGHT_CAT
Text HLabel 1500 3750 0    60   Input ~ 0
NIXIE_NINE_CAT
Text HLabel 1500 3850 0    60   Input ~ 0
NIXIE_ZERO_CAT
$Comp
L +180V #PWR016
U 1 1 51B4E8DC
P 7900 1050
F 0 "#PWR016" H 7900 1180 20  0001 C CNN
F 1 "+180V" H 7900 1150 30  0000 C CNN
F 2 "~" H 7900 1050 60  0000 C CNN
F 3 "~" H 7900 1050 60  0000 C CNN
	1    7900 1050
	1    0    0    -1  
$EndComp
Text HLabel 2600 2100 0    60   Input ~ 0
NIXIE_0_SEL
Text HLabel 6900 2100 0    60   Input ~ 0
NIXIE_1_SEL
Text HLabel 2600 5200 0    60   Input ~ 0
NIXIE_2_SEL
Text HLabel 6850 5200 0    60   Input ~ 0
NIXIE_3_SEL
$Comp
L R-RESCUE-nixie_clock R6
U 1 1 51B4F38A
P 2950 2100
F 0 "R6" V 3050 2100 40  0000 C CNN
F 1 "4.7k" V 2957 2101 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 2100 30  0001 C CNN
F 3 "~" H 2950 2100 30  0000 C CNN
	1    2950 2100
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R15
U 1 1 51B4FD3E
P 7900 1550
F 0 "R15" V 7980 1550 40  0000 C CNN
F 1 "100k" V 7907 1551 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7830 1550 30  0001 C CNN
F 3 "~" H 7900 1550 30  0000 C CNN
	1    7900 1550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR017
U 1 1 51B4FF13
P 7900 2450
F 0 "#PWR017" H 7900 2450 30  0001 C CNN
F 1 "GND" H 7900 2380 30  0001 C CNN
F 2 "" H 7900 2450 60  0000 C CNN
F 3 "" H 7900 2450 60  0000 C CNN
	1    7900 2450
	1    0    0    -1  
$EndComp
$Comp
L +180V #PWR018
U 1 1 51B4FFB8
P 7850 4150
F 0 "#PWR018" H 7850 4280 20  0001 C CNN
F 1 "+180V" H 7850 4250 30  0000 C CNN
F 2 "~" H 7850 4150 60  0000 C CNN
F 3 "~" H 7850 4150 60  0000 C CNN
	1    7850 4150
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R14
U 1 1 51B4FFC6
P 7850 4650
F 0 "R14" V 7930 4650 40  0000 C CNN
F 1 "100k" V 7857 4651 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7780 4650 30  0001 C CNN
F 3 "~" H 7850 4650 30  0000 C CNN
	1    7850 4650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR019
U 1 1 51B4FFCF
P 7850 5550
F 0 "#PWR019" H 7850 5550 30  0001 C CNN
F 1 "GND" H 7850 5480 30  0001 C CNN
F 2 "" H 7850 5550 60  0000 C CNN
F 3 "" H 7850 5550 60  0000 C CNN
	1    7850 5550
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R10
U 1 1 51B50197
P 4700 1200
F 0 "R10" V 4780 1200 40  0000 C CNN
F 1 "12k" V 4707 1201 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4630 1200 30  0001 C CNN
F 3 "~" H 4700 1200 30  0000 C CNN
	1    4700 1200
	0    -1   -1   0   
$EndComp
$Comp
L +180V #PWR020
U 1 1 51B501B1
P 3600 1050
F 0 "#PWR020" H 3600 1180 20  0001 C CNN
F 1 "+180V" H 3600 1150 30  0000 C CNN
F 2 "~" H 3600 1050 60  0000 C CNN
F 3 "~" H 3600 1050 60  0000 C CNN
	1    3600 1050
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R8
U 1 1 51B501BF
P 3600 1550
F 0 "R8" V 3680 1550 40  0000 C CNN
F 1 "100k" V 3607 1551 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3530 1550 30  0001 C CNN
F 3 "~" H 3600 1550 30  0000 C CNN
	1    3600 1550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR021
U 1 1 51B501C8
P 3600 2450
F 0 "#PWR021" H 3600 2450 30  0001 C CNN
F 1 "GND" H 3600 2380 30  0001 C CNN
F 2 "" H 3600 2450 60  0000 C CNN
F 3 "" H 3600 2450 60  0000 C CNN
	1    3600 2450
	1    0    0    -1  
$EndComp
$Comp
L +180V #PWR022
U 1 1 51B501E0
P 3600 4150
F 0 "#PWR022" H 3600 4280 20  0001 C CNN
F 1 "+180V" H 3600 4250 30  0000 C CNN
F 2 "~" H 3600 4150 60  0000 C CNN
F 3 "~" H 3600 4150 60  0000 C CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-nixie_clock R9
U 1 1 51B501EE
P 3600 4650
F 0 "R9" V 3680 4650 40  0000 C CNN
F 1 "100k" V 3607 4651 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3530 4650 30  0001 C CNN
F 3 "~" H 3600 4650 30  0000 C CNN
	1    3600 4650
	-1   0    0    1   
$EndComp
$Comp
L IN-8 NX1
U 1 1 51B42285
P 5100 1850
F 0 "NX1" H 5600 1900 60  0000 C CNN
F 1 "IN-8" H 5600 1800 60  0000 C CNN
F 2 "Nixie:pl27-1pd" H 5600 1900 60  0001 C CNN
F 3 "" H 5600 1900 60  0000 C CNN
	1    5100 1850
	1    0    0    -1  
$EndComp
Entry Wire Line
	4400 3150 4500 3250
Entry Wire Line
	4550 3150 4650 3250
Entry Wire Line
	4700 3150 4800 3250
Entry Wire Line
	4850 3150 4950 3250
Entry Wire Line
	5000 3150 5100 3250
Entry Wire Line
	5200 3150 5300 3250
Entry Wire Line
	5350 3150 5450 3250
Entry Wire Line
	5500 3150 5600 3250
Entry Wire Line
	5650 3150 5750 3250
Entry Wire Line
	5800 3150 5900 3250
Text Label 4400 3150 0    60   ~ 0
1
Text Label 4550 3150 0    60   ~ 0
2
Text Label 4700 3150 0    60   ~ 0
3
Text Label 4850 3150 0    60   ~ 0
4
Text Label 5000 3150 0    60   ~ 0
5
Text Label 5200 3150 0    60   ~ 0
6
Text Label 5350 3150 0    60   ~ 0
7
Text Label 5500 3150 0    60   ~ 0
8
Text Label 5650 3150 0    60   ~ 0
9
Text Label 5800 3150 0    60   ~ 0
0
Entry Wire Line
	8650 3150 8750 3250
Entry Wire Line
	8800 3150 8900 3250
Entry Wire Line
	8950 3150 9050 3250
Entry Wire Line
	9100 3150 9200 3250
Entry Wire Line
	9250 3150 9350 3250
Entry Wire Line
	9450 3150 9550 3250
Entry Wire Line
	9600 3150 9700 3250
Entry Wire Line
	9750 3150 9850 3250
Entry Wire Line
	9900 3150 10000 3250
Entry Wire Line
	10050 3150 10150 3250
Text Label 8650 3150 0    60   ~ 0
1
Text Label 8800 3150 0    60   ~ 0
2
Text Label 8950 3150 0    60   ~ 0
3
Text Label 9100 3150 0    60   ~ 0
4
Text Label 9250 3150 0    60   ~ 0
5
Text Label 9450 3150 0    60   ~ 0
6
Text Label 9600 3150 0    60   ~ 0
7
Text Label 9750 3150 0    60   ~ 0
8
Text Label 9900 3150 0    60   ~ 0
9
Text Label 10050 3150 0    60   ~ 0
0
Entry Wire Line
	4400 6300 4500 6400
Entry Wire Line
	4550 6300 4650 6400
Entry Wire Line
	4700 6300 4800 6400
Entry Wire Line
	4850 6300 4950 6400
Entry Wire Line
	5000 6300 5100 6400
Entry Wire Line
	5200 6300 5300 6400
Entry Wire Line
	5350 6300 5450 6400
Entry Wire Line
	5500 6300 5600 6400
Entry Wire Line
	5650 6300 5750 6400
Entry Wire Line
	5800 6300 5900 6400
Text Label 4400 6300 0    60   ~ 0
1
Text Label 4550 6300 0    60   ~ 0
2
Text Label 4700 6300 0    60   ~ 0
3
Text Label 4850 6300 0    60   ~ 0
4
Text Label 5000 6300 0    60   ~ 0
5
Text Label 5200 6300 0    60   ~ 0
6
Text Label 5350 6300 0    60   ~ 0
7
Text Label 5500 6300 0    60   ~ 0
8
Text Label 5650 6300 0    60   ~ 0
9
Text Label 5800 6300 0    60   ~ 0
0
Entry Wire Line
	8650 6300 8750 6400
Entry Wire Line
	8800 6300 8900 6400
Entry Wire Line
	8950 6300 9050 6400
Entry Wire Line
	9100 6300 9200 6400
Entry Wire Line
	9250 6300 9350 6400
Entry Wire Line
	9450 6300 9550 6400
Entry Wire Line
	9600 6300 9700 6400
Entry Wire Line
	9750 6300 9850 6400
Entry Wire Line
	9900 6300 10000 6400
Entry Wire Line
	10050 6300 10150 6400
Text Label 8650 6300 0    60   ~ 0
1
Text Label 8800 6300 0    60   ~ 0
2
Text Label 8950 6300 0    60   ~ 0
3
Text Label 9100 6300 0    60   ~ 0
4
Text Label 9250 6300 0    60   ~ 0
5
Text Label 9450 6300 0    60   ~ 0
6
Text Label 9600 6300 0    60   ~ 0
7
Text Label 9750 6300 0    60   ~ 0
8
Text Label 9900 6300 0    60   ~ 0
9
Text Label 10050 6300 0    60   ~ 0
0
Entry Wire Line
	1800 2950 1900 3050
Entry Wire Line
	1800 3050 1900 3150
Entry Wire Line
	1800 3150 1900 3250
Entry Wire Line
	1800 3250 1900 3350
Entry Wire Line
	1800 3350 1900 3450
Entry Wire Line
	1800 3450 1900 3550
Entry Wire Line
	1800 3550 1900 3650
Entry Wire Line
	1800 3650 1900 3750
Entry Wire Line
	1800 3750 1900 3850
Entry Wire Line
	1800 3850 1900 3950
Text Label 1750 2950 0    60   ~ 0
1
Text Label 1750 3050 0    60   ~ 0
2
Text Label 1750 3150 0    60   ~ 0
3
Text Label 1750 3250 0    60   ~ 0
4
Text Label 1750 3350 0    60   ~ 0
5
Text Label 1750 3450 0    60   ~ 0
6
Text Label 1750 3550 0    60   ~ 0
7
Text Label 1750 3650 0    60   ~ 0
8
Text Label 1750 3750 0    60   ~ 0
9
Text Label 1750 3850 0    60   ~ 0
0
$Comp
L R-RESCUE-nixie_clock R13
U 1 1 575BE5DC
P 7250 2100
F 0 "R13" V 7350 2100 40  0000 C CNN
F 1 "4.7k" V 7257 2101 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7180 2100 30  0001 C CNN
F 3 "~" H 7250 2100 30  0000 C CNN
	1    7250 2100
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R7
U 1 1 575BE6A4
P 2950 5200
F 0 "R7" V 3050 5200 40  0000 C CNN
F 1 "4.7k" V 2957 5201 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 5200 30  0001 C CNN
F 3 "~" H 2950 5200 30  0000 C CNN
	1    2950 5200
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R12
U 1 1 575BE793
P 7200 5200
F 0 "R12" V 7300 5200 40  0000 C CNN
F 1 "4.7k" V 7207 5201 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7130 5200 30  0001 C CNN
F 3 "~" H 7200 5200 30  0000 C CNN
	1    7200 5200
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R17
U 1 1 575BE9A8
P 9000 1200
F 0 "R17" V 9080 1200 40  0000 C CNN
F 1 "12k" V 9007 1201 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8930 1200 30  0001 C CNN
F 3 "~" H 9000 1200 30  0000 C CNN
	1    9000 1200
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R11
U 1 1 575BEA94
P 4700 4300
F 0 "R11" V 4780 4300 40  0000 C CNN
F 1 "12k" V 4707 4301 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4630 4300 30  0001 C CNN
F 3 "~" H 4700 4300 30  0000 C CNN
	1    4700 4300
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-nixie_clock R16
U 1 1 575BEBC1
P 8950 4300
F 0 "R16" V 9030 4300 40  0000 C CNN
F 1 "12k" V 8957 4301 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8880 4300 30  0001 C CNN
F 3 "~" H 8950 4300 30  0000 C CNN
	1    8950 4300
	0    -1   -1   0   
$EndComp
$Comp
L MPSA42 Q2
U 1 1 575CBDA8
P 3500 2100
F 0 "Q2" H 3700 2175 50  0000 L CNN
F 1 "MPSA42" H 3700 2100 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3700 2025 50  0001 L CIN
F 3 "" H 3500 2100 50  0000 L CNN
	1    3500 2100
	1    0    0    -1  
$EndComp
$Comp
L MPSA42 Q7
U 1 1 575CBF05
P 7800 2100
F 0 "Q7" H 8000 2175 50  0000 L CNN
F 1 "MPSA42" H 8000 2100 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8000 2025 50  0001 L CIN
F 3 "" H 7800 2100 50  0000 L CNN
	1    7800 2100
	1    0    0    -1  
$EndComp
$Comp
L MPSA42 Q3
U 1 1 575CBF99
P 3500 5200
F 0 "Q3" H 3700 5275 50  0000 L CNN
F 1 "MPSA42" H 3700 5200 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 3700 5125 50  0001 L CIN
F 3 "" H 3500 5200 50  0000 L CNN
	1    3500 5200
	1    0    0    -1  
$EndComp
$Comp
L MPSA42 Q6
U 1 1 575CC026
P 7750 5200
F 0 "Q6" H 7950 5275 50  0000 L CNN
F 1 "MPSA42" H 7950 5200 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 7950 5125 50  0001 L CIN
F 3 "" H 7750 5200 50  0000 L CNN
	1    7750 5200
	1    0    0    -1  
$EndComp
$Comp
L MPSA92 Q4
U 1 1 575CC1FB
P 4150 1300
F 0 "Q4" H 4350 1375 50  0000 L CNN
F 1 "MPSA92" H 4350 1300 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 4350 1225 50  0001 L CIN
F 3 "" H 4150 1300 50  0000 L CNN
	1    4150 1300
	0    1    -1   0   
$EndComp
$Comp
L MPSA92 Q9
U 1 1 575CC401
P 8450 1300
F 0 "Q9" H 8650 1375 50  0000 L CNN
F 1 "MPSA92" H 8650 1300 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8650 1225 50  0001 L CIN
F 3 "" H 8450 1300 50  0000 L CNN
	1    8450 1300
	0    1    -1   0   
$EndComp
$Comp
L MPSA92 Q5
U 1 1 575CC499
P 4150 4400
F 0 "Q5" H 4350 4475 50  0000 L CNN
F 1 "MPSA92" H 4350 4400 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 4350 4325 50  0001 L CIN
F 3 "" H 4150 4400 50  0000 L CNN
	1    4150 4400
	0    1    -1   0   
$EndComp
$Comp
L MPSA92 Q8
U 1 1 575CC56E
P 8400 4400
F 0 "Q8" H 8600 4475 50  0000 L CNN
F 1 "MPSA92" H 8600 4400 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 8600 4325 50  0001 L CIN
F 3 "" H 8400 4400 50  0000 L CNN
	1    8400 4400
	0    1    -1   0   
$EndComp
$Comp
L IN-8 NX3
U 1 1 575CE4DA
P 9350 1850
F 0 "NX3" H 9850 1900 60  0000 C CNN
F 1 "IN-8" H 9850 1800 60  0000 C CNN
F 2 "Nixie:pl27-1pd" H 9850 1900 60  0001 C CNN
F 3 "" H 9850 1900 60  0000 C CNN
	1    9350 1850
	1    0    0    -1  
$EndComp
$Comp
L IN-8 NX2
U 1 1 575CE558
P 5100 5000
F 0 "NX2" H 5600 5050 60  0000 C CNN
F 1 "IN-8" H 5600 4950 60  0000 C CNN
F 2 "Nixie:pl27-1pd" H 5600 5050 60  0001 C CNN
F 3 "" H 5600 5050 60  0000 C CNN
	1    5100 5000
	1    0    0    -1  
$EndComp
$Comp
L IN-8 NX4
U 1 1 575CE601
P 9350 5000
F 0 "NX4" H 9850 5050 60  0000 C CNN
F 1 "IN-8" H 9850 4950 60  0000 C CNN
F 2 "Nixie:pl27-1pd" H 9850 5050 60  0001 C CNN
F 3 "" H 9850 5050 60  0000 C CNN
	1    9350 5000
	1    0    0    -1  
$EndComp
NoConn ~ 6500 2300
NoConn ~ 10750 2300
NoConn ~ 10750 5450
NoConn ~ 6500 5450
Wire Wire Line
	3600 5400 3600 5550
Wire Wire Line
	7850 5550 7850 5400
Wire Wire Line
	7900 2300 7900 2450
Wire Wire Line
	3600 2450 3600 2300
Wire Wire Line
	4150 1500 4150 1850
Wire Wire Line
	5100 1200 5100 1750
Wire Wire Line
	3200 2100 3300 2100
Wire Wire Line
	3200 5200 3300 5200
Wire Wire Line
	7450 5200 7550 5200
Wire Wire Line
	7500 2100 7600 2100
Wire Bus Line
	1900 3050 1900 6400
Wire Bus Line
	1900 6400 10150 6400
Wire Wire Line
	10050 6300 10050 5900
Wire Wire Line
	9900 6300 9900 5900
Wire Wire Line
	9750 6300 9750 5900
Wire Wire Line
	9600 6300 9600 5900
Wire Wire Line
	9450 6300 9450 5900
Wire Wire Line
	9250 6300 9250 5900
Wire Wire Line
	9100 5900 9100 6300
Wire Wire Line
	8950 5900 8950 6300
Wire Wire Line
	8800 5900 8800 6300
Wire Wire Line
	8650 6300 8650 5900
Wire Wire Line
	5800 6300 5800 5900
Wire Wire Line
	5650 6300 5650 5900
Wire Wire Line
	5500 6300 5500 5900
Wire Wire Line
	5350 6300 5350 5900
Wire Wire Line
	5200 6300 5200 5900
Wire Wire Line
	5000 6300 5000 5900
Wire Wire Line
	4850 5900 4850 6300
Wire Wire Line
	4700 5900 4700 6300
Wire Wire Line
	4550 5900 4550 6300
Wire Wire Line
	4400 6300 4400 5900
Wire Wire Line
	10050 3150 10050 2750
Wire Wire Line
	9900 3150 9900 2750
Wire Wire Line
	9750 3150 9750 2750
Wire Wire Line
	9600 3150 9600 2750
Wire Wire Line
	9450 3150 9450 2750
Wire Wire Line
	9250 3150 9250 2750
Wire Wire Line
	9100 2750 9100 3150
Wire Wire Line
	8950 2750 8950 3150
Wire Wire Line
	8800 2750 8800 3150
Wire Wire Line
	8650 3150 8650 2750
Wire Wire Line
	5800 3150 5800 2750
Wire Wire Line
	5650 3150 5650 2750
Wire Wire Line
	5500 3150 5500 2750
Wire Wire Line
	5350 3150 5350 2750
Wire Wire Line
	5200 3150 5200 2750
Wire Wire Line
	5000 3150 5000 2750
Wire Wire Line
	4850 2750 4850 3150
Wire Wire Line
	4700 2750 4700 3150
Wire Wire Line
	4550 2750 4550 3150
Wire Wire Line
	4400 3150 4400 2750
Wire Bus Line
	1900 3250 10150 3250
Connection ~ 3600 4950
Wire Wire Line
	4150 4950 3600 4950
Wire Wire Line
	3600 4900 3600 5000
Connection ~ 3600 4300
Wire Wire Line
	3600 4150 3600 4400
Wire Wire Line
	3950 4300 3600 4300
Wire Wire Line
	4150 4600 4150 4950
Wire Wire Line
	5100 4300 5100 4900
Wire Wire Line
	4950 4300 5100 4300
Wire Wire Line
	4350 4300 4450 4300
Connection ~ 3600 1850
Wire Wire Line
	4150 1850 3600 1850
Wire Wire Line
	3600 1800 3600 1900
Connection ~ 3600 1200
Wire Wire Line
	3600 1050 3600 1300
Wire Wire Line
	3950 1200 3600 1200
Wire Wire Line
	4950 1200 5100 1200
Wire Wire Line
	4350 1200 4450 1200
Connection ~ 7850 4950
Wire Wire Line
	8400 4950 7850 4950
Wire Wire Line
	7850 4900 7850 5000
Connection ~ 7850 4300
Wire Wire Line
	7850 4150 7850 4400
Wire Wire Line
	8200 4300 7850 4300
Connection ~ 7900 1850
Wire Wire Line
	8450 1850 7900 1850
Wire Wire Line
	7900 1800 7900 1900
Connection ~ 7900 1200
Wire Wire Line
	6900 2100 7000 2100
Wire Wire Line
	2700 5200 2600 5200
Wire Wire Line
	6850 5200 6950 5200
Wire Wire Line
	7900 1050 7900 1300
Wire Wire Line
	8250 1200 7900 1200
Wire Wire Line
	8400 4600 8400 4950
Wire Wire Line
	9350 4300 9350 4900
Wire Wire Line
	9200 4300 9350 4300
Wire Wire Line
	8600 4300 8700 4300
Wire Wire Line
	9350 1200 9350 1750
Wire Wire Line
	9250 1200 9350 1200
Wire Wire Line
	8450 1500 8450 1850
Wire Wire Line
	8650 1200 8750 1200
$Comp
L GND #PWR023
U 1 1 575E07CD
P 3600 5550
F 0 "#PWR023" H 3600 5550 30  0001 C CNN
F 1 "GND" H 3600 5480 30  0001 C CNN
F 2 "" H 3600 5550 60  0000 C CNN
F 3 "" H 3600 5550 60  0000 C CNN
	1    3600 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2950 1800 2950
Wire Wire Line
	1500 3050 1800 3050
Wire Wire Line
	1500 3150 1800 3150
Wire Wire Line
	1500 3250 1800 3250
Wire Wire Line
	1500 3350 1800 3350
Wire Wire Line
	1500 3450 1800 3450
Wire Wire Line
	1500 3550 1800 3550
Wire Wire Line
	1500 3650 1800 3650
Wire Wire Line
	1500 3750 1800 3750
Wire Wire Line
	1500 3850 1800 3850
Wire Wire Line
	2600 2100 2700 2100
$EndSCHEMATC
