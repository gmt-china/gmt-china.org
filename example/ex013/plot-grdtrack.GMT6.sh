#!/bin/bash

gmt begin maunakea png
# ==== 预设参数 ====
gmt gmtset MAP_FRAME_TYPE=plain \
    FONT_ANNOT_PRIMARY=14p,25,black \
    FONT_LABEL=14p,25,black \
    FONT_TITLE=24p,25,black \
    MAP_GRID_PEN_PRIMARY=thick,black,-- \
    MAP_TICK_PEN_PRIMARY=thick,black \
    MAP_TICK_PEN_SECONDARY=thick,black \
    FORMAT_GEO_MAP=dddmmF

# ==== 等高线图 ====
# 主要等高线 500m 间隔(-A)，次要等高线 100m 间隔(-C)，Y 把地图上移 10 厘米，为剖面图预留空间
gmt grdcontour maunakea.grd -R155:40W/155:16W/19:41N/19:57N -JM15c -Y10c -C100 -Q100 -A500+f8p,25,darkred+o

# ==== 绘制剖面的测线 ====
# 给定测线的起点(-C)和终点(-E)的经纬度，以及步长(-G)，project 输出经纬度坐标通过管道传输给 grdtrack
# grdtrack 从地形文件中取样，把获得的信息输出到 gmt.xy 文件，gmt.xy 文件四列，依次是经度、纬度、距离和高程
gmt project -C-155.65/19.75 -E-155.28/19.9 -G0.1 -Q | gmt grdtrack -Gmaunakea.grd > gmt.xy
# psxy 使用 gmt.xy 的前两列画测线
gmt plot gmt.xy -Wthick,darkred
# 测线的起点和终点标记为 A 和 B
gmt text -F+j+f14p,25,darkred << EOF
-155.65 19.75 LT A
-155.28 19.9 LT B
EOF
gmt basemap -Ba5m -B+t"Mauna Kea Volcano"

# ==== 剖面图 ====
# 使用 gmtinfo 从地形文件中获得 -R 的适当范围
# 使用 -Y 把剖面图下移 9 厘米
gmt plot gmt.xy -i2,3 $(gmt gmtinfo gmt.xy -i2,3 -I1/100) -JX15c/6c -Wthick,darkred -Y-9c

# 先画 NE 两边的外框，再画 WS 两边的外框
gmt basemap -BNE -Bxa5f1 -Bya1000f500g1000
gmt basemap -BWS -Bxa5f1+l"Distance of A-B profile (km)" -Bya1000f500+l"Height (m)"
rm gmt.xy
gmt end
