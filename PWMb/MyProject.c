void main()
{
 char duty_cycle;
 TRISC = 0;
 PR2 = 124 ;
 T2CON = 0b00000100 ;
 CCP1CON = 0b00001100 ;

 // speed = k * volatge

 for(duty_cycle = 0; duty_cycle < 256; duty_cycle += 0.1 * 124)
 {
  CCPR1L = duty_cycle;
  delay_ms(25);
 }
}