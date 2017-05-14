---
title: 全球地形起伏数据
date: 2017-05-14
slug: global-earth-relief-grids
categories:
    - 地学数据
tags:
    - 地形
authors:
    - seisman
---

在使用GMT绘制地图时，经常需要绘制全球/区域地形地图作为底图。常见的全球地形数据
包括 ETOPO1、SRTM、GEBCO 等。

以前，用户需要自行从官方网站下载这些地形数据并进行必要的格式转换使得其可以在GMT中使用。

现在，GMT官方整理出了一套全球地形起伏数据，可以直接在GMT4和GMT5中使用，极大方便了
GMT用户绘制地形底图。

## 数据简介

GMT官方整理的地形起伏数据包含13个不同的精度，以满足多种绘图要求。

数据精度及文件大小从低到高依次为（ `m` 代表弧分， `s` 代表弧秒）

- 60m: 112 Kb
- 30m: 377 Kb
- 20m: 783 Kb
- 15m: 1.4 Mb
- 10m: 2.9 Mb
- 06m: 7.5 Mb
- 05m: 11 Mb
- 04m: 16 Mb
- 03m: 28 Mb
- 02m: 58 Mb
- 01m: 214 Mb
- 30s: 778 Mb
- 15s: 2.6 Gb

总计约 3.7 Gb。

其中四个最高精度的地形数据是SRTM15+，SRTM30+、ETOPO1、ETOPO2v2的原始数据，其余
精度的地形数据由 ETOPO1 数据做球面高斯滤波减采样得到。

## 使用说明

1.  下载GMT提供地形网格数据文件 `earth_relief_*.grd` 。下载地址为:

    - GMT官方镜像: ftp://ftp.soest.hawaii.edu/gmt/data/
    - 中科大国内镜像: http://mirrors.ustc.edu.cn/gmt/data/

2.  将地形数据保存在如下目录中（若不存在该目录，请自行新建）：

    - Linux/macOS 用户： `~/.gmt`
    - Windows 用户： `C:\Users\用户名\.gmt`

3.  在任意目录下执行如下命令以测试GMT能否正确找到地形数据:

    GMT5用户:

        gmt grdimage earth_relief_10m.grd -Rg -JH20c -Cetopo1 > gmt5-topo.ps

    GMT4用户:

        makecpt -Ctopo > mytopo.cpt
        grdimage earth_relief_10m.grd -Rg -JH20c -Cmytopo.cpt > gmt4-topo.ps
