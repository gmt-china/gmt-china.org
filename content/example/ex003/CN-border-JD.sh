#!/bin/bash
R=70/140/3/60
J=D105/35/36/42/7.5i
PS=CN-border-JD.ps

gmt set FONT_ANNOT_PRIMARY 9p
gmt set MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_WIDTH 2p

gmt pscoast -J$J -R$R -G244/243/239 -S167/194/223 -B10f5g10 -Lg85/11+c11+w900k+f+u+l'Scale' \
    --FONT_ANNOT_PRIMARY=7p --FONT_LABEL=8p --MAP_LABEL_OFFSET=5p -K > $PS
gmt psxy CN-border-La.dat -J$J -R$R -W0.5p -O >> $PS
rm gmt.conf gmt.history
