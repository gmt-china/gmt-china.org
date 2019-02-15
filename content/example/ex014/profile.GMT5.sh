#!/bin/bash
PS=seismic-profile.ps

gmt set MAP_FRAME_TYPE=plain
# === (a) 绘制区域震中分布图和选定的测线 ===
gmt psbasemap -R100/110/20/30 -JM3i  -Ba5f2.5 -BWeSn -P -Y7i -K > $PS
# 绘制所有地震位置
gmt psxy earthquakes.dat -R -J -Sc0.1i -Gred -W0.25p -O -K >> $PS
# 沿着测线每隔0.1度生成一个测点并绘制测线
gmt project -C100/22 -E106/30 -G0.1 | gmt psxy -R -J -W2p,blue -O -K >> $PS
echo '(a)' | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> $PS

# === (b) 绘制选定测线0.2度范围内地震的震中分布图 ===
gmt psbasemap -R100/110/20/30 -JM3i  -Ba5f2.5 -BWeSn -X4i -O -K >> $PS
# 筛选出测线周围0.2度范围内的地震并绘制
gmt project earthquakes.dat -C100/22 -E106/30 -Fxy -W-0.2/0.2 | gmt psxy -R -J -Sc0.1i -Gred -W0.25p -O -K >> $PS
# 沿着测线每隔0.1度生成一个测点并绘制测线
gmt project -C100/22 -E106/30 -G0.1 | gmt psxy -R -J -W2p,blue -O -K >> $PS
echo '(b)' | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> $PS

# === (c) 绘制选定测线0.2度范围内地震的经度/深度剖面图 ===
gmt psbasemap -R100/106/0/70 -JX7i/-1.0i  -Bxa1+lLongitude -Bya20f10+l"Depth(km)" -BWeSn --MAP_TICK_LENGTH_PRIMARY=-0.03i -X-4i -Y-2.0i -O -K >> $PS
# 筛选出测线周围0.2度范围内的地震并输出地震的经度和深度
gmt project earthquakes.dat -C100/22 -E106/30 -Fxz -W-0.2/0.2 | gmt psxy -R -J -Sc0.1i -Gred -W0.25p -O -K >> $PS
echo '(c)' | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> $PS

# === (d) 绘制选定测线0.2度范围内地震的纬度/深度剖面图 ===
gmt psbasemap -R22/30/0/70 -JX7i/-1.0i  -Bxa1+lLatitude -Bya20f10+l"Depth(km)" -BWeSn --MAP_TICK_LENGTH_PRIMARY=-0.03i -Y-2.0i -O -K >> $PS
# 筛选出测线周围0.2度范围内的地震并输出地震的纬度和深度
gmt project earthquakes.dat -C100/22 -E106/30 -Fyz -W-0.2/0.2 | gmt psxy -R -J -Sc0.1i -Gred -W0.25p -O -K >> $PS
echo '(d)' | gmt pstext -R -J -F+cBR+f12p,1 -Dj0.2c/0.2c -O -K >> $PS

gmt psxy -R -J -T -O >> $PS
gmt psconvert $PS -A -P -Tg
rm gmt.*
