#!/bin/bash
ps=plot_def.ps

# 绘制底图
gmt pscoast -Rg -JR9i -Bx60 -By30  -Gdarkgreen -Slightblue \
	-Dc -A5000 -K > $ps

# --- 使用 psxy -Sk<name>/<size> 绘制自定义符号 -------
# 绘制火山符号
echo 60 10 | gmt psxy -R -J -Skvolcano/1c -Wthinnest -Gred -K -O >> $ps
# 绘制闪电符号
echo 114 37 | gmt psxy -R -J -Skflash/1c -Wthinnest -Gyellow -K -O >> $ps
# 绘制飓风符号
echo 127 20 | gmt psxy -R -J -Skhurricane/1c -Wthinnest -Gblue -K -O >> $ps
# 绘制太阳符号
echo 20 10 | gmt psxy -R -J -Sksun/1c -Wthinnest -Gred -O >> $ps
gmt psconvert -Tg -A -P $ps -Z
rm -rf gmt.*
