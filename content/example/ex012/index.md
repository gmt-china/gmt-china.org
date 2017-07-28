+++
title = "绘制M-T图"
date = "2017-07-29"
categories = ["GMT示例"]
authors = ['seisman']
images = ["mt.png"]
commands = ["psbasemap", "psxy"]
+++

M-T 图表示地震随时间发展的数量密度和震级大小。M-T 图的横轴是时间，纵轴是震级。图中每一条竖线代表一次地震，竖线的位置表示了地震发生的时间，而竖线的长度代表了震级的大小。

绘图效果如下：

{{< figure src="/example/ex012/mt.png" title="M-T 图" width="300px">}}

绘图脚本如下：

{{< include-code "/example/ex012/plot-mt.sh" bash >}}
