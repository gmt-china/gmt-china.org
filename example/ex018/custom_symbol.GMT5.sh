#!/bin/bash
ps=custom_symbol.ps

# 绘制城市符号
echo 3 5 | gmt psxy -R0/10/0/10 -JM4i -B2 -Skcity/0.2i -W0.6p -K > $ps
echo 5 5 | gmt psxy -R -J -Skcity/0.3i -Gblue -K -O >> $ps
echo 7 5 | gmt psxy -R -J -Skcity/0.4i -Gred -W1p -K -O >> $ps
# 绘制指北针符号，第三列为旋转角度
echo 3 8 0| gmt psxy -R -J -Skcompass/0.4i -W0.6p -K -O >> $ps
echo 5 8 45| gmt psxy -R -J -Skcompass/0.5i -Gblue -K -O >> $ps
echo 7 8 90| gmt psxy -R -J -Skcompass/0.6i -Gred -W1p -K -O >> $ps
# 绘制三角形和五角星符号
echo 2 2 | gmt psxy -R -J -Sa0.5i -Wblack -Gred -K -O >> $ps
echo 4 2 | gmt psxy -R -J -St0.5i -Wblack -Ggreen -K -O >> $ps
# 绘制图例
gmt pslegend -R -J -F+p1p -DjBR+w1.2i+o0.2c/0.2c -O >> $ps << EOF
S 0.2c kcompass 0.15i white 0.5p 1c compass
S 0.2c kcity 0.15i white 0.5p 1c city
S 0.2c a 0.15i red 0.5p 1c capital
S 0.2c t 0.15i green 0.5p 1c station
EOF
gmt psconvert -Tg -A -P $ps -Z
rm -rf gmt.*
