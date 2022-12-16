#include<Arduino.h>
int A,B,C,D,Y;
void disp_7447(int D, int C, int B, int A,int Y)
{ 
  digitalWrite(13, Y);

}
void setup() {
    Serial.begin(9600); 
    pinMode(13, OUTPUT);
    pinMode(2,INPUT);
    pinMode(3,INPUT);
    pinMode(4,INPUT);
    pinMode(5,INPUT);
    
}

void loop() {  
  A = digitalRead(2);
  B = digitalRead(3) ;  
  C = digitalRead(4);  
  D = digitalRead(5); 
  Y= (A&&B)||(C&&D);
  Serial.print(Y);
  disp_7447(D,C,B,A,Y);

  
}
