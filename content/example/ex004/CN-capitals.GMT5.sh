#!/bin/bash
R=70/138/13/56
J=M105/35/6.5i
PS=CN-capitals.ps

gmt set MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_FRAME_WIDTH 3p
gmt set FONT_ANNOT_PRIMARY 7p
# 设置比例尺标签为35号中文字体
gmt set FONT_LABEL 8p,35 MAP_LABEL_OFFSET 4p

# 绘制中国地图
gmt pscoast -J$J -R$R -G244/243/239 -S167/194/223 -B10f5g10  -Lg85/17.5+c17.5+w800k+f+u+l'比例尺' -K > $PS
gmt psxy CN-border-La.dat -J$J -R$R -W0.4p,gray50 -K -O >> $PS

# 绘制省会位置
## 此处使用两次 psxy 命令以实现图中所示的空心圆叠加实心圆的效果
gmt psxy CN-capitals.dat -J$J -R$R -Sc0.08c -Gblack -K -O >> $PS
gmt psxy CN-capitals.dat -J$J -R$R -Sc0.15c -W0.2p,black -K -O >> $PS
# 绘制省会名称
gmt pstext CN-capitals.dat -J$J -R$R -F+f7p,35+j -Dj0.15c/0.15c -K -O >> $PS
# 标记北京所在位置
echo 116.46 39.92 | gmt psxy -J$J -R$R -Gred -Sa0.4c -K -O >> $PS

# 绘制南海区域
R=105/123/3/24
J=M1.1i
gmt psbasemap -J$J -R$R -B0 -X5.4i --MAP_FRAME_TYPE=plain --MAP_FRAME_PEN=1p -K -O >> $PS
gmt pscoast -J$J -R$R -N1/0.1p -W1/0.25p -G244/243/239 -S167/194/223 -K -O >> $PS
gmt psxy CN-border-La.dat -J$J -R$R -W0.25p -O -K >> $PS
echo "南海诸岛" | gmt pstext -J$J -R$R -F+f10p,35+cBC -D0c/0.1c -N -Gwhite -O >> $PS

rm gmt.conf gmt.history
