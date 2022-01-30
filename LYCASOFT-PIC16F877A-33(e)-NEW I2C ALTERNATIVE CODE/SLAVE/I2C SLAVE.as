opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_cmd
	FNCALL	_main,_i2c_Start
	FNCALL	_main,_receive
	FNCALL	_main,_i2c_Stop
	FNCALL	_i2c_Stop,_i2c_Wait
	FNCALL	_i2c_Start,_i2c_Wait
	FNROOT	_main
	global	main@F1107
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	44

;initializer for main@F1107
	retlw	053h
	retlw	054h
	retlw	052h
	retlw	049h
	retlw	04Eh
	retlw	047h
	retlw	0
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_CARRY
_CARRY	set	24
	global	_CKP
_CKP	set	164
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_ACKSTAT
_ACKSTAT	set	1166
	global	_PEN
_PEN	set	1162
	global	_SEN
_SEN	set	1160
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"I2C SLAVE.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
main@F1107:
       ds      7

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+7)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_i2c_Wait
?_i2c_Wait:	; 0 bytes @ 0x0
	global	??_i2c_Wait
??_i2c_Wait:	; 0 bytes @ 0x0
	global	?_i2c_Start
?_i2c_Start:	; 0 bytes @ 0x0
	global	??_i2c_Start
??_i2c_Start:	; 0 bytes @ 0x0
	global	?_i2c_Stop
?_i2c_Stop:	; 0 bytes @ 0x0
	global	??_i2c_Stop
??_i2c_Stop:	; 0 bytes @ 0x0
	global	??_receive
??_receive:	; 0 bytes @ 0x0
	global	?_cmd
?_cmd:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_receive
?_receive:	; 1 bytes @ 0x0
	global	cmd@y
cmd@y:	; 1 bytes @ 0x0
	ds	1
	global	??_cmd
??_cmd:	; 0 bytes @ 0x1
	ds	2
	global	receive@s
receive@s:	; 1 bytes @ 0x3
	ds	1
	global	cmd@x
cmd@x:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@a
main@a:	; 7 bytes @ 0x0
	ds	7
	global	main@ch
main@ch:	; 1 bytes @ 0x7
	ds	1
;;Data sizes: Strings 0, constant 0, data 7, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      8      15
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_cmd
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                14    14      0      69
;;                                              5 COMMON     4     4      0
;;                                              0 BANK0      8     8      0
;;                                _cmd
;;                          _i2c_Start
;;                            _receive
;;                           _i2c_Stop
;; ---------------------------------------------------------------------------------
;; (1) _cmd                                                  5     4      1      44
;;                                              0 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; (1) _receive                                              4     4      0      23
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _i2c_Stop                                             0     0      0       0
;;                           _i2c_Wait
;; ---------------------------------------------------------------------------------
;; (1) _i2c_Start                                            0     0      0       0
;;                           _i2c_Wait
;; ---------------------------------------------------------------------------------
;; (2) _i2c_Wait                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _cmd
;;   _i2c_Start
;;     _i2c_Wait
;;   _receive
;;   _i2c_Stop
;;     _i2c_Wait
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1A      12        0.0%
;;ABS                  0      0      18       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      8       F       5       18.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 41 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               7    0[BANK0 ] unsigned char [7]
;;  i               2    0        int 
;;  ch              1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       8       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_cmd
;;		_i2c_Start
;;		_receive
;;		_i2c_Stop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	41
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	44
	
l2720:	
;I2C SLAVE.c: 42: int i;
;I2C SLAVE.c: 43: char ch;
;I2C SLAVE.c: 44: char a[]="STRING";
	movlw	(main@a)&0ffh
	movwf	fsr0
	movlw	low(main@F1107)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	7
	movwf	((??_main+0)+0+2)
u2320:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2320
	line	46
	
l2722:	
;I2C SLAVE.c: 46: TRISB=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	47
	
l2724:	
;I2C SLAVE.c: 47: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	49
	
l2726:	
;I2C SLAVE.c: 49: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	50
	
l2728:	
;I2C SLAVE.c: 50: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	52
	
l2730:	
;I2C SLAVE.c: 52: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	53
	
l2732:	
;I2C SLAVE.c: 53: TRISC4=1;
	bsf	(1084/8)^080h,(1084)&7
	line	54
	
l2734:	
;I2C SLAVE.c: 54: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	56
	
l2736:	
;I2C SLAVE.c: 56: cmd(0x38,0);
	clrf	(?_cmd)
	movlw	(038h)
	fcall	_cmd
	line	57
	
