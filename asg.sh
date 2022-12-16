#!/bin/bash

cd /home/student/Desktop/1/ide/codes
pio run
pio run -t upload



cd /home/student/Desktop/1/ide/docs
pdflatex xor.tex
xdg-open xor.pdf
 
#cd /home/shashi/Avr-gcc
#make clean
#make





