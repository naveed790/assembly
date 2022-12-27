.include "m328Pdef.inc"

ldi r16,0b11100011
out DDRD,r16
ldi r17,0b11111111  ; activating pull ups
out PORTD,r17
ldi r16,0b00000001
out DDRB,r16            ;declaring 8th pin as output

loop:                   ;loop for reading the input from pins 2,3,4,5 continously

  in r17,PIND             ;reading the data from pins 2,3,4,5

;Taking D
  ldi r24,0b00000100
  mov r18,r17
  and r18,r24
  ldi r25,0b00000010
  loopd: 
    lsr r18
    dec r25
    brne    loopd
  .DEF D = r18

;Taking C
  mov r19,r17
  ldi r24,0b00001000
  and r19,r24
  ldi r25,0b00000011
  loopc:  
    lsr r19
    dec r25 
    brne    loopc
  .DEF C = r19

;Taking B
  ldi r24,0b00010000
  mov r20,r17
  and r20,r24
  ldi r25,0b00000100
  loopb:  
    lsr r20
    dec r25
    brne    loopb
  .DEF B = r20

;Taking A
  ldi r24,0b00100000
  mov r21,r17
  and r21,r24
  ldi r25,0b00000101
  loopa:  
    lsr r21
    dec r25
    brne    loopa
  .DEF A = r21

  ldi r22,0x00
  ldi r23,0x00
  ldi r24,0x00
  ldi r25,0x00
  .DEF T1 = r22
  .DEF T2 = r23
  .DEF T3 = r24
  .DEF T4= r25
  mov T1,A
  mov T2,B        ;T1 =AB
  and T1,T2
  mov T3,C
  mov T4,D
  and T3,T4       ;T3=CD
  or T1,T3        ;T4=AB+CD
  out PORTB,T1
  rjmp loop

start:
  rjmp start