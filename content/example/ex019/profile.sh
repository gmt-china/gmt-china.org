#!/bin/bash
PS=profile.ps
R=0/1300/0/700
J=X5i/-2i

eqfile=epicenter.loc

gmt set MAP_FRAME_TYPE=Plain
gmt set FONT_TITLE=5p MAP_TITLE_OFFSET=8p MAP_TICK_LENGTH_PRIMARY=3p
gmt set MAP_ANNOT_OFFSET_PRIMARY=2p
gmt set FONT_ANNOT_PRIMARY=12p,Times-Roman FONT_LABEL=12p
gmt set MAP_FRAME_PEN=0.4p
gmt set MAP_GRID_PEN_PRIMARY 0.2p,gray,--


# 绘制底图
gmt gmtset FORMAT_GEO_MAP=ddd:mm:ssF
gmt psbasemap -R$R -J$J -Bya200f100+l"Focal depth (km)" -Bxa300f100+l"Distance (km)" -BWeS -Xc -Yc -K > $PS
gmt psbasemap -R -J -B0 -Bn -O -K >> $PS

# 分震级绘制地震
awk '$4>=0 && $4<70 {print $5,$4,$3*0.03}' $eqfile | gmt psxy -R -J -Sc -Gpurple -W0.1p,black -O -K >> $PS
awk '$4>=70 && $4<300 {print $5,$4,$3*0.04}' $eqfile | gmt psxy -R -J -Sc -Ggreen -W0.1p,black -K -O >> $PS
awk '$4>=300 && $4<1000 {print $5,$4,$3*0.05}' $eqfile | gmt psxy -R -J -Sc -Gred -W0.1p,black -O -K >> $PS

gmt pscoupe -R -J -B -Q -L -Sc0.4 -Aa128/11/130/11/1/60/0/100f -Ggrey -O -K << EOF >> $PS
# lon   lat  dep str dip rake str dip rake m ex nx ny
128.5 10.5  40  0   45  90 180   45  90  1 24  0  0 400km
EOF
# 绘制图例
gmt pslegend -R -J -DjBR+w1.2i+l1.2+o0.05i/0.04i -F+g255+p0.25p -O -K >> $PS <<EOF
G 0.01i
H 12 4 Event (M>6)
S 0.1i c 0.20 purple 0.1p,black 0.25i 0~70 (km)
S 0.1i c 0.20 green 0.1p,black 0.25i 70~300 (km)
S 0.1i c 0.20 red 0.1p,black 0.25i >300 (km)
EOF

# 绘制海拔剖面
elevR=0/1300/-4000/2000
elevJ=X5i/1i
gmt psbasemap -R$elevR -J$elevJ -Bya2000f1000+l"Elevation (km)" -Bx0 -BW -Y2i -O -K >> $PS
# 绘制块体分界线 
gmt psxy elev.csv -W0.5p,black -J -Ggray -R -O -K >> $PS
gmt psxy -W1p,black,- -J -R -O -K >> $PS <<EOF
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
echo 0 3000 "A" | gmt pstext -B -N -J -R -F+f16p,blue -O -K >> $PS
echo 1300 3000 "B" | gmt pstext -B -N -J -R -F+f16p,blue -O -K>> $PS
echo 600 1800 "SOJP" | gmt pstext -B -N -J -R -F+f16p,blue -O -K >> $PS
echo 1050 1800 "JP" | gmt pstext -B -N -J -R -F+f16p,blue -O -K >> $PS
echo 1200 1800 "WP" | gmt pstext -B -N -J -R -F+f16p,blue -O >> $PS

gmt psconvert $PS -A -Tg -E360 -P -Z
rm gmt.*
