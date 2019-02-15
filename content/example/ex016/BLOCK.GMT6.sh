#!/bin/bash

gmt begin BLOCK png
gmt gmtset MAP_ANNOT_OBLIQUE 6
gmt gmtset MAP_TICK_LENGTH_PRIMARY 0
gmt gmtset MAP_FRAME_TYPE plain

# ============底图
gmt basemap -R78/12/149/53+r -JB105/10/25/47/15 -Bx10 -By5 -BNEWS
gmt coast -Ggray95 -S83/216/238 -A5000 -Dh
gmt plot CN-border-L1.dat -W0.2p -Gwhite

# ============绘制板块边界
gmt plot CN-plate-neighbor.dat -W2.0p,2/138/210 -Sf0.5+t+l -G2/138/210
# ============绘制推断地块边界
gmt plot CN-block-L1-deduced.dat -W1.0p,2/138/210,-
# ============绘制二级地块边界
gmt plot CN-block-L2.dat -W1.0p,orange
# ============绘制一级地块边界
gmt plot CN-block-L1.dat -W1.0p,2/138/210

# ============活动地块标注
gmt text -F+f10p,37 << EOF
90 45 西域活动地块
122 46 东北亚活动地块
120 35 华北活动地块
110 27 华南活动地块
90 33 青藏活动地块
97 23 滇缅活动地块
EOF

# ============边界图例
gmt legend -DjTL+w1.5i+jTL+o0.2c/0.2c -F+gwhite+p0.5p --FONT_ANNOT_PRIMARY=8p,37 << EOF
S 0.3i f0.5+t+l 0.4i/0.3c 2/138/210 2.0p,2/138/210 0.7i 板块边界
S 0.3i - 0.50i 2/138/210 1.0p,2/138/210 0.7i  一级地块边界
S 0.3i - 0.44i - 1.0p,2/138/210,- 0.7i  推断地块边界
S 0.3i - 0.50i orange 1.0p,orange 0.7i 二级地块边界
EOF

# ============南海诸岛
gmt basemap -DjBR+w2c+t
gmt coast -R106/121/3/24 -JM2c -Ggray95 -S83/216/238 -A5000 -Dh 
gmt plot CN-border-L1.dat -R106/121/3/24 -JM2c -B0 -W0.2p -Gwhite
gmt end
