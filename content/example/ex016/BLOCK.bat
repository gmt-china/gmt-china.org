gmt begin BLOCK png
gmt gmtset MAP_ANNOT_OBLIQUE 6
gmt gmtset MAP_TICK_LENGTH_PRIMARY 0
gmt gmtset MAP_FRAME_TYPE plain

REM ============��ͼ
gmt basemap -R78/12/149/53r -JB105/10/25/47/15c -Bx10 -By5 -BNEWS
gmt coast -Ggray95 -S83/216/238 -A5000 -Dh
gmt plot CN-border-L1.dat -W0.2p -Gwhite

REM ============���ư��߽�
gmt plot CN-plate-neighbor.dat -W2.0p,2/138/210 -Sf0.5+t+l -G2/138/210
REM ============�����ƶϵؿ�߽�
gmt plot CN-block-L1-deduced.dat -W1.0p,2/138/210,-
REM ============���ƶ����ؿ�߽�
gmt plot CN-block-L2.dat -W1.0p,orange
REM ============����һ���ؿ�߽�
gmt plot CN-block-L1.dat -W1.0p,2/138/210

REM ============��ؿ��ע
echo 90 45 �����ؿ� > blockname
echo 122 46 �����ǻ�ؿ� >> blockname
echo 120 35 ������ؿ� >> blockname
echo 110 27 ���ϻ�ؿ� >> blockname
echo 90 33 ��ػ�ؿ� >> blockname
echo 97 23 �����ؿ� >> blockname
gmt text blockname -F+f10p,37

REM ============�߽�ͼ��
echo S 0.3i f0.5+t+l 0.4i/0.3c 2/138/210 2.0p,2/138/210 0.7i ���߽� > legend
echo S 0.3i - 0.50i 2/138/210 1.0p,2/138/210 0.7i  һ���ؿ�߽� >> legend
echo S 0.3i - 0.44i - 1.0p,2/138/210,- 0.7i  �ƶϵؿ�߽� >> legend
echo S 0.3i - 0.50i orange 1.0p,orange 0.7i �����ؿ�߽� >> legend
gmt legend legend -DjTL+w1.5i+jTL+o0.1c/0.1c -F+gwhite+p0.5p -O -K --FONT_ANNOT_PRIMARY=8p,37 >> %PS%

REM ============�Ϻ��
gmt basemap -DjBR+w2c+t
gmt coast -R106/121/3/24 -JM2c -Ggray95 -S83/216/238  -A5000 -Dh
gmt plot CN-border-L1.dat -R106/121/3/24 -JM2c -B0 -W0.2p -Gwhite
del blockname legend
gmt end
pause