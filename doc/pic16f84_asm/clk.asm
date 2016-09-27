;**********************************
;
;	Nixie single tube clock
;	=======================
;
;**********************************
; Autor: Muris Pucic Trax
; Izvor: www.elektronika.ba
; Datum: aug 2009
;**********************************
;
; Opis: Nixie single tube clock :)
;
; ------------------------
; Datum    | Modify razlog
; ---------|--------------
; 25/08/09 | Start projekta, test elektronike.
; 26/08/09 | Pravim podesavanje vremena i sredjujem sitnice... Gotovo, radi.
; 00/08/09 | 
; -----------------------

;***** Deklaracija i konfigurisanje mikrokontrolera *****

        PROCESSOR 16f84A
        #include "p16f84a.inc"

		;ERRORLEVEL	0,	-302	;suppress bank selection messages

		__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _LP_OSC

;***** Deklaracija hardvera *****

#define		dig3	PORTA, 0 	; 3
#define 	dig1	PORTA, 1 	; 1
#define		dig9	PORTA, 2	; 9
#define		LED		PORTA, 3	; led output pin
#define		PWR		PORTA, 4	; power supply sense pin

#define		dig0	PORTB, 0	; 0
#define		dig2	PORTB, 1 	; 2
#define		dig7	PORTB, 2 	; 7
#define		dig8	PORTB, 3 	; 8
#define		dig6	PORTB, 4 	; 6
#define		BTN		PORTB, 5 	; button input
#define		dig5	PORTB, 6 	; 5
#define		dig4	PORTB, 7 	; 4

;***** Deklaracija konstanti i varijabli *****

BOOLEAN		equ	0x0C			; registar za izvedene bool varijable
PAUS_TMP1	equ	0x0D			; Pauza - tmp
PAUS_TMP2	equ	0x0E			; Pauza - tmp

sati		equ	0x0F
minute		equ	0x10
sekunde		equ	0x11

tmp1		equ	0x12			; treba svugdje
tmp2		equ	0x13			; treba svugdje

sati_		equ	0x14			; treba ShowTime
minute_		equ	0x15			; treba u ShowTime

SHOW_CNT	equ	0x16			; treba u Idle za periodicni prikaz vremena - show count
PREV_MIN	equ	0x17			; treba u Idle za periodicni prikaz vremena - provjera naredne minute

tmp7		equ	0x18			; treba u Funky
tmp8		equ	0x19			; treba u Display
tmp9		equ	0x1A			; treba u ConvertNr
tmp10		equ	0x1B			; treba u ConvertNr

DIG_DUR		equ	0x1C			; digit duration in 0.1s step

satix		equ	0x1D			; hour free counter 0-255 -> overflow
minutex		equ	0x1E			; minute free counter 0-255 -> overflow
sekundex	equ	0x1F			; seconds free counter 0-255 -> overflow * prilikom programiranja vremena ovo je korisno

;* mora biti po dec1, dec10 redoslijedu
dec1		equ	0x4C
dec10		equ	0x4D

		; zadnji ram koji smijem deklarisati je 0x4D :)
;* ISR temp vars
temp_status	equ	0x4E			; za interrupt rutinu
temp_w		equ	0x4F			; za interrupt rutinu
		; zadnji ram je 0x4F :)

;* Izvedene misc
#define		bBLINK	BOOLEAN, 0	; da li da se blinka na svaku sekundu

;* Literal constants
#define		cSHOW_COUNT		d'3'	; ovoliko puta prikaze vrijeme svake minute ==> how many times to show the time
#define		cDIG_DUR		d'4'	; trajanje broja * 0.1s ==> digit duration in 0.1seconds step


;***** MAKROI razni ******

BANK0	MACRO
		bcf		STATUS, RP0		; bank 0
		ENDM

BANK1	MACRO
		bsf		STATUS, RP0		; bank 1
		ENDM

