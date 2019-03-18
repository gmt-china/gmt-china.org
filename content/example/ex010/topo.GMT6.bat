set eqfile=eq.dat
set topodata="earth_relief_06m.grd"

gmt grdcut %topodata% -R70/135/15/55 -GcutTopo.grd
gmt grdgradient cutTopo.grd -Ne0.7 -A50 -GcutTopo_i.grd
gmt grd2cpt cutTopo.grd -Cglobe -T-10000/10000/200 -Z -D > colorTopo.cpt

gmt begin topo png
REM 绘制底图
gmt set FORMAT_GEO_MAP=ddd:mm:ssF
gmt basemap -R70/135/15/55 -JM7i -Bf5a10 -BWesN
gmt grdimage cutTopo.grd -IcutTopo_i.grd -CcolorTopo.cpt -Q
gmt coast -Dh -W1/0.2p -I1/0.25p -N1/0.5p

REM 绘制colorbar
gmt colorbar -DjCB+w7i/0.15i+o0/-0.5i+h -CcolorTopo.cpt -Bxa2000f400+l"Elevation/m" -G-8000/8000

REM 分震级绘制地震
gawk "{if(($3>=5.0)&&($3<6.0)) print $1,$2,$3*0.04}" %eqfile% > tmp
for /f "delims=:" %%a in ('findstr/n .* "tmp"') do set M5=%%a
gmt plot tmp -Sc -Gblue
gawk "{if(($3>=6.0)&&($3<7.0)) print $1,$2,$3*0.04}" %eqfile% > tmp
for /f "delims=:" %%a in ('findstr/n .* "tmp"') do set M6=%%a
gmt plot tmp -Sc -Gred
gawk "{if(($3>=7.0)&&($3<8.0)) print $1,$2,$3*0.06}" %eqfile% > tmp
for /f "delims=:" %%a in ('findstr/n .* "tmp"') do set M7=%%a
gmt plot tmp -Sa -Ggreen -W0.4p,black
gawk "{if($3>=8.0) print $1,$2,$3*0.06}" %eqfile% > tmp
for /f "delims=:" %%a in ('findstr/n .* "tmp"') do set M8=%%a
gmt plot tmp -Sa -Gpurple -W0.4p,black

REM 绘制图例
echo G 0.01i >legend.txt
echo H 8 4 MAGNITUDE >>legend.txt
echo C 0/0/255 >>legend.txt
echo S 0.1i c 0.20 blue 0.25p,blue 0.18i 5~5.9(%M5%) >>legend.txt
echo C 255/0/0 >>legend.txt
echo S 0.1i c 0.24 red 0.25p,red 0.18i 6~6.9(%M6%) >>legend.txt
echo C 0/255/0 >>legend.txt
echo S 0.1i a 0.42 green 0.25p,black 0.18i 7~7.9(%M7%) >>legend.txt
echo C purple >>legend.txt
echo S 0.1i a 0.48 purple 0.25p,black 0.18i 8~8.9(%M8%) >>legend.txt
gmt legend legend.txt -DjBR+w1.2i+l1.2+o0 -F+g229+p0.25p

del cutTopo*.grd colorTopo.cpt tmp legend.txt
gmt end
