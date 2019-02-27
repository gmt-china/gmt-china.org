---
title: "绘制形变速度场"
date: 2019-02-26
type: post
summary: 简介
authors:
    - 杨云飞
images:
    - InSAR.png
image:
    preview_only: true
---

此文是利用Sentinel-1数据，基于InSAR方法获取断裂带及邻近区域构造地壳形变速率，其方向为LOS雷达的视线方向
yn.xyz格式数据包含经度纬度和形变速率信息，是由sarscape软件中SBAS小基线集模块处理生成shape文件获得。

利用INSAR生成的LOS形变数据怎样构建形变速率场呢？
