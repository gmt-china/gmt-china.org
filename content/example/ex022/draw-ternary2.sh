#!/bin/bash

R1=0/100/0/100/0/100
J1=X8c
R2=0/100/0/86.60254 # 纵轴y=x*√3/2=100*√3/2
J2=X8c/6.9282c        # 纵轴y=x*√3/2=8*√3/2
data=ternary.txt        # 数据文件
Th=1; Sc=2; La=3; Zr=4; Co=5  # 数据所在表格列号
color=6  # 颜色所在的列号
symbol=7 # 符号所在的列号
PS=ternary2.ps
# cpt
cat > color.cpt << EOF
1 red  2 red
2 blue 3 blue
3 green 4 green
4 brown 5 brown
EOF

gmt set PS_CHAR_ENCODING Standard+
gmt set PS_PAGE_ORIENTATION landscape
gmt set FONT_LABEL = 10p,4 # 坐标轴标签
gmt set MAP_FRAME_PEN = 0.6p # 图框宽度
gmt set MAP_LABEL_OFFSET = 2p # Th,Sc,La离顶点的距离
gmt psxy Th-Sc-La.txt -R$R2 -J$J2 -W0.4p,black,- -X1c -K > $PS
gmt pstext -R$R2 -J$J2 -F+f8p,4 -K -O >> $PS  << EOF
70 30 A
55 40 B
38 50 C;D
EOF
# 数据前3列为归一化后的三个端元值，数据顺序以三角图的左下方端元为起始点，逆时针旋转，即左下-右下-上；# 第4列为颜色值，第5列为相应的符号; 命令中-S仅给出符号大小
awk -v Th=$Th -v Sc=$Sc -v La=$La -v color=$color -v symbol=$symbol -F"[, ]+" 'NR>=2{print $Th*100/($Th+$Sc+$La), $Sc*100/($Th+$Sc+$La), $La*100/($Th+$Sc+$La), $color, $symbol}' $data | gmt psternary -R$R1 -J$J1 -Bf10 -S0.2c -Ccolor.cpt -LTh/Sc/La -O >> $PS
gmt psconvert $PS -A -Tg
rm $PS color.cpt gmt.*
