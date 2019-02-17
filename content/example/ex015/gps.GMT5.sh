#!/bin/bash

PS=gps.ps
R=70/135/15/55
J=M18c

# 准备底图所需的地形数据
gmt grdcut earth_relief_06m.grd -R$R -GcutTopo.grd
gmt grdgradient cutTopo.grd -Ne0.7 -A50 -GcutTopo_i.grd
gmt grd2cpt cutTopo.grd -Cglobe -S-10000/10000/200 -Z -D > colorTopo.cpt

# 绘制底图
gmt set FORMAT_GEO_MAP=ddd:mm:ssF
gmt psbasemap -R$R -J$J -Bf5a10 -BWesN -Xc -Yc -K > $PS
gmt grdimage cutTopo.grd -IcutTopo_i.grd -R -J -CcolorTopo.cpt -Q -O -K >> $PS
# 注：此处使用的中国国界有误，不可用于发表
gmt pscoast -R -J -ECN+p1p,black,- -W1/0.2p -I1/0.25p -O -K >> $PS

# 绘制colorbar
gmt psscale -DjCB+w18c/0.3c+o0/-2.5c+h -R -J -CcolorTopo.cpt -BWSEN -Bxa2000f400+l"Elevation/m" -G-8000/8000 -O -K >> $PS

# 绘制GPS速度场
# -Se后面三参数表示：速度值为1的矢量的长度/置信度0.95/文本的大小
# -W控制矢量以及误差椭圆的轮廓的宽度，颜色，线型
# -G矢量填充色
# -A控制矢量的属性，0.15c是矢量头的大小，+e表示在矢量尾端绘制箭头，+p0.75p矢量线段部分的宽度
gawk '{print $1,$2,$3,$4,$5,$6,0}' gps_campagin.txt | gmt psvelo -J -R -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gblue -W0.2p,blue -K -O >> $PS
gawk '{print $1,$2,$3,$4,$5,$6,0}' gps_continuous.txt | gmt psvelo -J -R -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gred -W0.2p,red -K -O >> $PS

# psvelo很难画图例，以下代码展示了如何绘制图例，但需要进行大量微调
gmt psxy -J -R -Gwhite -K -O >> $PS << EOF
122 14
135 14
135 21
122 21
EOF
gmt pstext -J -R -F+f7p+jML -K -O >> $PS << EOF
123 20 20\2611 mm/yr
EOF

gmt psvelo -J -R -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gred -W0.2p,blue -K -O >> $PS << EOF
123 18 20 0 1 1 0
EOF
gmt pstext -J -R -F+f6p+jML -M -K -O >> $PS << EOF
> 127.5 16 0.25 2c c
Campaign Stations
2009-2014
EOF

gmt psvelo -J -R -Se0.05c/0.95/0 -A0.15c+e+p0.75p -Gred -W0.2p,red -K -O >> $PS << EOF
123 16 20 0 1 1 0
EOF
gmt pstext -J -R -F+f6p+jML -M -K -O >> $PS << EOF
> 127.5 18 0.25 2c c
Continuous Station
1998-2014
EOF

gmt psxy -R -J -T -O >> $PS
gmt psconvert -A -P -Tg $PS
rm gmt.* cutTopo*.grd colorTopo.cpt
