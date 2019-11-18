#!/bin/bash

gmt begin gps png
R=70/135/15/55

# 准备底图所需的地形数据
gmt grdcut @earth_relief_06m -R$R -GcutTopo.grd
gmt grdgradient cutTopo.grd -Ne0.7 -A50 -GcutTopo_i.grd
gmt grd2cpt cutTopo.grd -Cglobe -T-10000/10000/200 -Z -D

# 绘制底图
gmt set FORMAT_GEO_MAP=ddd:mm:ssF
gmt basemap -R$R -JM18c -Bf5a10 -BWesN
gmt grdimage cutTopo.grd -IcutTopo_i.grd -Q
# 注：此处使用的中国国界有误，不可用于发表
gmt coast -ECN+p1p,black,- -W1/0.2p -I1/0.25p

# 绘制colorbar
gmt colorbar -DjCB+w18c/0.3c+o0/-2.5c+h -BWSEN -Bxa2000f400+l"Elevation/m" -G-8000/8000

# 绘制GPS速度场
# -Se后面三参数表示：速度值为1的矢量的长度/置信度0.95/文本的大小
# -W控制矢量以及误差椭圆的轮廓的宽度，颜色，线型
# -G矢量填充色
# -A控制矢量的属性，0.15c是矢量头的大小，+e表示在矢量尾端绘制箭头，+p0.75p矢量线段部分的宽度
awk '{print $1,$2,$3,$4,$5,$6,0}' gps_campagin.txt | gmt velo -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gblue -W0.2p,blue
awk '{print $1,$2,$3,$4,$5,$6,0}' gps_continuous.txt | gmt velo -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gred -W0.2p,red

# psvelo很难画图例，以下代码展示了如何绘制图例，但需要进行大量微调
gmt plot -Gwhite << EOF
122 14
135 14
135 21
122 21
EOF
gmt text -F+f7p+jML << EOF
123 20 20\2611 mm/yr
EOF

gmt velo -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gred -W0.2p,blue << EOF
123 18 20 0 1 1 0
EOF
gmt text -F+f6p+jML -M << EOF
> 127.5 16 0.25 2c c
Campaign Stations
2009-2014
EOF

gmt velo -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gred -W0.2p,red << EOF
123 16 20 0 1 1 0
EOF
gmt text -F+f6p+jML -M << EOF
> 127.5 18 0.25 2c c
Continuous Station
1998-2014
EOF
rm cutTopo*.grd
gmt end
