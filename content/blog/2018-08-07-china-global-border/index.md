---
title: 中国及邻国国界问题解决方案
date: 2018-08-07
categories:
    - GMT技巧
authors:
    - 王亮
    - 刘珠妹
slug: china-global-border
---

开放的国界数据一般都是由外国机构提供的。外国人时常恶意地将中国以下领土从中国分裂出去或者划给其他国家：

1. 台澎金马
2. 钓鱼岛、赤尾屿等
3. 南海诸岛
4. 阿克赛钦
5. 藏南
6. 其他与印度及属国不丹交界的部分领土
7. 吉尔吉斯斯坦和俄罗斯已归还的领土
8. ...

之前，我们已经为大家提供了正确的中国国界。但是如果要同时画邻国的国界，则会因为要使用开放数据画外国边界而和我们的数据发生冲突。
现在我们搜集了中国及邻区的国界数据。这让我们能同时正确画中国和邻国国界称为可能。

{{% notice info %}}
数据下载：[中国及邻区国界数据](/datas/china-neighbor-admin-lines.dat) [中国邻区界线](/blog/china-global-border/cut-line.txt)
{{% /notice %}}

下载全球国界数据：https://data.biogeo.ucdavis.edu/data/gadm3.6/gadm36_levels_shp.zip

对全球国界数据进行处理：

````bash
unzip gadm36_levels_shp.zip -d gadm36_levels
ogr2ogr -f GMT -nln gadm36_0 gadm36_0 gadm36_0.shp # 只需要文件 gadm36_0.gmt
````

「中国邻区界线」指的是中国的邻区的边界。中国的邻区的范围不仅包含中国的领土还包含邻国的部分领土。
这个界线是我们人工手描的。邻区内各个国家的国界线都包含在「中国及邻区国界数据」中。「全球国界数据」就是全球各国的国界数据。
「中国及邻区国界数据」都是正确的，「全球国界数据」是外国的开放数据，所以涉及中国的部分就有上述问题。
我们的思路就是邻区内的国界用正确数据，邻区外的用外国的开放数据即可。

绘图代码：

利用 `select` 模块从正确的中国及邻区的各国国界数据中选出邻区内的数据，然后用 `psxy `画图。
利用 `select` 模块从公开数据中选出邻区外的数据，然后用 `psxy `画图。

{{< include-code "Chinaglobal.sh" bash >}}

绘图结果如下:

{{< figure src="/blog/china-global-border/CN-global-border.png" >}}
