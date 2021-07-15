#!/bin/bash
PS=gmt-map.ps

J=X10c/10c
R=0/10/0/10

# 参数名变化
gmt set FONT_TITLE=24p,Helvetica-Bold
gmt psxy -J$J -R$R -K -T > $PS

# -B选项语法不同
gmt psbasemap -J$J -R$R -Bxaf+lX+u' km' -Byaf+p'$ '+lY -BWSen+t"Simple Basemap" -K -O >> $PS

# 颜色透明功能
gmt psxy -J$J -R$R -Sa1c -Gred@70 -K -O >> $PS << EOF
1 1
2 2
EOF

# 不再需要-m选项
gmt psxy -J$J -R$R -W1p -K -O >> $PS << EOF
> -W2p,red
3 3
3.5 4
> -W2p,blue,-
4 4
4 6
EOF

# 绘制箭头语法改变
gmt psxy -J$J -R$R -Sv0.4c+e -Gred -K -O >> $PS << EOF
5 5 30 1
EOF

R=70/138/13/56
J=M105/35/12.4c

# 绘制比例尺语法改变
gmt pscoast -J$J -R$R -Df -A1000 -Baf -B+t'China Map' -W1/1p -N1/1p -LjBR+c20+o1c/1c+f+w1000k+u -F+glightblue -X12c -K -O >> $PS

gmt psxy -J$J -R$R -O -T >> $PS

# ps2raster 改为 psconvert
gmt psconvert -A -P -Tf $PS

# 临时文件的文件名变化
rm gmt.conf gmt.history
