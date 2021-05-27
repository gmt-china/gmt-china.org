#!/bin/bash

gmt begin CN-border-JM png
gmt set MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_FRAME_WIDTH 3p
gmt set FONT_ANNOT_PRIMARY 7p
# 设置比例尺标签为35号中文字体
gmt set FONT_LABEL 8p,35 MAP_LABEL_OFFSET 4p
# 绘制中国地图
gmt coast -JM105/35/6.5i -R70/138/13/56 -G244/243/239 -S167/194/223 -B10f5g10 -Lg85/17.5+c17.5+w800k+f+u+l'比例尺'
gmt plot CN-border-La.dat -W0.5p 

# 绘制南海区域
gmt basemap -JM1.1i -R105/123/3/24 -B0 -X5.4i --MAP_FRAME_TYPE=plain --MAP_FRAME_PEN=1p
gmt coast -N1/0.1p -W1/0.25p -G244/243/239 -S167/194/223
gmt plot CN-border-La.dat -W0.25p
echo "南海诸岛" | gmt text -F+f10p,35+cBC -D0c/0.1c -N -Gwhite
gmt end