;***** Struktura programske memorije *****

		ORG			0x00	; Reset vektor
  		GOTO		Init	; 

		ORG			0x04	; Interapt vektor
		GOTO		ISR		; 

;***** Interupt rutina *****

ISR		bcf		INTCON, GIE	; onemoguci sve interupte za sad
		; sacuvaj registre
		movwf	temp_w		; sacuvaj W reg
		movfw	STATUS		; W=STATUS reg
		movwf	temp_status	; sacuvaj ga
		BANK0				; bank 0 za svaki slucaj. Dole ce se vratiti STATUS registar cijeli pa je ovo OK
		; TMR0 overflow! na svakih 1sec tacno!
		bcf		INTCON, T0IF; clear!

		btfss	bBLINK		; ako se ne smije blinkati
		GOTO	ISR_nemoj	; preskoci blinkanje
		bsf		LED
		CALL 	Delay_005s
		bcf		LED
ISR_nemoj

		; sekunde++
		incf	sekundex, 1	; free sec++
		incf	sekunde, 1	; sec++
		movlw	d'60'
		subwf	sekunde, 0	; uporedi
		btfss	STATUS, Z	; ako je 60 - treba povecati minute a sec=0, ako nije izadji
		GOTO	ISR_Exit	; <60 je, izadji
		clrf	sekunde

		; minute++
		incf	minutex, 1	; free min++
		incf	minute, 1	; min++
		movlw	d'60'
		subwf	minute, 0	; uporedi
		btfss	STATUS, Z	; ako je 60 - treba povecati sate a min=0, ako nije izadji
		GOTO	ISR_Exit	; <60 je, izadji
		clrf	minute

		; sati++
		incf	satix, 1	; free hour++
		incf	sati, 1		; hour++
		movlw	d'24'
		subwf	sati, 0		; uporedi
		btfss	STATUS, Z	; ako je 24 - treba ih anulirati, ako nije izadji
		GOTO	ISR_Exit	; <24 je, izadji
		clrf	sati		; 00:00:00 :)

ISR_Exit					; vrati varijable i vrati se sa retfie
		movfw	temp_status	; w=temp status
		movwf	STATUS		; STATUS=W
		movfw	temp_w		; i konacno W
		;* override exita
		btfss	PWR			; ako je nestalo struje u medjuvremenu, bjezi u powerdown
		GOTO	SilentMode	; idi tamo pa upali interrupt, i cekaj struju
		;-
		RETFIE				; vracamo se normalno...


;***** Display W *****
; Ispise vrijednost iz registra W na nixie
; u W smije biti vrijednost 0..9
Display	; pomnozi W sa 2 da skacemo i preko
		movwf	tmp8		; sacuvaj u tmp1 da pomnozimo
		rlf		tmp8, 0		; w=tmp8*2
        addwf	PCL, 1		; skoci na ispis zeljenog broja
show0	bsf		dig0
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show1	bsf		dig1
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show2	bsf		dig2
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show3	bsf		dig3
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show4	bsf		dig4
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show5	bsf		dig5
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show6	bsf		dig6
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show7	bsf		dig7
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show8	bsf		dig8
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se
show9	bsf		dig9
		GOTO	Display_E	; ovdje ce pricekati i ugasiti se - TODO: optimizacija, nepotrebno
Display_E
		movfw	DIG_DUR
		movwf	tmp8
Display_E_1
		CALL	Delay_01s
		decfsz	tmp8, 1		; --, skip if zero
		GOTO	Display_E_1	; jos!
		bcf		dig0
		bcf		dig1
		bcf		dig2
		bcf		dig3
		bcf		dig4
		bcf		dig5
		bcf		dig6
		bcf		dig7
		bcf		dig8
		bcf		dig9
		RETURN				; vrati se...

