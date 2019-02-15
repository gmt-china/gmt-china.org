#!/bin/bash
R=0/100/0/100/0/100
J=X8c
PS=ternary.ps
data=ternary.csv         # 数据文件
Th=1; Sc=2; La=3; Zr=4; Co=5  # 数据所在表格列号
color=6  # 颜色所在的列号
symbol=7 # 符号所在的列号

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
gmt set MAP_FRAME_PEN = 0.3p # 图框宽度
gmt set MAP_LABEL_OFFSET = 2p # Th,Sc,La离顶点的距离
# 三角图解判断曲线引自 Mukul R. Bhatia and Keith A.W. Crook，1986, Contrib Mineral Petrol (1986)
################################## Th-Sc-La图解 #####################################
# 线段标注数为1，内容为空
gmt psternary Th-Sc-La.txt -J$J -R$R -Bf -Sqn1:+l"" -W0.4p,black,- -X1c -K -P > $PS
gmt psternary -J$J -R$R -Bf -Sl0.2c+f8p,4+t"A" -Gblack -K -O >> $PS << EOF
10 60 30 A
EOF
gmt psternary -J$J -R$R -Bf -Sl0.2c+f8p,4+t"B" -Gblack -K -O >> $PS << EOF
20 30 50 B
EOF
gmt psternary -J$J -R$R -Bf -Sl0.2c+f8p,4+t"C;D" -Gblack -K -O >> $PS << EOF
30 10 60 C;D
EOF
# 原数据作归一化；三角图解端元顺序：下左-下右-上
# 数据前3列为三个端元值，第4列为颜色值，第5列为相应的符号; 命令中-S仅给出符号大小
awk -v Th=$Th -v Sc=$Sc -v La=$La -v color=$color -v symbol=$symbol -F"[, ]+" 'NR>=2 {print \
    $Th*100/($Th+$Sc+$La), $Sc*100/($Th+$Sc+$La), $La*100/($Th+$Sc+$La), $color, $symbol}' \
	$data | gmt psternary -J$J -R$R -Bf -S0.2c -Ccolor.cpt -LTh/Sc/La -O >> $PS
gmt psconvert -A -P -Tg $PS
rm color.cpt gmt.*
