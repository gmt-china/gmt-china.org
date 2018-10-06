---
title: 绘制含地形起伏的地震剖面图
date: 2018-04-07
authors:
    - SeisPider
images:
    - profile.png
commands:
    - coupe
    - plot
    - legend
---
{{% notice info %}}
示例数据:
[震中位置数据](/example/ex019/event.loc.info) |
[机制解数据](/example/ex019/beachballs.info) |
[海拔数据](/example/ex019/elev.csv)
{{% /notice %}}

本文展示了如何同时绘制沿着垂直剖面的海拔变化图、地震分布及震源机制图。

Bash 绘图脚本如下:

{{< include-code "profile.sh" bash >}}

绘图效果如下:

{{< figure src="profile.png" title="剖面图绘制" width="800px">}}