;***** Konvertuje broj u stotke (param: W, rezult: dec100, dec10, dec1) *****
; param: w (0-99)
ConvertNr
		movwf	tmp9		; sacuvaj temp iz W
        movlw	LOW(dec10)	; address of dec10 tj. vrijednost 10-tina
        movwf	FSR			; file select register
        movlw	h'02'		; number of variables  units tens (2)
        movwf	tmp10		; temporary counting variable
ConvertNr_0
        clrf	INDF		; clear current value
ConvertNr_1
        call	GetBaseScalar; uzmi vrijednost koju oduzimas 
        subwf	tmp9, 0	; prividno oduzmi 
        btfss	STATUS,C	; provjeri da li se ista nalazi unutar tmp14
        goto	ConvertNr_2	; ne 
        movwf	tmp9		; rezultat u tmp14 stvarna vrijednost nakon oduzimanja
        incf	INDF, 1		; incremetiraj variablu odredenu sa FSR
        goto	ConvertNr_1	; ponovi opet
ConvertNr_2
        decf	FSR, 1        
        decfsz	tmp10, 1
        goto	ConvertNr_0
        return				; vrati se...
GetBaseScalar
        movf	tmp10, 0
        addwf	PCL, 1
        nop
        retlw	d'1' 		; 1
        retlw	d'10' 		; 10
		; gornje sve iznad, mora biti u prvih 255 bajta ovog page-a

;***** Inicijalizacija uc-a *****

Init	clrf	INTCON		; svi prekidi onemoguceni
		BANK1				; bank 1 zbog option i tris
		movlw	b'00000100'	; 
		movwf	OPTION_REG	; pullups on, TMR0 presc: 1:32, pullups ON
		movlw	b'00100000'	; TRISB
		movwf	TRISB		; [________]
		movlw	b'11110000'	; TRISA
		movwf	TRISA		; [xxx_____]
		BANK0				; bank 0

		clrf	PORTA		; gasi sve
		clrf	PORTB		; gasi sve

		bsf		LED
		CALL	Delay_1s	; cek 1 sec
		bcf		LED
		CALL	Delay_1s	; cek 1 sec

		; init sata, krecemo od 00:00:00
		clrf	sati
		clrf	minute
		clrf	sekunde
		clrf	PREV_MIN	; ovo nece inicijalno pokazati vrijeme

		movlw	cDIG_DUR	; trajanje cifre
		movwf	DIG_DUR

		bsf		INTCON, T0IE; omoguci prekid na tmr0 kad predje sa hFF na h00
		bsf		INTCON, GIE	; omoguci sve prekide zauvijek ! main switch on :)

		GOTO	TimeSet		; idi na podesenje vremena...


;***** Main program, idliranje *****

Idle	; prikazi vrijeme ako su PREV_MIN i minute razliciti
		movfw	minute
		subwf	PREV_MIN, 0	; uporedi
		btfss	STATUS, Z	; skip if they are the same
		GOTO	ShowTime	; razliciti su, prikazi vrijeme cSHOW_COUNT puta!

		; ako se pritisne dugme, prikazi vrijeme maxuz
		btfss	BTN
		GOTO	ShowTime	; prikazi ga maxuz cSHOW_COUNT puta

		GOTO	Idle		; vrti se...


;***** ShowTime *****

ShowTime
		bcf		bBLINK		; ne blinkaj zelenu vise
		bsf		LED
		;CALL	Delay_05s

		; pokupi vrijeme za prikaz
		movfw	sati
		movwf	sati_
		movfw	minute
		movwf	minute_

		; ako je minute_==0 uradi Funky stuff
		tstf	minute_
		btfsc	STATUS, Z
		CALL	Funky		; funky mode na puni sat xx:00

		movlw	cSHOW_COUNT	; countdown show counter
		movwf	SHOW_CNT
