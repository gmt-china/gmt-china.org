#!/bin/bash

PS=draw-inset-map.ps
R=139.2E/140.5E/34.8N/36N
gmt pscoast -R$R -JM18c -Baf -BWSne -Df -W2p -A1000 -Glightbrown -Sazure1 --FORMAT_GEO_MAP=dddF -P -K > $PS
gmt psbasemap -R -J -DjTL+w6c/7c+o0.2c/0.2c+stmp -F+gwhite+p1p+c0.1c+s -O -K >> $PS

read x0 y0 w h < tmp
# x0 和 y0 是图中图左下角的坐标
# w 是图中图的宽度
# h 是图中图的高度
gmt pscoast -R129E/146E/30N/46N -JM$w -Df -W1p -A1000 -Glightbrown -Sazure1 -K -O -X$x0 -Y$y0 >> $PS
gmt psbasemap -R -J -D$R -F+p2p,blue -O >> $PS
gmt psconvert $PS -A -Tg
rm tmp gmt.history $PS
