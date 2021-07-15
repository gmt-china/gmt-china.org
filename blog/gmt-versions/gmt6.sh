#!/bin/bash

# gmt begin 指定图片名为 gmt-map，指定图片格式为pdf、png和jpg
gmt begin gmt-map pdf,png,jpg
gmt set FONT_TITLE=24p,Helvetica-Bold

# psbasemap -> basemap
# 省略 -K -O >> xxx.ps
gmt basemap -JX10c/10c -R0/10/0/10 -Bxaf+lX+u' km' -Byaf+p'$ '+lY -BWSen+t"Simple Basemap"

# psxy -> plot
# 省略 -J -R -K -O >> xxx.ps
gmt plot -Sa1c -Gred@70 << EOF
1 1
2 2
EOF
gmt plot -W1p << EOF
> -W2p,red
3 3
3.5 4
> -W2p,blue,-
4 4
4 6
EOF
gmt plot -Sv0.4c+e -Gred << EOF
5 5 30 1
EOF

# pscoast -> coast
# 省略 -K -O >> xxx.ps
# 此处绘制了新底图，所以需要再次指定 -J -R
gmt coast -JM105/35/12.4c -R70/138/13/56 -Df -A1000 -Baf -B+t'China Map' -W1/1p -N1/1p -LjBR+c20+o1c/1c+f+w1000k+u -F+glightblue -X12c

# gmt end自动生成多种格式的图片
gmt end
