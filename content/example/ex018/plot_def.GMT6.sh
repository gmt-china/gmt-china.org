#!/bin/bash
gmt begin plot_def png

# 绘制底图
gmt coast -Rg -JR9i -Bx60 -By30 -Gdarkgreen -Slightblue	-Dc -A5000

# --- 使用 psxy -Sk<name>/<size> 绘制自定义符号 -------
# 绘制火山符号
echo 60 10 | gmt plot -Skvolcano/1c -Wthinnest -Gred
# 绘制闪电符号
echo 114 37 | gmt plot -Skflash/1c -Wthinnest -Gyellow
# 绘制飓风符号
echo 127 20 | gmt plot -Skhurricane/1c -Wthinnest -Gblue
# 绘制太阳符号
echo 20 10 | gmt plot -Sksun/1c -Wthinnest -Gred
gmt end
