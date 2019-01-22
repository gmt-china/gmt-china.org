---
title: 地球化学三角图解的绘制
date: 2018-01-22
authors:
    - 李黎明
images:
    - ternary1.png
    - ternary2.png
    - Engauge.jpg
commands:
    - ternary
---

{{% notice info %}}
数据下载：[三角图解文件](/example/ex022/ternary.txt)
[曲线坐标数据](/example/ex022/Th-Sc-La.txt )
{{% /notice %}}

三角图解有很多种，这里仅讨论一下地球化学上常用的地球化学图解用 GMT 的实现方法。
该三角图解引自Mukul R. Bhatia & Keith A.W. Crook，1986，Contrib Mineral Petrol  92:181-193。原图如下：

{{< figure src="Bhatia-Crool1986.png" title="Th,Sc,La三角图解" width="1000px">}}


- 三个端元值分别为 Th、Sc 和 La含量经归一化后的值，即将三元素含量换算成各自占三者的百分含量。

  以元素 Th 为例，Th'=100*Th/(Th+Sc+La)，Sc 及 La 计算方法相同。

- A，B，C，D 分别代表不同的大地构造环境，A-大洋岛弧，B-大陆岛弧，C-活动大陆边缘，D-被动大陆边缘

# 实现三角框架和数据投点

ternary 模块可以实现三角框架和数据投点，代码如下：

{{< include-code "draw-ternary1.sh" bash >}}

结果如图，但是还缺少原图相应的判定曲线。

{{< figure src="ternary1.png" title="Th,Sc,La三角图解" width="1000px">}}

# 获得判定曲线坐标数据

将原图以左下方的点为坐标原点建立笛卡儿坐标系，等边三角形边长 $a = 100$，则高为:

$$h=\frac{1}{2}*\sqrt{3}*a=\frac{1}{2}*\sqrt{3}*100=50\sqrt{3}$$

如下图；然后利用 Engauge Digitizer 软件自动获得判定曲线的坐标数据。

{{< figure src="Engauge.jpg" title="判定曲线的坐标数据" width="1000px">}}

# 在原绘图脚本上叠加判定曲线

需要注意的是，在三角图解坐标系下，-R, -J分别为

````bash
R1=0/100/0/100/0/100
J1=X8c
````

而在用psxy绘制判定曲线时，要在三角图解的基础上再定义一个坐标系，其 x 值要与 R1 和 J1 的 x 值相同，y 值仍按上述公式换算。以保证两个不同的坐标系在纸面坐标上是重合的。

$$
R2=0/100/0/50\sqrt{3}\\
J2=X8c/4\sqrt{3}c
$$

完整绘图代码如下：

{{< include-code "draw-ternary2.sh" bash >}}

绘图效果如下:

{{< figure src="ternary2.png" title="Th,Sc,La三角图解" width="1000px">}}
