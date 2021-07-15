# 三维地形轨迹图(真三维版)

R=110/125/30/45
J=M10c
P=135/25
PS=WanderingView.ps

gmt set MAP_FRAME_TYPE plain

# 1. DEM数据获取及光照梯度计算
# earth_relief_01m.grd 可从https://mirrors.ustc.edu.cn/gmt/data/下载得到
gmt grdcut @earth_relief_01m.grd -R$R -Gtopo.grd
# 中值滤波平滑地形，平滑直径50km
gmt grdfilter topo.grd -Fm50 -D4 -Gtopo_filter.grd

# 2. 纹理图像分解为rgb三波段
# 此处需要GDAL支持，具体参考https://gmt-china.org/blog/gdal-ogr/
gdal_translate -of GMT cloud.jpg -b 1 cloud_r.nc
gdal_translate -of GMT cloud.jpg -b 2 cloud_g.nc
gdal_translate -of GMT cloud.jpg -b 3 cloud_b.nc

# 3. 纹理图像添加空间坐标信息
gmt grdedit cloud_r.nc -fg -R$R
gmt grdedit cloud_g.nc -fg -R$R
gmt grdedit cloud_b.nc -fg -R$R

# 4. 绘制三维地形，叠加jpg纹理
gmt grdview topo_filter.grd -R$R/-500/3000 -J$J -JZ2c -Qi600 -I -Gcloud_r.nc -Gcloud_g.nc -Gcloud_b.nc -p$P -K > $PS

# 5.在地形上叠加行政区界线，需要先grdtrack获取线条所在高程，再用psxyz画出。
# 政区边界在地图边缘被截断，为避免线条不连续，采用-g选项忽略经纬度跨度大于0.5°的点。
gmt grdtrack -Gtopo_filter.grd CN-border-La.dat | gmt psxyz -R -J -JZ2c -W0.5p,white -p$P -O -K -N -gx0.5 -gy0.5>> $PS

# 6.绘制行车轨迹（116.2°E,40.3°N）至（117°E,36°N）
gmt grdtrack -Gtopo_filter.grd -E116.2/40.3/117/36+i10k | gmt psxyz -R -J -JZ2c -W2p,red -p$P -O -K >> $PS

# 7.叠加起止点，五角星标识
echo 116.2 40.3 | gmt grdtrack -Gtopo_filter.grd | gmt psxyz -R -J -JZ2c -Sa0.5 -Gred -Wblack -p$P -K -O >> $PS
echo 116.33 35.23 | gmt grdtrack -Gtopo_filter.grd | gmt psxyz -R -J -JZ2c -Sa0.5 -Gred -Wblack -p$P -K -O >> $PS

# 8.插两个小旗子
# 因为GMT不支持三维符号(立方体和柱图除外)，所以这里是"伪三维"，在直角坐标系下手工确定二维符号位置
echo 5.9 3.2 | gmt psxy -R0/10/0/10 -JX15c -SkLFLAG/1.5 -Gred -W0.8p -O -K >> $PS
echo 3.95 2.2 | gmt psxy -R0/10/0/10 -JX15c -SkLFLAG/1.5 -Gred -W0.8p -O -K >> $PS

# 9. 写文字标注,用同色轮廓线显示加粗效果
echo 5.9 3.2 北京 | gmt pstext -R -J -F+f8p,STFangsong-Light--UniGB-UTF8-H,red=0.5p,red -Gwhite@50 -D-0.3c/0.2c -O -K >> $PS
echo 3.95 2.2 济宁 | gmt pstext -R -J -F+f8p,STFangsong-Light--UniGB-UTF8-H,red=0.5p,red -Gwhite@50 -D-0.3c/0.2c -O -K >> $PS

# 10. 放个小车
gmt psimage truck.png -R -J -Dg4.5/2.5+w0.8c+jCM -O -K >> $PS

gmt psxy -R -J -O -T >> $PS
gmt psconvert $PS -Tg -P -Au

rm cloud_*.* gmt.*
