---
title: 为子图添加编号
date: 2016-10-17
categories:
    - GMT技巧
authors:
    - seisman
slug: numbering-subfigures
---

在绘制组合图（即一张图由多张子图组成）时，需要在每张子图的左上角加上 a、b、c、d 等子图编号。常规的方法是根据子图的 `-R` 选项的范围估计编号在当前子图里的坐标，然后使用 `text` 模块将编号写在坐标所在的位置。此方法的一个明显缺点是，当 `-R` 选项发生变化时，子图编号的坐标也需要发生变化。

其实，GMT 的 `text` 模块提供了一个功能，可以用于灵活地进行子图编号。如下脚本所示：

``` bash
#!/bin/bash
gmt begin figures

gmt basemap -JX5c/3c -R0/5/0/3 -Ba -BWSen
echo "a" | gmt text  -F+cTL+f15p,1 -Dj-1c/-0.75c -N

gmt basemap -Ba -BWSen -X7c
echo "b" | gmt text -F+cTL+f15p,1 -Dj-1c/-0.75c -N

gmt end
```

结果如下图所示：
![子图编号](numbering-subfigures.png)

几点说明：

1. `+cTL` 的作用是从 `-R` 选项中提取底图的左上角（**T**op **L**eft）作为当前字符串的坐标；
2. 由于使用了 `+cTL`，因而 `text` 不再需要 XY 坐标信息，只需要给出字符串 `a`、`b` 即可；
3. `+f15p,1` 将编号字号设置为 `15p`，1号字体（即粗体）
4. 将编号放在左上角还不够，还需要使用 `-Dj-1c/-0.75c` 对编号的位置进行微调，此处表示将编号向左边移动 1 cm 向上移动 0.75 cm
5. 由于编号位于子图的外部，故而需要加上 `-N` 选项使得 `text` 绘制子图外部的字符串
