#line 1 "C:/Users/aaxxo/Desktop/PIC_HW/PWMc/MyProject.c"
void main()
{
 unsigned int z;
 unsigned int duty_cycle = 0;
 ADCON1 = 14;
 ADCON2 = 0b10010101;

 TRISC = 0;
 PR2 = 124 ;
 T2CON = 0b00000100 ;
 CCP1CON = 0b00001100 ;

 while(1)
 {
 ADCON0 = 0b0000000001;
 Go_Done_bit = 1;
 while(Go_Done_bit);
 z = ADRESH*256 + ADRESL;
 duty_cycle = (124.0 / 1023) * z;
 CCPR1L = duty_cycle;
 }
}
