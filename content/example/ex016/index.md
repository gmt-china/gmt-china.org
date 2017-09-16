---
title: 中国大陆及周边活动地块分布图
date: 2017-09-16
authors:
    - 忆尤
    - 邓山泉
images:
    - BLOCK.png
commands:
    - psxy
---

{{% notice info %}}
数据下载： [CN-plate-neighbor.dat](/example/ex016/CN-plate-neighbor.dat)
[CN-block-L1.dat](/datas/CN-block-L1.dat)
[CN-block-L1-deduced.dat](/datas/CN-block-L1-deduced.dat)
[CN-block-L2.dat](/datas/CN-block-L2.dat)
[CN-border-L1.dat](/datas/CN-border-L1.dat)
{{% /notice %}}

本文绘制了中国大陆及周边活动地块分布图。

- `CN-plate-neighbor.dat` 为中国大陆周边板块边界数据
- `CN-block-L1.dat` 为一级地块边界数据
- `CN-block-L1-deduced.dat` 为推断地块边界数据
- `CN-block-L2.dat` 为二级地块边界数据。

数据由网友根据下图矢量化而成，并经本文作者做了一定的格式转换：

{{< figure src="/example/ex016/zhang.jpg" width="800px">}}

绘图效果如下：

{{< figure src="/example/ex016/BLOCK.png" title="中国大陆及周边活动地块分布图" width="800px">}}

bash绘图脚本如下，也提供了等效的 [bat脚本](/example/ex016/BLOCK.bat)：

{{< include-code "/example/ex016/BLOCK.sh" bash >}}
