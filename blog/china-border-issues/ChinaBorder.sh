#!/bin/bash
R=70/138/3/54
J=M105/35/6.5i
PS=CN-border.ps

gmt psxy -J$J -R$R -T -K > $PS

# GSHHG 数据
#gmt pscoast -J$J -R$R -Df -A10000 -Na/0.5p,gray -W1p,gray -K -O >> $PS

# DCW 数据
gmt pscoast -J$J -R$R -Df -ECN,TW+p1p,blue@50 -K -O >> $PS

# 社区数据
gmt psxy CN-border-L1.dat -J$J -R$R -W1p,red@50 -K -O >> $PS

gmt psxy -J$J -R$R -T -O >> $PS
gmt psconvert -A -P -Tg $PS -Z
