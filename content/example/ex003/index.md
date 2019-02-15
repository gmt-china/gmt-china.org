---
title: "中国国界、省界及十段线"
date: 2016-10-23
lastmod: 2017-09-16
type: post
tags:
    - 地学数据
authors:
    - eyou
images:
    - CN-border-JD.png
    - CN-border-JM.png
commands:
    - pscoast
    - psxy
---

由于 GMT 自带的国界线数据不符合中国领土主张，因而在绘制用于正式图件时用户需要自己准备国界数据。本文提供了笔者自己数字化的几个国界相关数据以及两个绘制中国地图的脚本。

{{% alert info %}}
数据下载： [CN-border-La.dat](/data/CN-border-La.dat)
[CN-border-L1.dat](/data/CN-border-L1.dat)
[ten-dash-line.dat](/data/ten-dash-line.dat)
{{% /alert %}}

{{% alert info %}}
1.  无法保证国界数据完全准确或可通过地图审核；
2.  欢迎用户共享更准确的国界数据；
2.  `CN-border-La.dat` 中包含最全的信息，包括国界、省界、十段线以及南海诸多小岛；
3.  `CN-border-L1.dat` 包含国界、十段线以及南海诸岛数据，不含省界数据；
5.  `ten-dash-line.dat` 仅包含十段线数据；
{{% /alert %}}

## -JD 等距圆锥投影

{{< gmt-code "CN-border-JD" >}}
{{< figure src="/example/ex003/CN-border-JD.png" title="中国地图" >}}

## -JM 墨卡托投影

{{< gmt-code "CN-border-JM" >}}
{{< figure src="/example/ex003/CN-border-JM.png" title="中国地图" >}}

## 更新历史

- 2016-10-23：初稿；
- 2017-09-11：更新了 `CN-border-L1.dat` 的拓扑结构，使得其可以正确填充颜色；
- 2017-09-16：修复了 `CN-border-L1.dat` 中的一个 bug；
- 2018-04-16：使用全国基础地理数据库中的数据更新了十段线数据；
