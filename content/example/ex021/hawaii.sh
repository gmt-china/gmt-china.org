#!/bin/bash
PS=hawaii.ps
landdata=hawaii_land_1s.grd
oceandata=hawaii_ocean_15s.grd
cpt=hawaii.cpt

# 设置光照
gmt grdgradient $landdata -Ne0.7 -A315 -G$landdata.light
gmt grdgradient $oceandata -Ne0.7 -A315 -G$oceandata.light
# 底图
gmt psbasemap -R-156.5/-154.5/18.5/20.5 -JM15c -Baf -BWSEN -K -P > $PS
# 地形
#  海洋部分
gmt grdimage $oceandata -R -J -I$oceandata.light -C$cpt -O -K >> $PS
#  陆地部分
gmt pscoast -R -J -Da -Gc -O -K >> $PS # 用最高精度（-Da）的海岸线划出裁剪范围（-Gc）
gmt grdimage $landdata -R -J -I$landdata.light -C$cpt -O -K >> $PS # 绘制陆地部分地形
gmt pscoast -O -K -Q >> $PS # 关闭裁剪
# 文件尾
gmt psxy -R -J -T -O >> $PS
# 输出
gmt psconvert $PS -A -Tg
rm $PS *.light gmt.history
