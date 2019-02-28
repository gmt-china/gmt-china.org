---
title: "绘制InSAR形变速率场"
date: 2019-02-26
type: post
authors:
    - 杨云飞
    - 陆好健
images:
    - InSAR.png
image:
    preview_only: true
---

<i class="fas fa-download"></i>
[yn.xyz](yn.xyz)

此文是利用Sentinel-1数据，基于InSAR方法获取断裂带及邻近区域构造地壳形变速率，其方向为LOS雷达的视线方向
yn.xyz格式数据包含经度纬度和形变速率信息，是由sarscape软件中SBAS小基线集模块处理生成shape文件获得。

{{< gmt-code "InSAR" >}}

成图效果：

![结果图](/example/ex025/InSAR.png)
