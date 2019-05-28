---
title: 含中国大陆地区的地形图
date: 2016-11-24
type: post
tags:
    - 地形图
authors:
    - 邓山泉
    - 赵志远
images:
    - topo.png
commands:
    - grdgradient
    - grdimage
    - pslegend
---

<i class="fas fa-download"></i>
[eq.dat](/example/ex010/eq.dat) |
[earth_relief_01m.grd](http://mirrors.ustc.edu.cn/gmt/data/)

本文展示了如何绘制含中国大陆地区的地形图，同时也展示了如何通过 `awk`+`wc`+`cut`
对数据进行筛选计数，以及如何绘制简单的图例。

下面是绘图所使用的脚本：

{{< gmt-code "topo" >}}

绘图效果：
{{< figure src="/example/ex010/topo.png" title="含中国大陆地区的地形图" >}}

## 更新历史

- 2016-11-24：初稿
- 2017-10-27：更新脚本，利用 `awk`+`wc`+`cut` 实现不同震级地震自动计数
