set FM=FMC.txt
set GRD=eastchina.grd
gmt begin plot_subduction png A0.5c

    gmt set MAP_FRAME_WIDTH 2p
    gmt set MAP_FRAME_PEN 0.5p
    gmt set FONT_ANNOT_PRIMARY 8p
    gmt set FONT_LABEL 8p
    gmt set MAP_TICK_LENGTH 0.1c

    rem 左图
    rem 绘制地形图
    gmt grdcut @earth_relief_04m.grd -R122/149/30/48 -G%GRD%
    gmt grdimage %GRD% -R122/149/30/48 -JM12c -Ba -BNWes -Cglobe -I
    rem 生成地震深度颜色表
    echo 0 purple@30 70 purple@30 > depth.cpt
    echo 70 green@30 300 green@30 >> depth.cpt
    echo 300 red@30 800 red@30 >> depth.cpt
    rem 绘制震源球，用不同颜色代表不同地震深度
    gmt meca %FM% -Sm0.3c -Zdepth.cpt
    rem 选取测线AB
    echo 126 42 A > tmp
    echo 146 40 B >> tmp
    rem 绘制测线AB
    gmt plot tmp -W1p,black,-.-
    rem 标注AB
    gmt text tmp -F+f10p -D0c/0.2c 
    rem 绘制图例
    gmt legend legendLB.txt -F+gazure1@10 -DjBL+w2.2i/1.6i+l1.2 -C0.1i/0.1i
    rem 绘制三个不同深度的震源球放到图例相应位置
    echo 123 33.05 43 3.62 -0.44 -3.18 0.90 2.46 -1.35 24 0 0 > tmp
    echo 126.6 33.05 171 -0.71 -0.26 0.96 0.44 0.81 -0.07 24 0 0 >> tmp
    echo 130.5 33.05 302 0.34 0.16 -0.50 -0.77 -4.57 -1.58 24 0 0 >> tmp    
    gmt meca tmp -Sm0.3c -Zdepth.cpt
    
    rem 右图上
    rem 沿测线AB绘制地形高度
    gmt basemap -R0/15/-4000/6000 -JX10c/3c -Bya4000+l"Elevation (m)" -BWrtb -X14c -Y6c
    rem 标注AB位置
    echo 0 7000 A > tmp
    echo 15 7000 B >> tmp
    gmt text tmp -F+f10p+jBC -N
    rem 沿测线提取地形高度
    gmt project -C126/42 -E146/40 -G0.1 | gmt grdtrack -G%GRD% > tmp
    rem 将海平面以下填充为淡蓝色
    echo 0 0 > tmp2 
    echo 15 0 >> tmp2
    gmt plot tmp2 -Wblack -Glightblue -L+y-4000
    rem 将地形填充为灰色
    gmt plot tmp -i2,3 -Wblack -Ggray -L+y-4000 
    rem 标注地理位置
    echo 2 4000 NE China > tmp 
    echo 12 4000 NE Honshu >> tmp    
    gmt text tmp -F+f10p
    
    rem 右图下
    rem 绘制剖面图
    gmt basemap -R0/15/0/700 -JX10c/-4c -Bya200f100+l"Focal depth (km)" -Bxa2f1+l"Distance"+u"\260" -BWSrt -Y-4.5c
    rem 绘制文字标注
    echo 5 400 Benioff zone | gmt text -F+f12p,10,blue=~1p,gray+a30+jBL
    rem 在剖面图上绘制震源球,剖面宽度为600
    gmt coupe %FM% -Q -L -Sm0.3c -Aa126/42/146/40/90/300/0/700f -Zdepth.cpt
    rem 绘制图例
    echo H 8 4 Events (Mw \076 4.5) > tmp
    echo S 0.1i c 0.20 purple 0.1p,black 0.25i 0-70 km >> tmp
    echo S 0.1i c 0.20 green 0.1p,black 0.25i 70-300 km >> tmp
    echo S 0.1i c 0.20 red 0.1p,black 0.25i 300-700 km >> tmp
    gmt legend tmp -DjBR+w1i+l1.5+o0.05i/0.04i -F+g255+p0.25p

gmt end show
del %GRD% depth.cpt tmp*
pause