ShowTime_1
		CALL	Delay_1s

		; sati
		movfw	sati_
		CALL	ConvertNr
		movfw	dec10
		CALL	Display
		CALL	Delay_01s
		movfw	dec1
		CALL	Display
		CALL	Delay_01s
		CALL	Delay_01s
		CALL	Delay_01s
		CALL	Delay_01s

		; minute
		movfw	minute_
		CALL	ConvertNr
		movfw	dec10
		CALL	Display
		CALL	Delay_01s
		movfw	dec1
		CALL	Display
		;CALL	Delay_05s
		
		; necu prikazivati sekunde, zbunjujuce je

		CALL	Delay_1s	; cek 1sec
		decfsz	SHOW_CNT, 1	; --, skip if zero
		GOTO	ShowTime_1	; jos!

		bcf		LED
		bsf		bBLINK		; blinkaj sekunde...

		movfw	minute
		movwf	PREV_MIN	; brojimo da svaku minutu se upalimo i pokazemo vrijeme

		GOTO	Idle		; vrati se...


;***** SilentMode ******
; iskljucimo sve, i samo se vrtimo a interrupt cuva vrijeme

SilentMode
		; moramo upaliti interrupt jer smo ga upravo ugasili :)
		bsf		INTCON, GIE	; pali ga nazad!
		bcf		bBLINK		; nema ni ovog
		clrf	PORTA		; gasi sve
		clrf	PORTB		; gasi sve
SilentMode_1
		btfss	PWR			; ako jos nema struje
		GOTO	SilentMode_1; vrti se ovdje...
		; dosla struja:
		btfss	BTN			; ako je pritisnuto dugme, idemo u TimeSet
		GOTO	TimeSet		; ajde u podesenja vremena
		bsf		bBLINK		; omoguci blinkaca
		GOTO	Idle		; ne treba podesavati, ajd u main


;***** Funky *****

Funky	movfw	DIG_DUR		; da backupiramo
		movwf	tmp7
		movlw	d'1'
		movwf	DIG_DUR		; da pice brojevi u funky modu

		movlw	d'5'
		CALL	Display		; ispisi
		movlw	d'2'
		CALL	Display		; ispisi
		movlw	d'7'
		CALL	Display		; ispisi
		movlw	d'3'
		CALL	Display		; ispisi
		movlw	d'1'
		CALL	Display		; ispisi
		movlw	d'9'
		CALL	Display		; ispisi
		movlw	d'4'
		CALL	Display		; ispisi
		movlw	d'8'
		CALL	Display		; ispisi
		movlw	d'0'
		CALL	Display		; ispisi
		movlw	d'6'
		CALL	Display		; ispisi

		movfw	tmp7
		movwf	DIG_DUR		; vratimo ovo u normalu
		RETURN				; vrati se...


;***** TimeSet *****

TimeSet	bcf		bBLINK
		bsf		LED

		CALL	Funky
		CALL	Funky
		CALL	Delay_1s	; funky 2x :)

		; sad programiramo vrijeme, kada se napravi pauza od ~5sec (manje zbog vremena potrebnog da se prikaze trenutna vrijednost) a da se dugme ne pritisne, tad je unos minuta odnosno kraj programiranja

		; prvo odma unosimo sate 0-24
		clrf	TMR0		; ocisti ovo da sad pocne brojati
		clrf	sekundex	; ocisti i free seconds counter

		clrf	sati
TimeSet_1
		clrf	sekunde		; da nas sekunde ne zeznu prilikom stimanja vremena, jer RTC broji...

		movfw	sati
		CALL	ConvertNr
		movfw	dec10
		CALL	Display
		CALL	Delay_005s
		movfw	dec1
		CALL	Display
		CALL	Delay_01s

		; DUGME?
		btfss	BTN			; ako je pritisnuto
		incf	sati, 1		; sati++ :)
		btfss	BTN			; ako je pritisnuto
		clrf	sekundex	; ocistimo ovo da ne iskocimo iz programiranja
		; nedaj da bude 24h!
		movlw	d'24'
		subwf	sati, 0		; oduzmi
		btfsc	STATUS, Z	; if sati==24?
		clrf	sati		; to je ustvari sati=0

		movlw	d'3'
		subwf	sekundex, 0	; jesmol dopustili da ovo naraste na 3?
		btfss	STATUS, Z	; ako nismo
		GOTO	TimeSet_1	; opet...

		bcf		LED
		CALL	Delay_01s
		bsf		LED
		CALL	Delay_01s
		bcf		LED
		CALL	Delay_01s
		bsf		LED
		; sad programiramo minute i to je to

		clrf	TMR0		; ocisti ovo da sad pocne brojati
		clrf	sekundex	; ocisti i free seconds counter

		clrf	minute