l2738:	
;I2C SLAVE.c: 57: cmd(0x06,0);
	clrf	(?_cmd)
	movlw	(06h)
	fcall	_cmd
	line	58
	
l2740:	
;I2C SLAVE.c: 58: cmd(0x01,0);
	clrf	(?_cmd)
	movlw	(01h)
	fcall	_cmd
	line	59
	
l2742:	
;I2C SLAVE.c: 59: cmd(0x80,0);
	clrf	(?_cmd)
	movlw	(080h)
	fcall	_cmd
	line	60
	
l2744:	
;I2C SLAVE.c: 60: cmd(0x0d,0);
	clrf	(?_cmd)
	movlw	(0Dh)
	fcall	_cmd
	line	61
	
l2746:	
;I2C SLAVE.c: 61: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2347:
	decfsz	((??_main+0)+0),f
	goto	u2347
	decfsz	((??_main+0)+0+1),f
	goto	u2347
	decfsz	((??_main+0)+0+2),f
	goto	u2347
	nop2
opt asmopt_on

	line	63
	
l2748:	
;I2C SLAVE.c: 63: SSPSTAT=0x84;
	movlw	(084h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	64
	
l2750:	
;I2C SLAVE.c: 64: SSPCON=0x66;
	movlw	(066h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	65
	
l2752:	
;I2C SLAVE.c: 65: SSPCON2=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	66
	
l2754:	
;I2C SLAVE.c: 66: SSPADD=0x24;
	movlw	(024h)
	movwf	(147)^080h	;volatile
	line	67
	
l2756:	
;I2C SLAVE.c: 67: SSPBUF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(19)	;volatile
	line	68
	
l2758:	
;I2C SLAVE.c: 68: SSPIF=0;
	bcf	(99/8),(99)&7
	goto	l2760
	line	70
;I2C SLAVE.c: 70: while(1)
	
l707:	
	line	72
	
l2760:	
;I2C SLAVE.c: 71: {
;I2C SLAVE.c: 72: i2c_Start();
	fcall	_i2c_Start
	line	73
	
l2762:	
;I2C SLAVE.c: 73: if(ACKSTAT==0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1166/8)^080h,(1166)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l2760
u2330:
	line	75
	
l2764:	
;I2C SLAVE.c: 74: {
;I2C SLAVE.c: 75: SSPBUF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(19)	;volatile
	line	76
	
l2766:	
;I2C SLAVE.c: 76: ch=receive();
	fcall	_receive
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@ch)
	line	78
	
l2768:	
;I2C SLAVE.c: 78: CKP=1;
	bsf	(164/8),(164)&7
	line	79
	
l2770:	
;I2C SLAVE.c: 79: i2c_Stop();
	fcall	_i2c_Stop
	goto	l2760
	line	80
	
l708:	
	goto	l2760
	line	81
	
l709:	
	line	70
	goto	l2760
	
l710:	
	line	82
	
l711:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_cmd
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _cmd *****************
;; Defined at:
;;		line 31 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  y               1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text197
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	31
	global	__size_of_cmd
	__size_of_cmd	equ	__end_of_cmd-_cmd
	
_cmd:	
	opt	stack 7
; Regs used in _cmd: [wreg]
;cmd@x stored from wreg
	movwf	(cmd@x)
	line	32
	
l2714:	
;I2C SLAVE.c: 32: RB0=y;
	btfsc	(cmd@y),0
	goto	u2301
	goto	u2300
	
u2301:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2314
u2300:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2314:
	line	33
;I2C SLAVE.c: 33: RB1=0;
	bcf	(49/8),(49)&7
	line	34
;I2C SLAVE.c: 34: RB2=1;
	bsf	(50/8),(50)&7
	line	35
	
l2716:	
;I2C SLAVE.c: 35: PORTD=x;
	movf	(cmd@x),w
	movwf	(8)	;volatile
	line	36
	
l2718:	
;I2C SLAVE.c: 36: RB2=0;
	bcf	(50/8),(50)&7
	line	37
;I2C SLAVE.c: 37: _delay((unsigned long)((70)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_cmd+0)+0+2),f
movlw	199
movwf	((??_cmd+0)+0+1),f
	movlw	136
movwf	((??_cmd+0)+0),f
u2357:
	decfsz	((??_cmd+0)+0),f
	goto	u2357
	decfsz	((??_cmd+0)+0+1),f
	goto	u2357
	decfsz	((??_cmd+0)+0+2),f
	goto	u2357
	clrwdt
opt asmopt_on

	line	38
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_cmd
	__end_of_cmd:
;; =============== function _cmd ends ============

	signat	_cmd,8312
	global	_receive
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:

;; *************** function _receive *****************
;; Defined at:
;;		line 22 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  s               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text198
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	22
	global	__size_of_receive
	__size_of_receive	equ	__end_of_receive-_receive
	
_receive:	
	opt	stack 7
; Regs used in _receive: [wreg]
	line	24
	
l2708:	
;I2C SLAVE.c: 23: char s;
;I2C SLAVE.c: 24: SSPIF=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(99/8),(99)&7
	line	25
	
l2710:	
;I2C SLAVE.c: 25: s=SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_receive+0)+0
	movf	(??_receive+0)+0,w
	movwf	(receive@s)
	line	26
;I2C SLAVE.c: 26: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_receive+0)+0+2),f
movlw	138
movwf	((??_receive+0)+0+1),f
	movlw	86
