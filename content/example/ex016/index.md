---
title: 中国大陆及周边活动地块分布图
date: 2017-09-17
type: post
authors:
    - 王杰
    - eyou
    - 邓山泉
images:
    - BLOCK.png
commands:
    - psxy
---

<i class="fas fa-download"></i>
[CN-plate-neighbor.dat](/example/ex016/CN-plate-neighbor.dat) |
[CN-block-L1.dat](/data/CN-block-L1.dat) |
[CN-block-L1-deduced.dat](/data/CN-block-L1-deduced.dat) |
[CN-block-L2.dat](/data/CN-block-L2.dat) |
[CN-border-L1.dat](/data/CN-border-L1.dat)

本文绘制了中国大陆及周边活动地块分布图。

- `CN-plate-neighbor.dat` 为中国大陆周边板块边界数据
- `CN-block-L1.dat` 为一级地块边界数据
- `CN-block-L1-deduced.dat` 为一级地块推断边界数据
- `CN-block-L2.dat` 为二级地块边界数据
- `CN-border-L1.dat` 为国界线数据

数据由网友根据下图矢量化而成，并经本文作者做了一定的格式转换：

{{< figure src="/example/ex016/zhang.jpg" width="750px">}}

绘图效果如下：

{{< figure src="/example/ex016/BLOCK.png" title="中国大陆及周边活动地块分布图" width="800px">}}

bash绘图脚本(gmt5.4.2)如下，也提供了等效的 [bat脚本](/example/ex016/BLOCK.bat)：

{{< gmt-code "BLOCK" >}}

## 参考文献

1. 张培震,邓起东,张国民,等. 中国大陆的强震活动与活动地块[J]. 中国科学D辑, 2003, 33(z1):12-20.
2. 张国民,马宏生,王辉,等. 中国大陆活动地块边界带与强震活动[J]. 地球物理学报,2005,(03):602-610.

## 更新历史

- 2017-09-17：初稿；
- 2017-09-28：更新了 `CN-block-L1.dat` ， `CN-block-L1-deduced.dat` ， `CN-block-L2.dat` ，使一、二级地块边界数据不重合；
