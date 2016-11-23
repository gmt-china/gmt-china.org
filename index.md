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
数据下载：[eq.dat](/datas/eq.dat)
{{% /notice %}}

本文展示了如何用etopo1数据绘制含中国大陆地区的地形图。

{{< include-code "/example/ex010/topo.sh" bash >}}

{{< include-code "/example/ex010/topo.bat" bat >}}

{{< figure src="/example/ex010/topo.png" title="含中国大陆地区的地形图" >}}
