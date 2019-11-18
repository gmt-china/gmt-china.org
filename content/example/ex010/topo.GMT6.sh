#!/bin/bash

R=70/135/15/55
eqfile=eq.dat
topodata=@earth_relief_06m

gmt begin topo png
gmt grdcut $topodata -R$R -GcutTopo.grd
gmt grdgradient cutTopo.grd -Ne0.7 -A50 -GcutTopo_i.grd
gmt grd2cpt cutTopo.grd -Cglobe -T-10000/10000/200 -Z -D
#绘制底图
gmt set FORMAT_GEO_MAP=ddd:mm:ssF
gmt basemap -R70/135/15/55 -JM7i -Ba10f5 -BWesN
gmt grdimage cutTopo.grd -IcutTopo_i.grd -Q
gmt coast -Dh -W1/0.2p -I1/0.25p -N1/0.5p

#绘制colorbar
gmt colorbar -DjCB+w7i/0.15i+o0/-0.5i+h -Bxa2000f400+l"Elevation/m" -G-8000/8000

#分震级绘制地震
awk '$3>=5.0 && $3<6.0 {print $1,$2,$3*0.04}' $eqfile | gmt plot -Sc -Gblue
M5=`awk '$3>=5.0 && $3<6.0' $eqfile | wc -l | cut -d" " -f1`
awk '$3>=6.0 && $3<7.0 {print $1,$2,$3*0.04}' $eqfile | gmt plot -Sc -Gred
M6=`awk '$3>=6.0 && $3<7.0' $eqfile | wc -l | cut -d" " -f1`
awk '$3>=7.0 && $3<8.0 {print $1,$2,$3*0.04}' $eqfile | gmt plot -Sc -Ggreen
M7=`awk '$3>=7.0 && $3<8.0' $eqfile | wc -l | cut -d" " -f1`
awk '$3>=8.0 {print $1,$2,$3*0.06}' $eqfile | gmt plot -Sa -Gpurple -W0.4p,black
M8=`awk '$3>=8.0' $eqfile | wc -l | cut -d" " -f1`

#绘制图例
gmt legend -DjBR+w1.2i+l1.2+o0 -F+g229+p0.25p <<EOF
G 0.01i
H 8 4 MAGNITUDE
C blue
S 0.1i c 0.20 blue 0.25p,blue 0.18i 5~5.9($M5)
C red
S 0.1i c 0.24 red 0.25p,red 0.18i 6~6.9($M6)
C green
S 0.1i a 0.42 green 0.25p,black 0.18i 7~7.9($M7)
C purple
S 0.1i a 0.48 purple 0.25p,black 0.18i 8~8.9($M8)
EOF

rm cutTopo*.grd
gmt end