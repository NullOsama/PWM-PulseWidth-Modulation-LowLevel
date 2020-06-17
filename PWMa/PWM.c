void main() 
{

 char duty_cycle = 0;
 
 TRISC = 0;
 PR2 = 124 ;
 T2CON = 0b00000100 ;
 CCP1CON = 0b00001100 ;

 for(duty_cycle = 0; duty_cycle < 124; duty_cycle++)
 {
  CCPR1L = duty_cycle;
  delay_ms(25);
 }
}