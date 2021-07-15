#!/bin/bash
PS=gmt-map.ps

J=X10c/10c
R=0/10/0/10

# 修改GMT默认参数
gmtset HEADER_FONT Helvetica-Bold HEADER_FONT_SIZE 24p

# 写入PS文件头
psxy -J$J -R$R -K -T > $PS

# 绘制底图
psbasemap -J$J -R$R -Ba2f1:X::,km:/a2f1:=$::Y:WSen:."Simple Basemap": -K -O >> $PS

# 绘制两个五角星
psxy -J$J -R$R -Sa1c -Gred -K -O >> $PS << EOF
1 1
2 2
EOF

# 绘制线段
psxy -J$J -R$R -W1p -m -K -O >> $PS << EOF
> -W2p,red
3 3
3.5 4
> -W2p,blue,-
4 4
4 6
EOF

# 绘制箭头
psxy -J$J -R$R -Sv -Gred -K -O >> $PS << EOF
5 5 30 1
EOF

# 绘制地图及其比例尺
R=70/138/13/56
J=M105/35/12.4c
pscoast -J$J -R$R -Df -A1000 -B10/10:.'China Map': -W1/1p -N1/1p -Lf128/20/20/1000k+u -X12c -K -O >> $PS

# 写入PS文件尾
psxy -J$J -R$R -O -T >> $PS

# 将图片转换为PDF格式
ps2raster -A -P -Tf $PS

# 清理当前目录下的临时文件
rm .gmtdefaults4 .gmtcommands4
