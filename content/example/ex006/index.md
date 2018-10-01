---
title: 中国铁路线
date: 2016-10-25
tags:
    - 地学数据
authors:
    - eyou
images:
    - CN-Railways.png
---

{{% notice info %}}
数据下载：[CN-border-La.dat](/datas/CN-border-La.dat) [CN-Railways.dat](/datas/CN-Railways.dat)
{{% /notice %}}

铁路线数据来源于 MapSIS。

GMT 的 `plot` 模块本身并不支持绘制铁路线。为了实现绘制铁路线的效果，此处采取的
技巧是是条线画两遍。如下脚本中第一个 `plot` 命令绘制了一条宽度为 `1.2p` 的黑线，
第二个 `plot` 命令绘制了一条宽度为 `0.8p` 的白线，这条线的线型 `8_8:` ，即线段
先是长度为 `8p` 的白线，然后是长度为 `8p` 的空白。由于线段的空白段是透明的，
所以会把第一次画的黑色线段露出来，最终实现了铁轨线的效果。

{{< include-code "CN-Railways.sh" bash >}}

{{< figure src="/example/ex006/CN-Railways.png" title="中国铁路线" >}}
