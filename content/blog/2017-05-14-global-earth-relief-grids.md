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

**文件说明** ：

1. 数据文件名格式为 `earth_relief_<res>.grd`
2. 四个最高精度的地形数据是SRTM15+，SRTM30+、ETOPO1、ETOPO2v2的原始数据，其余
   精度的地形数据由 ETOPO1 数据做球面高斯滤波减采样得到

## 使用说明

1.  下载GMT提供地形网格数据文件 `earth_relief_*.grd` 。下载地址为:

    - GMT官方镜像: ftp://ftp.soest.hawaii.edu/gmt/data/
    - 中科大国内镜像: http://mirrors.ustc.edu.cn/gmt/data/

2.  将地形数据保存在如下目录中（若不存在该目录，请自行新建）：

    - Linux/macOS 用户： `~/.gmt`
    - Windows 用户： `C:\Users\用户名\.gmt`

    Windows用户请注意：

    - 无法通过文件管理器直接建立名为 `.gmt` 文件夹。正确的做法是，
      打开“命令提示符”，执行命令 `mkdir .gmt` 以创建该文件夹。
    - 若C盘容量不够，可以在其他盘下建GMT数据库数据库。具体做法是，

      1. 建立GMT数据库目录 `F:\GMTDATABASE` （具体路径自行决定）
      2. 打开“我的电脑”->“属性”->“高级”->“环境变量”
      3. 添加环境变量，变量名为 `GMT_DATADIR`，值为 `F:\GMTDATABASE`
      4. 重启电脑使得环境变量生效

3.  在任意目录下执行如下命令以测试GMT能否正确找到地形数据:

    GMT6用户:

        gmt grdimage earth_relief_10m.grd -Rg -JH20c -Cetopo1 -png gmt5-topo


    GMT5用户:

        gmt grdimage earth_relief_10m.grd -Rg -JH20c -Cetopo1 > gmt5-topo.ps

    GMT4用户:

        makecpt -Ctopo > mytopo.cpt
        grdimage earth_relief_10m.grd -Rg -JH20c -Cmytopo.cpt > gmt4-topo.ps
