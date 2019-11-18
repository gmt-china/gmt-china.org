#!/bin/bash
PS=plot_subduction.ps
grd=eastchina.grd
FM=FMC.txt
gmt set MAP_FRAME_WIDTH 2p
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 8p
gmt set FONT_LABEL 8p
gmt set MAP_TICK_LENGTH 0.1c

# 左图
# 绘制地形图
gmt grdcut @earth_relief_04m.grd -R122/149/30/48 -G$grd
gmt grdimage $grd -R122/149/30/48 -JM12c -Ba -BNWes -Cglobe -I -K > $PS
# 生成地震深度颜色表
echo 0 purple@30 70 purple@30 > depth.cpt
echo 70 green@30 300 green@30 >> depth.cpt
echo 300 red@30 800 red@30 >> depth.cpt
# 绘制震源球，用不同颜色代表不同地震深度
gmt psmeca $FM -R -J -Sm0.3c -Zdepth.cpt -K -O >> $PS
# 选取测线AB
echo 126 42 A > tmp
echo 146 40 B >> tmp
# 绘制测线AB
gmt psxy tmp -R -J -W1p,black,-.- -K -O >> $PS
# 标注AB
gmt pstext tmp -R -J -F+f10p -Dx0c/0.2c -K -O >> $PS 
# 绘制图例
gmt pslegend -R -J -F+gazure1@10 -DjBL+w2.2i/1.6i+l1.2 -C0.1i/0.1i -K -O >> $PS << EOF
H 10 0 Earthquake Location
L 6 0 C (2000-2010)
G 0.1c
L 8 0 C Magnitude(Mw)
G 0.1c
N 4
S 0.1i c 0.10i - black 0.2i 5
S 0.1i c 0.11i - black 0.2i 6
S 0.1i c 0.12i - black 0.2i 7
S 0.1i c 0.13i - black 0.2i 8
N 1
G 0.1c
L 8 0 C Depth(km)
G 0.1c
N 3
L 7 0 R @;purple;0-70km@;;
L 7 0 R @;green;70-300km@;;
L 7 0 R @;red;300-660km@;;
G 0.7c
B globe 0.3i 0.08i+ml -Bxa10000+l"Topo(m)" --FONT_ANNOT_PRIMARY=6p --MAP_FRAME_WIDTH=1p
EOF
# 绘制三个不同深度的震源球放到图例相应位置
gmt psmeca -R -J -Sm0.3c -Zdepth.cpt -K -O >> $PS << EOF
123 33.05 43 3.62 -0.44 -3.18 0.90 2.46 -1.35 24 0 0
126.6 33.05 171 -0.71 -0.26 0.96 0.44 0.81 -0.07 24 0 0
130.5 33.05 302 0.34 0.16 -0.50 -0.77 -4.57 -1.58 24 0 0
EOF

# 右图上
# 沿测线AB绘制地形高度
gmt psbasemap -R0/15/-4000/6000 -JX10c/3c -Bya4000+l"Elevation (m)" -BW -X14c -Y6c -K -O >> $PS
# 标注AB位置
gmt pstext -R -J -F+f10p+jBC -N -K -O >> $PS << EOF
0 7000 A
15 7000 B
EOF
# 沿测线提取地形高度
gmt project -C126/42 -E146/40 -G0.1 | gmt grdtrack -G$grd > tmp
# 将海平面以下填充为淡蓝色
gmt psxy -R -J -Wblack -Glightblue -L+y-4000 -K -O >> $PS << EOF
0 0
15 0
EOF
# 将地形填充为灰色
gmt psxy tmp -i2,3 -R -J -Wblack -Ggray -L+y-4000  -K -O >> $PS
# 标注地理位置
gmt pstext -R -J -F+f10p -K -O >> $PS << EOF
2 4000 NE China 
12 4000 NE Honshu
EOF
gmt psbasemap -R -J -B0 -Bwnes -K -O >> $PS

# 右图下
# 绘制剖面图
gmt psbasemap -R0/15/0/700 -JX10c/-4c -Bya200f100+l"Focal depth (km)" -Bxa2f1+l"Distance"+u"\260" -BWS -Y-4.5c -K -O >> $PS
gmt psbasemap -R -J -B0 -Bne -K -O >> $PS
# 在剖面图上绘制震源球,剖面宽度为600
gmt pscoupe $FM -R -J -Q -L -Sm0.3c -Aa126/42/146/40/90/300/0/700f -Zdepth.cpt -K -O >> $PS
# 绘制文字标注
echo 5 400 Benioff zone | gmt pstext -R -J -F+f12p,10,blue=~1p,gray+a30+jBL -K -O >> $PS
# 绘制图例
gmt pslegend -R -J -DjBR+w1i+l1.5+o0.05i/0.04i -F+g255+p0.25p -O >> $PS << EOF
H 8 4 Events (Mw>4.5)
S 0.1i c 0.20 purple 0.1p,black 0.25i 0-70 km
S 0.1i c 0.20 green 0.1p,black 0.25i 70-300 km
S 0.1i c 0.20 red 0.1p,black 0.25i 300-700 km
EOF

gmt psconvert $PS -Tg -A0.5c -P -Z
rm gmt.* depth.cpt tmp $grd