movwf	((??_receive+0)+0),f
u2367:
	decfsz	((??_receive+0)+0),f
	goto	u2367
	decfsz	((??_receive+0)+0+1),f
	goto	u2367
	decfsz	((??_receive+0)+0+2),f
	goto	u2367
	nop2
opt asmopt_on

	line	27
;I2C SLAVE.c: 27: return s;
	movf	(receive@s),w
	goto	l699
	
l2712:	
	line	28
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_receive
	__end_of_receive:
;; =============== function _receive ends ============

	signat	_receive,89
	global	_i2c_Stop
psect	text199,local,class=CODE,delta=2
global __ptext199
__ptext199:

;; *************** function _i2c_Stop *****************
;; Defined at:
;;		line 16 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_Wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text199
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	16
	global	__size_of_i2c_Stop
	__size_of_i2c_Stop	equ	__end_of_i2c_Stop-_i2c_Stop
	
_i2c_Stop:	
	opt	stack 6
; Regs used in _i2c_Stop: [wreg+status,2+status,0+pclath+cstack]
	line	17
	
l2704:	
;I2C SLAVE.c: 17: i2c_Wait();
	fcall	_i2c_Wait
	line	18
	
l2706:	
;I2C SLAVE.c: 18: PEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	19
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_Stop
	__end_of_i2c_Stop:
;; =============== function _i2c_Stop ends ============

	signat	_i2c_Stop,88
	global	_i2c_Start
psect	text200,local,class=CODE,delta=2
global __ptext200
__ptext200:

;; *************** function _i2c_Start *****************
;; Defined at:
;;		line 10 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_Wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text200
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	10
	global	__size_of_i2c_Start
	__size_of_i2c_Start	equ	__end_of_i2c_Start-_i2c_Start
	
_i2c_Start:	
	opt	stack 6
; Regs used in _i2c_Start: [wreg+status,2+status,0+pclath+cstack]
	line	11
	
l2700:	
;I2C SLAVE.c: 11: i2c_Wait();
	fcall	_i2c_Wait
	line	12
	
l2702:	
;I2C SLAVE.c: 12: SEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	13
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_Start
	__end_of_i2c_Start:
;; =============== function _i2c_Start ends ============

	signat	_i2c_Start,88
	global	_i2c_Wait
psect	text201,local,class=CODE,delta=2
global __ptext201
__ptext201:

;; *************** function _i2c_Wait *****************
;; Defined at:
;;		line 5 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2c_Start
;;		_i2c_Stop
;; This function uses a non-reentrant model
;;
psect	text201
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C ALTERNATIVE CODE\SLAVE\I2C SLAVE.c"
	line	5
	global	__size_of_i2c_Wait
	__size_of_i2c_Wait	equ	__end_of_i2c_Wait-_i2c_Wait
	
_i2c_Wait:	
	opt	stack 6
; Regs used in _i2c_Wait: [wreg+status,2]
	line	6
	
l2694:	
;I2C SLAVE.c: 6: while ( ( SSPCON2 & 0x1F ) || ( SSPSTAT & 0x04 ) );
	goto	l2696
	
l688:	
	goto	l2696
	
l687:	
	
l2696:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u2281
	goto	u2280
u2281:
	goto	l2696
u2280:
	
l2698:	
	btfsc	(148)^080h,(2)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l2696
u2290:
	goto	l690
	
l689:	
	line	7
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_Wait
	__end_of_i2c_Wait:
;; =============== function _i2c_Wait ends ============

	signat	_i2c_Wait,88
psect	text202,local,class=CODE,delta=2
global __ptext202
__ptext202:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
