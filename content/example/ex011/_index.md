+++
title = "事件相对台站的震中距方位角分布图"
author = "lxrat"
date = "2017-04-11"
categories = ["GMT示例"]
authors = [""]
images = ["map.png"]
commands = ["psbasemap", "pstext", "psxy"]
+++

在以台站为核心的研究中（例如接收函数、S波分裂等），经常需要绘制以台站为中心的
地震分布图，以展示地震相对于台站的距离以及方位角分布。

下面是绘图所使用的bash脚本：
{{< include-code "/example/ex011/map.sh" bash >}}

绘图效果：
{{< figure src="/example/ex011/map.png" title="事件相对台站的震中距方位角分布图" >}}
