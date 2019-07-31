gmt set MAP_TICK_LENGTH_PRIMARY -0.1c
set model=model.txt
set PS=model.ps
gmt psbasemap -R0/10/0/50 -JX8c/-10c -Bx1+l"Velocity (km/s)" -By10+l"Depth (km)" -BWS+t"Crust model" -K -P > %PS%
gmt psbasemap -R -J -Ben -B0 -K -O >> %PS%
rem 利用 awk 计算每一层上下边界的深度，提取该层的速度
rem 每一层上边界的深度即为前几层的厚度累加，下边界的深度为上边界的深度加该层层厚
rem Vs
gawk "BEGIN{d1=0;d2=0}{d2=d2+$1;print $2,d1;print $2,d2;d1=d2;}" %model% | gmt psxy -R -J -W1.5p,blue -K -O >> %PS%
rem Vp
gawk "BEGIN{d1=0;d2=0}{d2=d2+$1;print $3,d1;print $3,d2;d1=d2;}" %model% | gmt psxy -R -J -W1.5p,green,6_2:2 -K -O >> %PS%
echo S 0.4c - 0.5c - 1p,blue 1c @;blue;Vs@;; > legend
echo S 0.4c - 0.5c - 1p,green,6_2:0 1c @;green;Vp@;; >> legend
gmt pslegend legend -R -J -DjBL+w2c+o0.2c/0.2c -F -O >> %PS%
gmt psconvert %PS% -A -Tg -Z
del gmt* legend