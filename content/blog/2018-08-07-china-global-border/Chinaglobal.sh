#!/bin/bash
R=45/165/-2/55
J=M104/29/15c
PS=CN-global-border.ps

gmt psxy -J$J -R$R -T -K > $PS
gmt psbasemap -R -J -Bxaf -Byaf -BWSEN -P -K -O >> $PS

# 画出中国邻区国界
gmt select china-neighbor-admin-lines.dat -Fcut-line.txt -fg | gmt psxy -J -R -W0.5p,black -K -O >> $PS
# 画出中国邻区外国界
gmt select gadm36_0.gmt -Fcut-line.txt -fg -If | gmt psxy -J -R -W0.5p,black -K -O >> $PS

gmt psxy -J$J -R$R -T -O >> $PS
gmt psconvert -A -P -Tg $PS -Z
rm gmt.* $PS
