+++
title = "中国国界、省界及九段线"
date = "2016-10-22"
categories = ["GMT示例", "地学数据"]
authors = ['刘珠妹']
images = ["CN-border-JD.png", "CN-border-JM.png"]
commands = ["pscoast", "psxy"]
+++

由于存在领土争议，GMT 自带的国界数据是无法直接用于发表的，因而用户需要自己准备国界数据。本文提供了网络上流传的几个国界相关数据，以及两个绘制中国地图的脚本。

{{% notice info %}}
数据下载： [CN-border-La.dat](/datas/CN-border-La.dat)
[CN-border-L1.dat](/datas/CN-border-L1.dat) [CN-border-L2.dat](/datas/CN-border-L2.dat)
[nine-dash-line.dat](/datas/nine-dash-line.dat)
{{% /notice %}}

{{% alert info %}}
1.  数据来源于网络，无法保证数据可通过审核；
2.  欢迎用户共享更准确的国界数据；
2.  `CN-border-La.dat` 中包含最全的信息，包括国界、省界、九段线以及南海诸多小岛，但其中青海宁夏边界有误；
3.  `CN-border-L1.dat` 仅包含国界数据；
4.  `CN-border-L2.dat` 包含国界、省界以及南海诸多小岛，但南海诸岛信息不全；
5.  `nine-dash-line.dat` 仅包含九段线数据；
{{% /notice %}}

## -JD 等距圆锥投影

{{< include-code "/example/ex003/CN-border-JD.sh" bash >}}
{{< figure src="/example/ex003/CN-border-JD.png" title="中国地图" >}}

## -JM 墨卡托投影

{{< include-code "/example/ex003/CN-border-JM.sh" bash >}}
{{< figure src="/example/ex003/CN-border-JM.png" title="中国地图" >}}
