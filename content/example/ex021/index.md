---
title: 用两套地形数据绘制夏威夷岛地形起伏图
date: 2018-09-05
type: post
authors:
    - 王亮
images:
    - hawaii.png
commands:
    - pscoast
    - grdimage
---

<i class="fas fa-download"></i>
[陆地地形文件](/example/ex021/hawaii_land_1s.grd) |
[海底地形文件](/example/ex021/hawaii_ocean_15s.grd) |
[配色文件](/example/ex021/hawaii.cpt)

夏威夷岛是夏威夷群岛的最大岛。
现在我们想绘制檀香山的地形。我们希望地形的精度尽可能的高，以得到最清晰的地图。
目前，免费开放的最精确的地形文件的精度是 1 弧秒，即 30m 一个采样点，但只包含陆地。
包含了海洋的地形的精度最高是 15s。
这样，我们就需要用 1 弧秒的数据来绘制地形，15 弧秒的数据来绘制海底。

思路：首先用 15 弧秒的文件绘制檀香山及周围海域（既有陆地，又有海洋）的地形。
然后，用 1 弧秒的数据去绘制陆地部分的地形。因为 1s 的数据后绘制，就把前面不太
准确的 15 弧秒陆地地形覆盖了。要实现这个思路的关键在于绘制 1 弧秒数据的时候，
怎样才能只覆盖陆地部分，而保留海洋部分。实现方法是：gmt 的 coast 模块提供了一个
clip 的功能，实现用海岸线进行裁剪。具体请看代码中的注释:

{{< gmt-code "hawaii" >}}

绘图效果如下:

{{< figure src="/example/ex021/hawaii.png" title="夏威夷檀香山" width="1000px">}}
