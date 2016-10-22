#!/bin/bash
R=70/140/3/60
J=D105/35/36/42/7.5i
PS=CN-border-JD.ps

gmt set FONT_ANNOT_PRIMARY 9p FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_WIDTH 2p MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
# 设置比例尺标签为35号中文字体
gmt set FONT_LABEL 8p,35 MAP_LABEL_OFFSET 4p

gmt pscoast -J$J -R$R -G244/243/239 -S167/194/223 -B10f5g10 -Lg85/11+c11+w900k+f+u+l'比例尺' -K > $PS
gmt psxy CN-border-La.dat -J$J -R$R -W0.5p -O >> $PS
rm gmt.conf gmt.history
