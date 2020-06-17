
_main:

;MyProject.c,1 :: 		void main()
;MyProject.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,5 :: 		PR2 = 124 ;
	MOVLW       124
	MOVWF       PR2+0 
;MyProject.c,6 :: 		T2CON = 0b00000100 ;
	MOVLW       4
	MOVWF       T2CON+0 
;MyProject.c,7 :: 		CCP1CON = 0b00001100 ;
	MOVLW       12
	MOVWF       CCP1CON+0 
;MyProject.c,11 :: 		for(duty_cycle = 0; duty_cycle < 256; duty_cycle += 0.1 * 124)
	CLRF        main_duty_cycle_L0+0 
L_main0:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVLW       0
	SUBWF       main_duty_cycle_L0+0, 0 
L__main5:
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
;MyProject.c,13 :: 		CCPR1L = duty_cycle;
	MOVF        main_duty_cycle_L0+0, 0 
	MOVWF       CCPR1L+0 
;MyProject.c,14 :: 		delay_ms(25);
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;MyProject.c,11 :: 		for(duty_cycle = 0; duty_cycle < 256; duty_cycle += 0.1 * 124)
	MOVF        main_duty_cycle_L0+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVLW       103
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       70
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       main_duty_cycle_L0+0 
;MyProject.c,15 :: 		}
	GOTO        L_main0
L_main1:
;MyProject.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
