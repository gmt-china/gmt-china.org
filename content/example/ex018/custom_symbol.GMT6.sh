#!/bin/bash
gmt begin custom_symbol png

# 绘制城市符号
echo 3 5 | gmt plot -R0/10/0/10 -JM4i -B2 -Skcity/0.2i -W0.6p
echo 5 5 | gmt plot -Skcity/0.3i -Gblue
echo 7 5 | gmt plot -Skcity/0.4i -Gred -W1p
# 绘制指北针符号，第三列为旋转角度
echo 3 8 0| gmt plot -Skcompass/0.4i -W0.6p
echo 5 8 45| gmt plot -Skcompass/0.5i -Gblue
echo 7 8 90| gmt plot -Skcompass/0.6i -Gred -W1p
# 绘制三角形和五角星符号
echo 2 2 | gmt plot -Sa0.5i -Wblack -Gred
echo 4 2 | gmt plot -St0.5i -Wblack -Ggreen
# 绘制图例
gmt pslegend -F+p1p -DjBR+w1.2i+o0.2c/0.2c << EOF
S 0.2c kcompass 0.15i white 0.5p 1c compass
S 0.2c kcity 0.15i white 0.5p 1c city
S 0.2c a 0.15i red 0.5p 1c capital
S 0.2c t 0.15i green 0.5p 1c station
EOF
gmt end
