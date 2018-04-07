---
title: 绘制等高线图和剖面图
date: 2017-08-14
authors:
    - 王亮
images:
    - maunakea.png
commands:
    - project
    - grdtrack
---

{{% notice info %}}
数据下载： [maunakea.grd](/example/ex013/maunakea.grd)
{{% /notice %}}

冒纳凯阿火山位于夏威夷群岛，是形成夏威夷岛的五座火山之一，是从结构体底部到顶部的全球最高峰。
这里，我们尝试为冒纳凯阿火山绘制等高线地图和高程的剖面图。

本示例主要使用了如下模块：

- `grdcontour` 模块可以根据地形网格文件绘制等高线，并进行标注。
- `project` 模块可以根据测线的起点与终点的经纬度坐标和步长，输出测线上采样点的坐标。
- `grdtrack` 模块则可以根据上述输出的采样点坐标从地形文件中得到采样点的距离和高程。

绘图效果如下：

{{< figure src="/example/ex013/maunakea.png" title="Mauna Kea Volcano" width="500px">}}

绘图脚本如下：

{{< include-code "plot-grdtrack.sh" bash >}}

本示例修改自鄭懷傑的[等高線地圖及地形剖面指令稿](http://gmt-tutorials.org/contour_and_profile.html)。
