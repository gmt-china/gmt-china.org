+++
title = "含中国大陆地区的地形图"
date = "2016-11-23"
categories = ["GMT示例"]
tags = ["地形图"]
authors = ["邓山泉"]
images = ["topo.png"]
commands = ["grdgradient", "grdimage", "pslegend"]
+++

{{% notice info %}}
数据下载：[eq.dat](/example/ex010/eq.dat) [ETOPO1_Ice.grd](/blog/etopo1)
{{% /notice %}}

本文展示了如何用 ETOPO1 数据绘制含中国大陆地区的地形图，同时也展示了如何通过 awk 对数据进行筛选，以及如何绘制简单的图例。

下面是绘图所使用的bash脚本，同时也提供了一个功能相同的 [bat脚本](/example/ex010/topo.bat)。
{{< include-code "/example/ex010/topo.sh" bash >}}

绘图效果：
{{< figure src="/example/ex010/topo.png" title="含中国大陆地区的地形图" >}}
