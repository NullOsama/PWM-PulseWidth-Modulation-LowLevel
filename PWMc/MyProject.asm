
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,4 :: 		unsigned int duty_cycle = 0;
;MyProject.c,5 :: 		ADCON1 = 14;
	MOVLW       14
	MOVWF       ADCON1+0 
;MyProject.c,6 :: 		ADCON2 = 0b10010101;
	MOVLW       149
	MOVWF       ADCON2+0 
;MyProject.c,8 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,9 :: 		PR2 = 124 ;
	MOVLW       124
	MOVWF       PR2+0 
;MyProject.c,10 :: 		T2CON = 0b00000100 ;
	MOVLW       4
	MOVWF       T2CON+0 
;MyProject.c,11 :: 		CCP1CON = 0b00001100 ;
	MOVLW       12
	MOVWF       CCP1CON+0 
;MyProject.c,13 :: 		while(1)
L_main0:
;MyProject.c,15 :: 		ADCON0 = 0b0000000001;
	MOVLW       1
	MOVWF       ADCON0+0 
;MyProject.c,16 :: 		Go_Done_bit = 1;
	BSF         GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
;MyProject.c,17 :: 		while(Go_Done_bit);
L_main2:
	BTFSS       GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;MyProject.c,18 :: 		z = ADRESH*256 + ADRESL;
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
;MyProject.c,19 :: 		duty_cycle = (124.0 / 1023) * z;
	CALL        _word2double+0, 0
	MOVLW       16
	MOVWF       R4 
	MOVLW       62
	MOVWF       R5 
	MOVLW       120
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
;MyProject.c,20 :: 		CCPR1L = duty_cycle;
	MOVF        R0, 0 
	MOVWF       CCPR1L+0 
;MyProject.c,21 :: 		}
	GOTO        L_main0
;MyProject.c,22 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
