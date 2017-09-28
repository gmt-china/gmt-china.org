#!/bin/bash
gmt gmtset MAP_ANNOT_OBLIQUE 6
gmt gmtset MAP_TICK_LENGTH_PRIMARY 0
gmt gmtset MAP_FRAME_TYPE plain

R=78/12/149/53r
J=B105/10/25/47/15c
PS=BLOCK.ps

gmt psxy -R$R -J$J -T -K > $PS

# ============底图
gmt psbasemap -R$R -J$J -Bx10 -By5 -BNEWS -K -O >> $PS
gmt pscoast  -R$R -J$J -Ggray95 -S83/216/238 -A5000 -Dh -K -O>> $PS
gmt psxy CN-border-L1.dat -R$R -J$J -W0.2p -Gwhite -O -K >> $PS

# ============绘制板块边界
gmt psxy CN-plate-neighbor.dat  -R$R -J$J -W2.0p,2/138/210 -Sf0.5+t+l -G2/138/210 -O -K >> $PS
# ============绘制推断地块边界
gmt psxy CN-block-L1-deduced.dat -R$R -J$J -W1.0p,2/138/210,- -O -K >> $PS
# ============绘制二级地块边界
gmt psxy CN-block-L2.dat -R$R -J$J -W1.0p,orange -O -K >> $PS
# ============绘制一级地块边界
gmt psxy CN-block-L1.dat -R$R -J$J -W1.0p,2/138/210 -O -K >> $PS

# ============活动地块标注
gmt pstext -R$R -J$J -F+f10p,37 -O -K >> $PS << EOF
90 45 西域活动地块
122 46 东北亚活动地块
120 35 华北活动地块
110 27 华南活动地块
90 33 青藏活动地块
97 23 滇缅活动地块
EOF

# ============边界图例
gmt pslegend -R$R -J$J -DjTL+w1.5i+jTL+o0.2c/0.2c -F+gwhite+p0.5p  -O -K --FONT_ANNOT_PRIMARY=8p,37 >> $PS << EOF
S 0.3i f0.5+t+l 0.4i/0.3c 2/138/210 2.0p,2/138/210 0.7i 板块边界
S 0.3i - 0.50i 2/138/210 1.0p,2/138/210 0.7i  一级地块边界
S 0.3i - 0.44i - 1.0p,2/138/210,- 0.7i  推断地块边界
S 0.3i - 0.50i orange 1.0p,orange 0.7i 二级地块边界
EOF

# ============南海诸岛
gmt psbasemap -R$R -J$J -DjBR+w2c+t -K -O >> $PS
gmt pscoast -R106/121/3/24 -JM2c -Ggray95 -S83/216/238 -A5000 -Dh -K -O >> $PS
gmt psxy CN-border-L1.dat -R106/121/3/24 -JM2c -B0 -W0.2p -Gwhite -O -K >> $PS

gmt psxy -R$R -J$J -T -O >> $PS
rm gmt.*
