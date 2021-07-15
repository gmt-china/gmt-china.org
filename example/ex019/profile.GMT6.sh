#!/bin/bash

gmt begin profile png

R=0/11/0/700
J=X5i/-2i

eqfile=event.loc.info
nearloc=near.loc
beachballs=beachballs.info
elev=elev.csv

gmt set MAP_FRAME_TYPE plain MAP_FRAME_PEN 0.4p
gmt set FONT_TITLE 5p MAP_TITLE_OFFSET 8p
gmt set MAP_ANNOT_OFFSET_PRIMARY 2p FONT_ANNOT_PRIMARY 12p,Times-Roman
gmt set MAP_TICK_LENGTH_PRIMARY 3p FONT_LABEL 12p MAP_GRID_PEN_PRIMARY 0.2p,gray,--
gmt set FORMAT_GEO_MAP=ddd:mm:ssF

# 绘制底图
gmt basemap -R0/11/0/700 -JX5i/-2i -BWS -Bya200f100+l"Focal depth (km)" -Bxa2f1+l"Distance"+u"\260"

# 测线： (130.5,43.5)为起点，(142.5,36.5) 为终点
# 筛选出距离测线+-1度以内的地震事件
gmt project $eqfile -C130.5/43.5 -E142.5/36.5 -Fxyzpq -W-1/1 > $nearloc
# 分深度绘制地震
awk '$4>=0 && $4<70 {print $5,$4,$3*0.03}' $nearloc | gmt plot -Sc -Gpurple -W0.1p,black
awk '$4>=70 && $4<300 {print $5,$4,$3*0.04}' $nearloc | gmt plot -Sc -Ggreen -W0.1p,black
awk '$4>=300 && $4<1000 {print $5,$4,$3*0.05}' $nearloc | gmt plot -Sc -Gred -W0.1p,black

# 在剖面上绘制部分事件的震源机制
gmt coupe $beachballs -Q -L -Sd0.3 -Aa130.5/43.5/142.5/36.5/90/100/0/700f -Gblack

# 绘制图例
gmt legend -DjBR+w1.2i+l1.2+o0.05i/0.04i -F+g255+p1p << EOF
G 0.01i
H 12 4 Event (M>4)
S 0.1i c 0.20 purple 0.1p,black 0.25i 0~70 km
S 0.1i c 0.20 green 0.1p,black 0.25i 70~300 km
S 0.1i c 0.20 red 0.1p,black 0.25i >300 km
EOF

# 绘制海拔剖面
gmt basemap -R0/1300/-4000/2000 -JX5i/1i -Bya2000f1000+l"Elevation (m)" -BW -Y2i
# 绘制剖面海拔
gmt plot $elev -W0.5p,black -Ggray
# 绘制块体分界线
gmt plot -W1p,black,- << EOF
>
102.7 -4000
102.7  2000
>
939 -4000
939 2000
>
1113 -4000
1113 2000
>
1300 -4000
1300 2000
EOF
gmt text -N -F+f16p,blue << EOF
0 3000 A
1300 3000 B
600 1800 SOJP
1050 1800 JP
1200 1800 WP
EOF
gmt end
rm $nearloc