---
title: 矢量及应力应变张量绘制
date: 2017-10-13
type: post
authors:
    - SeisPider
images:
    - subslab.png
commands:
    - psvelo
    - grdvector
---
{{% alert info %}}
示例数据:
[速度矢量](/example/ex017/velo.gmt)
[板块位置](/example/ex017/slab.gmt)
[应力张量](/example/ex017/stresstensor.gmt)
{{% /alert %}}

本文绘制了速度矢量和应力应变张量主轴

Bash 绘图脚本如下:

{{< include-code "subslab.sh" bash >}}

绘图效果如下:

{{< figure src="/example/ex017/subslab.png" title="矢量绘制示例" width="800px">}}
