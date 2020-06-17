
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,5 :: 		ADCON1 = 14;
	MOVLW       14
	MOVWF       ADCON1+0 
;MyProject.c,6 :: 		ADCON2 = 0b10010001;
	MOVLW       145
	MOVWF       ADCON2+0 
;MyProject.c,8 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,10 :: 		PR2 = 124 ;
	MOVLW       124
	MOVWF       PR2+0 
;MyProject.c,11 :: 		T2CON = 0b00000100 ;
	MOVLW       4
	MOVWF       T2CON+0 
;MyProject.c,12 :: 		CCP1CON = 0b00001100 ;
	MOVLW       12
	MOVWF       CCP1CON+0 
;MyProject.c,15 :: 		CCP2CON = 0b00001100 ;
	MOVLW       12
	MOVWF       CCP2CON+0 
;MyProject.c,17 :: 		while(1)
L_main0:
;MyProject.c,19 :: 		ADCON0 = 0b0000000001;
	MOVLW       1
	MOVWF       ADCON0+0 
;MyProject.c,20 :: 		Go_Done_bit = 1;
	BSF         GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
;MyProject.c,21 :: 		while(Go_Done_bit);
L_main2:
	BTFSS       GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;MyProject.c,22 :: 		z = ADRESH*256 + ADRESL;
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       main_z_L0+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       main_z_L0+1 
;MyProject.c,23 :: 		duty_cycle = (124.0 / 1023) * z;
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
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
	MOVF        R0, 0 
	MOVWF       main_duty_cycle_L0+0 
	MOVF        R1, 0 
	MOVWF       main_duty_cycle_L0+1 
;MyProject.c,24 :: 		if(z == 1023 / 2)
	MOVF        FLOC__main+1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main9
	MOVLW       255
	XORWF       FLOC__main+0, 0 
L__main9:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;MyProject.c,26 :: 		CCPR1L = 1 ;
	MOVLW       1
	MOVWF       CCPR1L+0 
;MyProject.c,27 :: 		CCPR2L = 1;
	MOVLW       1
	MOVWF       CCPR2L+0 
;MyProject.c,28 :: 		}
	GOTO        L_main5
L_main4:
;MyProject.c,29 :: 		else if(z > 1023 / 2)
	MOVF        main_z_L0+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main10
	MOVF        main_z_L0+0, 0 
	SUBLW       255
L__main10:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;MyProject.c,31 :: 		CCPR1L = duty_cycle - 62;
	MOVLW       62
	SUBWF       main_duty_cycle_L0+0, 0 
	MOVWF       CCPR1L+0 
;MyProject.c,32 :: 		CCPR2L = 1;
	MOVLW       1
	MOVWF       CCPR2L+0 
;MyProject.c,33 :: 		}
	GOTO        L_main7
L_main6:
;MyProject.c,36 :: 		CCPR1L = 1;
	MOVLW       1
	MOVWF       CCPR1L+0 
;MyProject.c,37 :: 		CCPR2L = 62 - duty_cycle;
	MOVF        main_duty_cycle_L0+0, 0 
	SUBLW       62
	MOVWF       CCPR2L+0 
;MyProject.c,38 :: 		}
L_main7:
L_main5:
;MyProject.c,39 :: 		}
	GOTO        L_main0
;MyProject.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
