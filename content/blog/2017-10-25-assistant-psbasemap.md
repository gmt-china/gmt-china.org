---
title: 使用辅助底图做绘图调整
date: 2018-07-02
categories:
    - GMT技巧
authors:
    - seisman
    - 王亮
slug: assistant-psbasemap
---

阅读本文前，请先了解 -X、-Y 和 -D 选项。

有时我们想对绘图做一些调整，比如用 -X -Y 选项调绘图位置距离，调整图片的大小，在某个特定位置加文字、画符号等等。
这些操作都需要知道两点在纸面上的相对距离。一个办法是不断的去尝试，但是，用辅助底图可以快得多。

比如，在下面的图中，我们想分别呈现澳大利亚和新西兰。显然，这幅图中，两国的相对位置、国名文字的位置都不理想：

``` bash
#!/bin/bash
PS=a.ps
# 绘制澳大利亚
J=M260/18c
R=110/160/-40/-10
gmt pscoast -J$J -R$R -Y13c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K > $PS
gmt pstext -J$J -R$R -F+f30p,4,red -K -O >> $PS << EOF
130 -20 Australia
EOF
# 绘制新西兰
J=M260/10c
R=160/180/-50/-30
gmt pscoast -J$J -R$R -X6c -Y-13c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K -O >> $PS
gmt pstext -J$J -R$R -F+f30p,4,red -K -O >> $PS << EOF
170 -45 New Zealand
EOF

gmt psxy -R$R -J$J -T -O >> $PS
rm -f gmt.conf gmt.history
```

![原始绘图](/images/assistant-psbasemap-a.png)

这时，我们可以在脚本中加入辅助底图：

``` bash
#!/bin/bash
PS=b.ps
# 绘制澳大利亚
J=M260/18c
R=110/160/-40/-10
gmt pscoast -J$J -R$R -Y13c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K > $PS
gmt pstext -J$J -R$R -F+f30p,4,red -K -O >> $PS << EOF
130 -20 Australia
EOF
# 绘制新西兰
J=M260/10c
R=160/180/-50/-30
gmt pscoast -J$J -R$R -X6c -Y-13c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K -O >> $PS
gmt pstext -J$J -R$R -F+f30p,4,red -K -O >> $PS << EOF
170 -45 New Zealand
EOF
# 绘制辅助底图
R=0/21/0/29.7
J=x1/1
B=a1g1
gmt set MAP_FRAME_TYPE=inside MAP_GRID_PEN_PRIMARY=0p,red,.
gmt psbasemap -R$R -J$J -B$B -BWSEN -Xf0c -Yf0c -P -K -O >> $PS

gmt psxy -R$R -J$J -T -O >> $PS
rm -f gmt.conf gmt.history
```

![加入了辅助底图](/images/assistant-psbasemap-b.png)

首先我们在图中可以看到如果澳大利亚的 X 方向长度等于 21 - 2.5 * 2 厘米 = 16 厘米，那么澳大利亚就可以刚好居中，而纵向上澳大利亚应该往 Y 正方向再移动 4 厘米，即移动 17 厘米。新西兰相对于澳大利亚往 X 负方向移动 13 厘米会盖住澳大利亚，所以不妨多两个厘米，改为 15 厘米。同样的方式，对国名的标注位置可以用 -D 选项进行偏移。脚本修改和得图如下：

``` bash
#!/bin/bash
PS=c.ps
# 绘制澳大利亚
J=M260/16c
R=110/160/-40/-10
gmt pscoast -J$J -R$R -Y17c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K > $PS
gmt pstext -J$J -R$R -F+f30p,4,red -D1c/-1.5c -K -O >> $PS << EOF
130 -20 Australia
EOF
# 绘制新西兰
J=M260/10c
R=160/180/-50/-30
gmt pscoast -J$J -R$R -X6c -Y-15c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K -O >> $PS
gmt pstext -J$J -R$R -F+f30p,4,red -D1.5c/2.5c -K -O >> $PS << EOF
170 -45 New Zealand
EOF
# 绘制辅助底图
R=0/21/0/29.7
J=x1/1
B=a1g1
gmt set MAP_FRAME_TYPE=inside MAP_GRID_PEN_PRIMARY=0p,red,.
gmt psbasemap -R$R -J$J -B$B -BWSEN -Xf0c -Yf0c -P -K -O >> $PS

gmt psxy -R$R -J$J -T -O >> $PS
rm -f gmt.conf gmt.history
```

![修改绘图](/images/assistant-psbasemap-c.png)

最终，移去辅助底图部分：

``` bash
#!/bin/bash
PS=d.ps
# 绘制澳大利亚
J=M260/16c
R=110/160/-40/-10
gmt pscoast -J$J -R$R -Y17c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K > $PS
gmt pstext -J$J -R$R -F+f30p,4,red -D1c/-1.5c -K -O >> $PS << EOF
130 -20 Australia
EOF
# 绘制新西兰
J=M260/10c
R=160/180/-50/-30
gmt pscoast -J$J -R$R -X6c -Y-15c -Bag -Dl -N1/thick,red -A500 -Gtan -Wthinnest,white -Swhite -P -K -O >> $PS
gmt pstext -J$J -R$R -F+f30p,4,red -D1.5c/2.5c -K -O >> $PS << EOF
170 -45 New Zealand
EOF

gmt psxy -R$R -J$J -T -O >> $PS
rm -f gmt.conf gmt.history
```

![最终结果](/images/assistant-psbasemap-d.png)
