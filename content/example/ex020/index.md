---
title: 绘制速度模型
date: 2018-04-18
authors:
    - 赵志远
images:
    - model.png
commands:
    - psbasemap
    - psxy
    - pstext
---
{{% notice info %}}
示例数据:
[速度模型数据](/example/ex020/model.txt)
{{% /notice %}}

本文展示了如何绘制地壳速度模型图。

Bash 绘图脚本如下:

{{< include-code "draw-model.sh" bash >}}

绘图效果如下:

{{< figure src="model.png" title="绘制速度模型" width="400px">}}
