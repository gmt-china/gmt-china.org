#!/bin/bash

gmt begin CN-Railways png

gmt set MAP_GRID_PEN_PRIMARY 0.25p,gray,2_2:1
gmt set FORMAT_GEO_MAP ddd:mm:ssF MAP_FRAME_WIDTH 3p
gmt set FONT_ANNOT_PRIMARY 7p

# 绘制中国地图
gmt coast -JM105/35/6.5i -R70/138/13/56 -G244/243/239 -S167/194/223 -B10f5g10 -Lg85/17.5+c17.5+w800k+f+u
gmt plot CN-border-La.dat -W0.5p,gray

# 两次 plot 命令使用不同的画笔属性以得到图中所示的铁轨效果
gmt plot CN-Railways.dat -W1.2p,black
gmt plot CN-Railways.dat -W0.8p,white,8_8:

# 绘制南海区域
R=105/123/3/24
J=M1.1i
gmt basemap -JM1.1i -R105/123/3/24 -B0 -X5.4i --MAP_FRAME_TYPE=plain --MAP_FRAME_PEN=1p
gmt coast -N1/0.1p -W1/0.25p -G244/243/239 -S167/194/223
gmt plot CN-border-La.dat -W0.25p

gmt end
