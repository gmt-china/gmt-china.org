#!/bin/bash
PS=map.ps
R=g
# 假定台站位于 105/30 处
stlo=105
stla=30
max_distance=90
width=10c  # 图片宽度
# 使用-JE投影，其后面的四个参数分别是:
#   中心经度/中心纬度/最大震中距/图片宽度
J=E$stlo/$stla/$max_distance/$width

# 绘制底图
gmt pscoast -J$J -R$R -A10000 -Ggrey -K > $PS

# 利用 psbasemap 绘制图中的径向线
gmt set FORMAT_GEO_MAP=+D
gmt psbasemap -R0/360/0/90 -JPa$width -Bxa60g60 -Bya180 -K -O >> $PS

# 绘制台站位置（红色三角形）
echo $stlo $stla | gmt psxy -J$J -R$R -St0.15i -Gred -K -O >> $PS
# 绘制地震震源位置
gmt psxy -J$J -R$R -Sc0.05i -Gblue -K -O >> $PS << EOF
145 30
160 40
60 40
80 -10
EOF

# 绘制30和60度等震中距线
echo $stlo $stla 6672 | gmt psxy -J$J -R$R -SE- -K -O -W1p,red >> $PS
echo $stlo $stla 13344 | gmt psxy -J$J -R$R -SE- -K -O -W1p,red >> $PS

# 在30, 60, 90处添加文字
# !!! 输入文件的第二列0, -30, -60 需要根据台站的实际纬度进行微调 !!!
gmt pstext -J$J -R$R -D0c/0.3c -K -O >> $PS << EOF
$stlo 0 30\232
$stlo -30 60\232
$stlo -60 90\232
EOF

gmt psxy -J$J -R$R -T -O >> $PS
gmt psconvert -A -P -Tg $PS
rm gmt.*
