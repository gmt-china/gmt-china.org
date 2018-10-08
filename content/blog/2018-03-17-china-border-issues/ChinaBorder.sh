#!/bin/bash
gmt begin CN-border png
gmt basemap -JM105/35/6.5i -R70/138/3/54

# GSHHG 数据
#gmt coast -Df -A10000 -Na/0.5p,gray -W1p,gray

# DCW 数据
gmt coast -Df -ECN,TW+p1p,blue@80
# 社区数据
gmt plot CN-border-L1.dat -W1p,red@80

gmt end
