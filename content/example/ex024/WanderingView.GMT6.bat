REM 三维地形轨迹图(真三维版)

set R=110/125/30/45
set J=M10c
set P=135/25

gmt begin
gmt figure WanderingView png C-sFONTPATH=C:\windows\fonts
gmt set MAP_FRAME_TYPE plain

REM 1. DEM数据获取
REM earth_relief_01m.grd 可从https://mirrors.ustc.edu.cn/gmt/data/下载得到
gmt grdcut @earth_relief_01m.grd -R%R% -Gtopo.grd

REM 2. 中值滤波平滑地形，平滑直径50km
gmt grdfilter topo.grd -Fm50 -D4 -Gtopo_filter.grd

REM 3. 绘制三维地形，叠加jpg纹理。该句仅适用于GMT6，GMT5下需将jpg的RGB三波段分解再用
gmt grdview topo_filter.grd -R%R%/-500/3000 -J%J% -JZ2c -Qi600 -I -Gcloud.jpg -p%P%

REM 4.在地形上叠加行政区界线，需要先grdtrack获取线条所在高程，再用plot3d画出。
REM 政区边界在地图边缘被截断，为避免线条不连续，采用-g选项忽略经纬度跨度大于0.5°的点。
gmt grdtrack -Gtopo_filter.grd CN-border-La.dat | gmt plot3d -JZ2c -W0.5p,white -p%P% -N -gx0.5 -gy0.5

REM 5.绘制行车轨迹（116.2°E,40.3°N）至（117°E,36°N）
gmt grdtrack -Gtopo_filter.grd -E116.2/40.3/117/36+i10k | gmt plot3d -JZ2c -W2p,red -p%P%

REM 6.叠加起止点，五角星标识
echo 116.2 40.3 | gmt grdtrack -Gtopo_filter.grd | gmt plot3d -JZ2c -Sa0.5 -Gred -Wblack -p%P%
echo 116.33 35.23 | gmt grdtrack -Gtopo_filter.grd | gmt plot3d -JZ2c -Sa0.5 -Gred -Wblack -p%P%

REM 7.插两个小旗子
REM 因为GMT不支持三维符号(立方体和柱图除外)，所以这里是"伪三维"，在直角坐标系下手工确定二维符号位置
echo 5.9 3.2 | gmt plot -R0/10/0/10 -JX15c -SkLFLAG/1.5 -Gred -W0.8p
echo 3.95 2.2 | gmt plot -SkLFLAG/1.5 -Gred -W0.8p

REM 8. 写文字标注,用同色轮廓线显示加粗效果
echo 5.9 3.2 北京 | gmt text -F+f8p,STFangsong-Light--GB-EUC-H,red=0.5p,red -Gwhite@50 -D-0.3c/0.2c
echo 3.95 2.2 济宁 | gmt text -F+f8p,STFangsong-Light--GB-EUC-H,red=0.5p,red -Gwhite@50 -D-0.3c/0.2c

REM 9. 放个小车
gmt image truck.png -Dg4.5/2.5+w0.8c+jCM

gmt end
