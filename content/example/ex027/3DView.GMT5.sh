# ������������������ά���μ���������ͼ
R=98/100/27/29
J=M9c
View=150/40
PS=3DView.ps

gmt grdcut -R$R @earth_relief_04m.grd -Gtopo.grd
# ������ʱ��ɫ�ļ�
gmt grd2cpt topo.grd -Crainbow -Z > tmp.cpt
# ������ά����ͼ
gmt grdview topo.grd -R$R/800/6000 -J$J -JZ2c -Qi -I -Ctmp.cpt -p150/40 -N800+g150/150/150 -Bx0.5 -By0.5 -Bz3000+l"Elevation (m)" -BSEwnZ  -X3 -Y14c -K -P > $PS
# ����ά����ͼ�ϻ��ƺ�ɫ����
gmt grdtrack -Gtopo.grd -E98/28/100/28+i1k | gmt psxyz -R -J -JZ2c -W2p,red -p$View -O -K >> $PS

# ����ɫ���
gmt psscale -Dx7/-1/15/0.3h -Ctmp.cpt -Bxf200a400 -By+l"meter" -I -O -V -K >> $PS
# ���Ƶ�������
gmt project -C98/28 -E100/28 -G0.1 -Q | gmt grdtrack -Gtopo.grd > gmt.xy
gmt psxy gmt.xy -i2,3 -R0/200/1500/5000 -JX15c/6c -Wthick,darkred -Ggray -L+y1500 -Y-9c -O -K  >> $PS

gmt psbasemap -R -J -Bne -O -K >> $PS
gmt psbasemap -R -J -BWS -Bxa20f10+l"Distance along the @;red;line profile@;; (km)" -Bya1000f500g1000+l"Elevation (m)" -O  >> $PS

gmt psconvert $PS -Tj -Z 

rm tmp.cpt gmt.* topo.grd