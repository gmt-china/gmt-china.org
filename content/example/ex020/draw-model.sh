gmt set MAP_TICK_LENGTH_PRIMARY -0.1c
model=model.txt
PS=model.ps
gmt psbasemap -R0/10/0/50 -JX8c/-10c -Bx1+l"velocity (km/s)" -By10+l"depth (km)" -BWS -K -P > $PS
gmt psbasemap -R -J -Ben -B0 -K -O >> $PS
# Vs
awk 'BEGIN{d1=0;d2=0}{d2=d2+$1;print $2,d1;print $2,d2;d1=d2;}' $model | \
gmt psxy -R -J -W1.5p,blue -K -O >> $PS
# Vp
awk 'BEGIN{d1=0;d2=0}{d2=d2+$1;print $3,d1;print $3,d2;d1=d2;}' $model | \
gmt psxy -R -J -W1.5p,green,6_2:2 -K -O >> $PS
gmt pstext -R -J -O >> $PS <<EOF
1.5 45  Model
2.5 10  @;blue;Vs@;;
  5 10  @;green;Vp@;;
EOF
gmt psconvert $PS -A -Tg -Z
rm gmt*
