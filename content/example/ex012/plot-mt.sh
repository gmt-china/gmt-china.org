#!/bin/bash
PS=mt.ps
J=X15c/5c
R=2017-02-10T00:00:00/2017-05-04T00:00:00/0/5

gmt set MAP_TICK_LENGTH_SECONDARY 0p
gmt set FORMAT_DATE_MAP yyyy-mm

gmt psxy mt.dat -R$R -J$J -Sb0.005c -Gblack \
    -BSW -Bsxa1O -Bpxa7Rf1d -B+l"Date" -Bya1+l@%2%M@-L@-@%% > $PS
rm gmt.*
