set PS=profile.ps

gmt set MAP_FRAME_TYPE=plain

gmt psbasemap -R100/110/20/30 -JM3i  -Ba5f2.5 -BWeSn -P -Y5i -K > %PS%
gmt psxy eq.dat -R -J -Sc0.1i -Gred -W0.25p -O -K >> %PS%
gmt project -C100/22 -E106/30 -G0.1 | gmt psxy -R -J -W2p,blue -O -K >> %PS%
echo (a) | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> %PS%

gmt psbasemap -R100/110/20/30 -JM3i  -Ba5f2.5 -BWeSn -X4i -O -K >> %PS%
gmt project eq.dat -C100/22 -E106/30 -Fxy -W-0.2/0.2 | gmt psxy -R -J -Sc0.1i -Gred -W0.25p -O -K >> %PS%
gmt project -C100/22 -E106/30 -G0.1 | gmt psxy -R -J -W2p,blue -O -K >> %PS%
echo (b) | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> %PS%

gmt psbasemap -R100/106/0/70 -JX3i/-1.5i  -Bxa1+lLongitude -Bya20f10+l"Depth(km)" -BWeSn --MAP_TICK_LENGTH_PRIMARY=-0.03i -X-4i -Y-2.5i -O -K >> %PS%
gmt project eq.dat -C100/22 -E106/30 -Fxz -W-0.2/0.2 | gmt psxy -R -J -Sc0.1i -Gred -W0.25p -O -K >> %PS%
echo (c) | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> %PS%

gmt psbasemap -R22/30/0/70 -JX3i/-1.5i  -Bxa2+lLatitude -Bya20f10+l"Depth(km)" -BWeSn --MAP_TICK_LENGTH_PRIMARY=-0.03i -X4i -O -K >> %PS%
gmt project eq.dat -C100/22 -E106/30 -Fyz -W-0.2/0.2 | gmt psxy -R -J -Sc0.1i -Gred -W0.25p -O -K >> %PS%
echo (d) | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> %PS%

gmt psxy -R -J -T -O >> %PS%
gmt psconvert %PS% -A -P -Tg
del gmt.*
pause