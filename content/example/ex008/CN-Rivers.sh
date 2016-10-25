#!/bin/bash
R=70/138/13/56
J=M105/35/6.5i
PS=CN-Rivers.ps

gmt set MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_FRAME_WIDTH 3p
gmt set FONT_ANNOT_PRIMARY 7p

# 绘制中国地图
gmt pscoast -J$J -R$R -G244/243/239 -S167/194/223 -B10f5g10 -Lg85/17.5+c17.5+w800k+f+u -K > $PS
gmt psxy CN-border-La.dat -J$J -R$R -W0.5p -O -K >> $PS

# 绘制一级河流数据
gmt psxy CN-Rivers.dat -J$J -R$R -W1p,blue -K -O >> $PS

# 绘制南海区域
R=105/123/3/24
J=M1.1i
gmt psbasemap -J$J -R$R -B0 -X5.4i --MAP_FRAME_TYPE=plain --MAP_FRAME_PEN=1p -K -O >> $PS
gmt pscoast -J$J -R$R -N1/0.1p -W1/0.25p -G244/243/239 -S167/194/223 -K -O >> $PS
gmt psxy CN-border-La.dat -J$J -R$R -W0.25p -O -K >> $PS

gmt psxy -J$J -R$R -T -O >> $PS
rm gmt.conf gmt.history
