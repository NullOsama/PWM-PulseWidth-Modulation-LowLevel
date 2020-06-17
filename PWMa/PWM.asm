
_main:

;PWM.c,1 :: 		void main()
;PWM.c,4 :: 		char duty_cycle = 0;
	CLRF        main_duty_cycle_L0+0 
;PWM.c,6 :: 		TRISC = 0;
	CLRF        TRISC+0 
;PWM.c,7 :: 		PR2 = 124 ;
	MOVLW       124
	MOVWF       PR2+0 
;PWM.c,8 :: 		T2CON = 0b00000100 ;
	MOVLW       4
	MOVWF       T2CON+0 
;PWM.c,9 :: 		CCP1CON = 0b00001100 ;
	MOVLW       12
	MOVWF       CCP1CON+0 
;PWM.c,11 :: 		for(duty_cycle = 0; duty_cycle < 124; duty_cycle++)
	CLRF        main_duty_cycle_L0+0 
L_main0:
	MOVLW       124
	SUBWF       main_duty_cycle_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
;PWM.c,13 :: 		CCPR1L = duty_cycle;
	MOVF        main_duty_cycle_L0+0, 0 
	MOVWF       CCPR1L+0 
;PWM.c,14 :: 		delay_ms(25);
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;PWM.c,11 :: 		for(duty_cycle = 0; duty_cycle < 124; duty_cycle++)
	INCF        main_duty_cycle_L0+0, 1 
;PWM.c,15 :: 		}
	GOTO        L_main0
L_main1:
;PWM.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
