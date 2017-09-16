---
title: "中国国界、省界及九段线"
date: 2016-10-23
lastmod: 2017-09-16
tags:
    - 地学数据
authors:
    - 忆尤
images:
    - CN-border-JD.png
    - CN-border-JM.png
commands:
    - pscoast
    - psxy
---

由于 GMT 自带的国界线数据不符合中国领土主张，因而在绘制用于正式图件时用户需要自己准备国界数据。本文提供了笔者自己数字化的几个国界相关数据以及两个绘制中国地图的脚本。

{{% notice info %}}
数据下载： [CN-border-La.dat](/datas/CN-border-La.dat)
[CN-border-L1.dat](/datas/CN-border-L1.dat)
[nine-dash-line.dat](/datas/nine-dash-line.dat)
{{% /notice %}}

{{% alert info %}}
1.  无法保证国界数据完全准确或可通过地图审核；
2.  欢迎用户共享更准确的国界数据；
2.  `CN-border-La.dat` 中包含最全的信息，包括国界、省界、九段线以及南海诸多小岛；
3.  `CN-border-L1.dat` 包含国界、九段线以及南海诸岛数据，不含省界数据；
5.  `nine-dash-line.dat` 仅包含九段线数据；
{{% /notice %}}

## -JD 等距圆锥投影

{{< include-code "/example/ex003/CN-border-JD.sh" bash >}}
{{< figure src="/example/ex003/CN-border-JD.png" title="中国地图" >}}

## -JM 墨卡托投影

{{< include-code "/example/ex003/CN-border-JM.sh" bash >}}
{{< figure src="/example/ex003/CN-border-JM.png" title="中国地图" >}}

## 更新历史

- 2016-10-23：初稿；
- 2017-09-11：更新了 `CN-border-L1.dat` 的拓扑结构，使得其可以正确填充颜色；
- 2017-09-16：修复了 `CN-border-L1.dat` 中的一个 bug；