TimeSet_2
		clrf	sekunde		; da nas sekunde ne zeznu prilikom stimanja vremena, jer RTC broji...
		movfw	minute
		CALL	ConvertNr
		movfw	dec10
		CALL	Display
		CALL	Delay_005s
		movfw	dec1
		CALL	Display
		CALL	Delay_01s

		; DUGME?
		btfss	BTN			; ako je pritisnuto
		incf	minute, 1	; min++ :)
		btfss	BTN			; ako je pritisnuto
		clrf	sekundex	; ocistimo ovo da ne iskocimo iz programiranja
		; nedaj da bude 60h!
		movlw	d'60'
		subwf	minute, 0	; oduzmi
		btfsc	STATUS, Z	; if min==24?
		clrf	minute		; to je ustvari min=0

		movlw	d'3'
		subwf	sekundex, 0	; jesmol dopustili da ovo naraste na 3?
		btfss	STATUS, Z	; ako nismo
		GOTO	TimeSet_2	; opet...

		CALL	Funky		; zavrsimo...

		bcf		LED
		bsf		bBLINK
		GOTO	Idle		; bye bye


;***** Delays ******
; Delay = 1 seconds
; Clock frequency = 0.032768 MHz
; Actual delay = 1 seconds = 8192 cycles
; Error = 0 %
Delay_1s					;8188 cycles
		movlw	h'65'
		movwf	PAUS_TMP1
		movlw	h'07'
		movwf	PAUS_TMP2
Delay_1s_0
		decfsz	PAUS_TMP1, 1
		goto	$+2
		decfsz	PAUS_TMP2, 1
		goto	Delay_1s_0
		RETURN				;4 cycles (including call)

; Delay = 0.1 seconds
; Clock frequency = 0.032768 MHz
; Actual delay = 0.0999755859375 seconds = 819 cycles
; Error = 0.0244140625 %
Delay_01s					;813 cycles
		movlw	h'A2'
		movwf	PAUS_TMP1
		movlw	h'01'
		movwf	PAUS_TMP2
Delay_01s_0
		decfsz	PAUS_TMP1, 1
		goto	$+2
		decfsz	PAUS_TMP2, 1
		goto	Delay_01s_0
		goto	$+1			;2 cycles
		RETURN				;4 cycles (including call)

; Delay = 0.5 seconds
; Clock frequency = 0.032768 MHz
; Actual delay = 0.5 seconds = 4096 cycles
; Error = 0 %
Delay_05s					;4088 cycles
		movlw	h'31'
		movwf	PAUS_TMP1
		movlw	h'04'
		movwf	PAUS_TMP2
Delay_05s_0
		decfsz	PAUS_TMP1, 1
		goto	$+2
		decfsz	PAUS_TMP2, 1
		goto	Delay_05s_0
		goto	$+1
		goto	$+1			;4 cycles
		RETURN				;4 cycles (including call)

; Delay = 0.05 seconds
; Clock frequency = 0.032768 MHz
; Actual delay = 0.050048828125 seconds = 410 cycles
; Error = -0.09765625 %
Delay_005s					;406 cycles
		movlw	h'87'
		movwf	PAUS_TMP1
Delay_005s_0
		decfsz	PAUS_TMP1, 1
		goto	Delay_005s_0
		RETURN				;4 cycles (including call)


;***** KONEC :) *****

		END