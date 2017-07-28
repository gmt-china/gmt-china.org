#!/bin/bash
PS=mt.ps
J=X8c/2.4c
R=2017-02-10T00:00:00/2017-05-04T00:00:00/0/5

gmt gmtset MAP_TICK_LENGTH_PRIMARY -2p
gmt gmtset MAP_TICK_LENGTH_SECONDARY -2p
gmt gmtset MAP_TICK_PEN_PRIMARY 0.3p
gmt gmtset MAP_FRAME_PEN 0.5p
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset FONT_ANNOT_PRIMARY 6p,Times-Roman
gmt gmtset FONT_ANNOT_SECONDARY 6p,Times-Roman
gmt gmtset TIME_EPOCH 2017-02-14T00:00:00
gmt gmtset FORMAT_DATE_MAP yyyy-mm
gmt gmtset MAP_ANNOT_OFFSET_PRIMARY 4p
gmt gmtset MAP_ANNOT_OFFSET_SECONDARY 2p
gmt gmtset MAP_LABEL_OFFSET=2p

gmt psbasemap -R$R -J$J -Bx+l"Date" -BS -Bs1O -Bpa7Rf1d --FONT_LABEL=6p -K -P > $PS
gmt psxy mt.dat -R$R -J$J -Bya1+lM@-L -BW -Sb0.005c -Gblack --FONT_LABEL=6p,Times-Italic -O >> $PS
gmt psconvert -A -P -Tg $PS
rm gmt.*
