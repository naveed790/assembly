#include <Arduino.h>
int x,y;
int A,B,C,D;
void disp_7447(int D,int C,int B,int A)
{  
	digitalWrite(2,A);
}
void setup()
{
    pinMode(2,OUTPUT);
    pinMode(5,INPUT);
    pinMode(6,INPUT);
}    
void loop()
{
	x=digitalRead(5);
	y=digitalRead(6);
	A=(x&&!y)||(!x&&y);
	disp_7447(D,C,B,A);
}
	
