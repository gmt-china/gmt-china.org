---
title: 绘制三维地形图
date: 2019-08-22
type: post
authors:
    - 杨云飞
images:
    - 3DView.jpg
commands:
    - grdview
---

本文绘制了北纬28°附近三江并流处的三维地形图以及地形剖面图，为读者展示了三维地形及地形剖面的绘制方法。

主要用到 `grdview` 对三维地形进行呈现，`grdtrack` 获取测线地形数据并通过 `psxy` 绘制地形剖面。

绘图效果如下：

{{< figure src="/example/ex027/3DView.jpg" title="三江并流处的三维地形及地形剖面图" width="500px">}}

绘图脚本如下：

{{< gmt-code "3DView" >}}