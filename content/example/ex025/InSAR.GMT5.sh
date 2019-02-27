#!/bin/bash

#定义图件基本参数
PS=InSAR.ps
R=101/103.7/22/25
J=M10c
B1=a1
B2=SWen

# DEM数据获取及光照梯度计算
# earth_relief_01m.grd 可从https://mirrors.ustc.edu.cn/gmt/data/下载得到
gmt grdcut earth_relief_01m.grd -R$R -Gtopo.grd
gmt grdgradient topo.grd -Ne0.8 -A100 -Gtopo.grad
# 制作灰色色标文件g.cpt
gmt makecpt -Cgray -T-7000/7000/1000 -Z >g.cpt

# 开始绘图
gmt psxy -R$R -J$J -K -T -P > $PS
# 绘制灰色地形图，使用的色标文件为上面生产的g.cpt
gmt grdimage topo.grd -Itopo.grad -R$R -J$J -B$B1 -B$B2 -Cg.cpt -E100 -K -O >> $PS
# 把InSAR获取的点数据yn.xyz转化为网格数据yn.grd,并进一步获得对应的色标文件my.cpt
gmt xyz2grd yn.xyz -Gyn.grd -I0.4m -R

# 自定义一个模板色标文件 HSV值具体含义详见：
# https://docs.gmt-china.org/latest/basis/color/#hsv
cat << EOF > template.cpt
-50  100-1-1  -30  100-1-1
-30  90-1-1   -10  90-1-1
-10  60-1-1    10  60-1-1
 10  30-1-1    30 30-1-1
 30  20-1-1    50 20-1-1
EOF

# 根据模板色标文件template.cpt生成本图使用的色标文件my.cpt
gmt grd2cpt yn.grd -Ctemplate.cpt > my.cpt
# 绘制InSAR形变数据转化的网格文件（-Q将值为NaN的节点处设置为透明色）
gmt grdimage yn.grd -J$J -Cmy.cpt -Q -K -O >> $PS
#在左下角的色标后面插入一个白色背景框
gmt psbasemap -R$R -J$J -K -O -DjBL+w2c/4c -F+gwhite >> $PS
# 绘制色标尺
gmt psscale -R$R -J$J -DjBL+w3c/0.5c+o0.3c/0.3c -Cmy.cpt -Bx20 -By+l'mm/yr' -K -O >> $PS

#结束绘图并转换为PNG图片
gmt psxy -R$R -J$J -O -T >> $PS
gmt psconvert $PS -A -Tg

rm *.cpt *.grd *.grad gmt.*
