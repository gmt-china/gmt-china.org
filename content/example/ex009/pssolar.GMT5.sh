#!/bin/bash
# 绘制指定时间晨昏线，太阳位置

PS=solar.ps

# 绘制全球底图及海陆分布
gmt pscoast -Rd -JKs0/10i -Dl -A5000 -W0.5p -N1/0.5p,gray -S175/210/255 -Bafg --MAP_FRAME_TYPE=plain -K > $PS

# 绘制晨昏线
gmt pssolar -R  -J -Td+d2016-02-09T16:00:00 -Gnavy@95 -K -O >> $PS

# 绘制不同定义的晨昏区
gmt pssolar -R  -J -Tc+d2016-02-09T16:00:00 -Gnavy@85 -K -O >> $PS
gmt pssolar -R  -J -Tn+d2016-02-09T16:00:00 -Gnavy@80 -K -O >> $PS
gmt pssolar -R  -J -Ta+d2016-02-09T16:00:00 -Gnavy@80 -K -O >> $PS

# 计算指定时间太阳位置并绘制在底图上
gmt pssolar -I+d2016-02-09T16:00:00 -C | gmt psxy -R -J -Sksunglasses/1.5c -Gyellow -O >> $PS

rm gmt.*
# 转换为PDF文件查看透明效果
#gmt psconvert $ps -A -Tf
