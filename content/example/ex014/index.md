---
title: 绘制指定测线的地震剖面图
date: 2017-08-15
lastmod: 2017-09-11
authors:
    - 邓山泉
images:
    - seismic-profile.png
commands:
    - project
---

{{% notice info %}}
数据下载： [earthquakes.dat](/example/ex014/earthquakes.dat)
{{% /notice %}}

本文展示了如何绘制选定测线的地震剖面图。 `earthquakes.dat` 为地震数据文件，包含三列数据，分别是经度、纬度、深度。

图（a）绘制了区域范围内的地震震中分布图，蓝色的线表示选定的测线；图（b）绘制了选定测线两侧0.2°范围内地震的震中分布图；图（c）绘制了选定地震的经度/深度剖面图；图（d）绘制了选定地震的纬度/深度剖面图。

本文主要使用了 `project` 模块：

- `-C100/22` ：指定测线起点为（100°, 22°）；
- `-E106/30` ：指定测线终点为（106°, 30°）；
- `-G0.1` ：指定了测线上测点的间隔；
- `-W-0.2/0.2` ：指定测线两侧各0.2°范围内的地震；
- `-F` ：该选项指定期望输出的数据列
  - `-Fxy` 表示输出数据的前两列，即经度和纬度；
  - `-Fxz` 表示输出数据的第一、三列，即经度和深度；
  - `-Fyz` 表示输出数据的后两列，即纬度和深度。

示例中 `–W` 和 `-G` 选项使用的是和输入文件相同的单位（即度），如果使用不同单位（比如km），则需要添加-Q选项。

绘图效果如下：

{{< figure src="/example/ex014/seismic-profile.png" title="地震剖面图" width="500px">}}

bash绘图脚本如下，也提供了等效的 [bat脚本](/example/ex014/profile.bat)：

{{< include-code "/example/ex014/profile.sh" bash >}}
