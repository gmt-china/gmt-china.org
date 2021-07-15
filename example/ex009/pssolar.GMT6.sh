#!/bin/bash

gmt begin solar png
# 绘制指定时间晨昏线，太阳位置

# 绘制全球底图及海陆分布
gmt coast -Rd -JKs0/10i -Dl -A5000 -W0.5p -N1/0.5p,gray -S175/210/255 -Bafg --MAP_FRAME_TYPE=plain

# 绘制晨昏线
gmt solar -Td+d2016-02-09T16:00:00 -Gnavy@95

# 绘制不同定义的晨昏区
gmt solar -Tc+d2016-02-09T16:00:00 -Gnavy@85
gmt solar -Tn+d2016-02-09T16:00:00 -Gnavy@80
gmt solar -Ta+d2016-02-09T16:00:00 -Gnavy@80

# 计算指定时间太阳位置并绘制在底图上
gmt solar -I+d2016-02-09T16:00:00 -C | gmt plot -Sksunglasses/1.5c -Gyellow
gmt end
