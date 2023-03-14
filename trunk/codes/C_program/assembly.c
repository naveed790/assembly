#include <avr/io.h>

int main(void) {

    DDRD = 0b11100011;
    PORTD = 0b11111111; // activating pull-ups
    DDRB = 0b00000001; // declaring 8th pin as output

    while (1) {
        // Reading the data from pins 2, 3, 4, 5
        int D = (PIND & 0b00000100) >> 2;
        int C = (PIND & 0b00001000) >> 3;
        int B = (PIND & 0b00010000) >> 4;
        int A = (PIND & 0b00100000) >> 5;

        // T1 = AB
        int T1 = A & B;
        // T3 = CD
        int T3 = C & D;
        // T4 = AB + CD
        int T4 = T1 | T3;
        // Output T4 to PORTB
        PORTB = T4;
    }
    return 0;
}
