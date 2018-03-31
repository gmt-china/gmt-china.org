---
title: 绘制剖面
date: 2018-03-30
authors:
    - SeisPider
images:
    - profile.png
commands:
    - pscoupe
    - psxy
    - pslegend
---
{{% notice info %}}
示例数据:
[震中位置](/example/ex019/event.loc.info)
[机制解](/example/ex019/beachballs.info)
[海拔](/example/ex019/elev.csv)

{{% /notice %}}

本文绘制了如何同时绘制垂直剖面及其沿线的海拔变化。

Bash 绘图脚本如下:

{{< include-code "/example/ex019/profile.sh" bash >}}

绘图效果如下:

{{< figure src="/example/ex019/profile.png" title="剖面绘制" width="800px">}}
