---
title: 利用 Google Maps 获取超高精度高程数据
date: 2017-09-14
type: post
summary: 如何获得米级精度的高程数据?
categories:
    - 科研工具
tags:
    - 数据下载
authors:
    - SeisPider
---

在绘制超小区域的地形图时，常需要超高精度的高程数据。

目前已知的公开高程数据中，ASTER GDEM的精度最高，为1弧秒，即约30米一个数据点。
研究者可以通过 Google Maps Elevation API 获取米级精度的数据。

## 数据简介

Google Maps Elevation API 提供地球表面所有位置的海拔高度数据，包括海床上的深度位
置（此类位置返回负值）。

官方文档：

- [入门指南](https://developers.google.com/maps/documentation/elevation/start?hl=zh-cn)
- [开发人员指南](https://developers.google.com/maps/documentation/elevation/intro?hl=zh-cn)

## 获取密钥 API KEY

想要从Google Maps中获取地形数据，首先需要一个密钥。

1. 访问 [入门指南](https://developers.google.com/maps/documentation/elevation/start?hl=zh-cn) 页面
2. 点击右上角的“获取密钥”按钮（你可能需要翻墙才能获取密钥）

限额说明：

- 每个用户最多可能只能申请10个免费密钥
- 每个密钥每天2500次免费请求
- 每次请求最多512个位置
- 每秒最多50次请求

## 使用说明

### 获取单点高程

通过简单的网络请求即可获取单点的高程：

```
https://maps.googleapis.com/maps/api/elevation/json?locations=39.7391536,-104.9847034&key=YOUR_API_KEY
```
其中：

- `locations=39.7391536,-104.9847034` 指定了要获取高程的经纬度，纬度和经度之间用逗号分隔；
- `key=YOU_API_KEY` 指定了用户密钥，用户需要将自己申请的密钥替换 `YOU_API_KEY`

将上面的链接复制到浏览器中，即可得到返回值为::

    {
       "results" : [
            {
                "elevation" : 1608.637939453125,
                "location" : {
                    "lat" : 39.73915360,
                    "lng" : -104.98470340
                },
                "resolution" : 4.771975994110107
            }
       ],
       "status" : "OK"
    }

从中可以看到这一点的海拔高度是 1608.637939453125 米（小数点后几位可能都没有意义）。
resolution给出了该点高程的分辨率值，即内插海拔高度的数据点之间的最大距离，以米为单位。

### 获取多点高程

也可以在一次网络请求中获取多个点的高程，多个位置之间用 `|` 分隔即可。例如：

```
https://maps.googleapis.com/maps/api/elevation/json?locations=39.7391536,-104.9847034|36.455556,-116.866667&key=YOUR_API_KEY
```

但一次请求中的位置不能超过512个。

### 批量获取高程

Google Maps 提供了多种客户端以实现批量获取高程。此处以[Python客户端](https://github.com/googlemaps/google-maps-services-python/) 为例。

1. 安装 Google Map API 的 Python模块:

        $ pip install -U googlemaps

2. 获取免费密钥
3. 参考如下脚本批量获取高程数据

``` python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import googlemaps
import numpy as np


def request_elevation(xmin, xmax, xinc, ymin, ymax, yinc, maxnum=512):
    """Request elevation and return them with a list

    Parameter
    =========
    xmin : float
        minimum longitude, unit is degree
    xmax : float
        maximum longitude, unit is degree
    xinc : float
        increment of longitude

    ymin : float
        minimum latitude, unit is degree
    ymax : float
        maximum latitude, unit is degree
    yinc : float
        increment of latitude
    maxnum : int
        point number of one request, maximum value is 512
    """

    xlist = np.arange(xmin, xmax, xinc)
    ylist = np.arange(ymin, ymax, yinc)
    points = [(y, x) for y in ylist for x in xlist]

    requestnum = int(np.floor(len(points) / maxnum) + 1)
    npoints = np.array_split(points, requestnum)
    if requestnum > 2500:
        print("Error: Request number exceed! Change grid or region.")

    return [gmaps.elevation(locations=loc.tolist()) for loc in npoints]


# 设置要下载高程数据的经度范围、纬度范围以及网格间隔
xmin, xmax, xinc = 120.000, 129.005, 0.00005
ymin, ymax, yinc = 30.000, 30.005, 0.00005

gmaps = googlemaps.Client(key='YOU_API_KEY')

# Obtain all elevations
# 请设置 maxnum 确保每一次请求的数据点数不超过 512 个以控制请求字符串长度
elevations = request_elevation(xmin, xmax, xinc, ymin, ymax, yinc, maxnum=512)

# output data with format `longitude   latitude elevation resolution`
with open("Elevations.dat", "w") as f:
    for loclist in elevations:
        for subloc in loclist:
            outputstr = "{:.5f}  {:.5f}  {:.5f}  {:.5f}\n".format(
                subloc['location']['lng'],
                subloc['location']['lat'],
                subloc['elevation'],
                subloc['resolution'])
            f.writelines(outputstr)
```
