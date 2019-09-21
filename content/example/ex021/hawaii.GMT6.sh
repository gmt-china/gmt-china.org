#!/bin/bash
gmt begin hawaii png
landdata=hawaii_land_1s.grd
oceandata=hawaii_ocean_15s.grd
cpt=hawaii.cpt

# 设置光照
gmt grdgradient $landdata -Ne0.7 -A315 -G$landdata.light
gmt grdgradient $oceandata -Ne0.7 -A315 -G$oceandata.light
# 底图
gmt basemap -R-156.5/-154.5/18.5/20.5 -JM15c -Baf -BWSEN
# 地形
#  海洋部分
gmt grdimage $oceandata -I$oceandata.light -C$cpt
#  陆地部分
gmt coast -Da -Gc # 用最高精度（-Da）的海岸线划出裁剪范围（-Gc）
gmt grdimage $landdata -I$landdata.light -C$cpt # 绘制陆地部分地形
gmt coast -Q # 关闭裁剪
rm *.light
gmt end
