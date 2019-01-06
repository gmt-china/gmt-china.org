---
title: GMT6 要来啦 — GMT 各版本间的差异
date: 2018-04-07
authors:
  - seisman
categories:
  - GMT技巧
slug: gmt-versions
---

GMT 目前存在如下几个大版本:

- [GMT4](https://www.soest.hawaii.edu/gmt/)：最新版本为 GMT 4.5.18，也是最终版本，已不再维护更新；
- [GMT5](http://gmt.soest.hawaii.edu/doc/5.4.5/)：最新版本为 GMT 5.4.5，是目前的主流版本
- [GMT6](http://gmt.soest.hawaii.edu/doc/latest/)：正在开发中的版本，预计未来一年内会发发布第一个正式版

除此之外，GMT 还为其他常用的编程语言提供了方便的接口：

- [gmtmex](https://github.com/GenericMappingTools/gmtmex)：GMT 的 matlab 接口，基于 GMT5
- [GMT.jl](https://github.com/GenericMappingTools/GMT.jl)：GMT 的 Julia 接口，基于 GMT5
- [gmt-python](https://github.com/GenericMappingTools/gmt-python)：GMT 的 Python 接口，基于 GMT6

GMT6 虽然尚未发布，但其已经足够稳定，可以用于日常使用。最主要的是，GMT6 几乎
完全兼容 GMT5 的语法，且提供了一种更为简洁易用的新写法。

{{% alert info %}}
对 GMT6 有兴趣的 Linux 用户，可以
根据 [此文](https://docs.gmt-china.org/appendix/get-gmt-dev/) 获取 GMT6 开发版，
并根据 [此文](https://docs.gmt-china.org/install/linux/) 即可编译安装并试用 GMT6。
{{% /alert %}}

本文将通过绘制如下一张简单的图片来展示 GMT 不同版本在绘图脚本上的主要差异。
需要注意，本文不可能详细介绍 GMT 各版本之间的主要差异，本文的主要目的是为了
演示 GMT6 新语法的简洁性。

{{< figure src="/blog/gmt-versions/gmt-map.png" >}}

## GMT4

下面的脚本展示了如何在GMT4下绘制上图。脚本中的注释信息简单介绍了每句命令的含义，
选项的具体含义不是本文重点，不再赘述。

{{< include-code "gmt4.sh" bash >}}

## GMT5

下面的脚本展示了如何在 GMT5 下绘制上图。将 GMT5 与 GMT4 的脚本相比，会发现如下
几个主要的区别：

-   所有 GMT 命令均以 `gmt` 开头，以避免与其他同名的命令冲突
-   所有 GMT 参数进行了统一分类与命令，比如与文字相关的参数都名为 `FONT_xxx` 、
    与绘图相关的参数都名为 `MAP_xxx`
-   `-B` 选项可重复多次使用， `-BWSen+t` 用于设置整个底图的属性（标题、背景色等），
    `-Bx` 和 `-By` 则分别设置 X 轴和 Y 轴的轴属性（刻度、标注、标签、单位、前缀等）。
    相比于 GMT4 而言，条理更加清晰
-   增加了颜色透明功能， `red@70` 表示70%透明的红色
-   可以自动处理多段数据，不再需要 `-m` 选项
-   绘制箭头的语法不同，新语法有更多的选项，可以得到更多种类的箭头
-   比例尺语法有变化，即 `-L` 和 `-F` 选项，新语法看上去很复杂，但此语法将比例尺、
    colorbar、指南针等修饰物的语法做了统一，且一旦理解之后，可以很灵活地在图上
    任意位置放置这些修饰物
-   图片转换命令从 `ps2raster` 改成了 `psconvert`
-   配置文件和命令历史文件的文件名变成了 `gmt.conf` 和 `gmt.history`

{{< include-code "gmt5.sh" bash >}}

## GMT6

GMT6 尚未发布，但 GMT6 完全兼容 GMT5。上面的 GMT5 绘图脚本可以不做任何修改地在
GMT6 下使用。除此之外，GMT6 还引入了一种全新的“现代模式”，大大简化了脚本。

GMT6 相对于 GMT5 做了大量简化，列举如下：

-   所有命令都不再需要 `-K` `-O`，也不需要使用 `>` 或 `>>` 重定向到 PS 文件，
    用户完全不需要意识到 PS 文件的存在
-   只要前面的命令使用过 `-J` 和 `-R` ，则后面的命令不再需要重复 `-J` `-R`
-   以 `gmt begin` 开始一张绘图，以 `gmt end` 结束一张绘图
-   使用 `gmt begin` 时可以指定要生成的图片的文件名以及多种格式
-   命令名有微调（虽然有变化，但旧命令依然可以使用！）
    -   以 `ps` 开头的命令均省略了 `ps`，比如 `psbasemap` 变成 `basemap`、
        `pscoast` 变成 `coast`
    -   几个特例： `psxy` 变成 `plot`， `psscale` 变成 `colorbar`
-   执行 `gmt end` 时自动根据 `gmt begin` 中的设置生成多种格式的图片
-   不再需要手动清理 `gmt.conf` 和 `gmt.history` 等临时文件

{{< include-code "gmt6.sh" bash >}}
