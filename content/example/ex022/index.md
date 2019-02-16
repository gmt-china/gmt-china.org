---
title: 地球化学三角图解的绘制
date: 2019-01-22
type: post
authors:
    - 李黎明
images:
    - ternary.png
commands:
    - psternary
---

<i class="fas fa-download"></i>
[三角图解文件](/example/ex022/ternary.csv) |
[曲线坐标数据](/example/ex022/Th-Sc-La.txt )

三角图解有很多种，这里仅讨论一下地球化学上常用的地球化学图解用 GMT 的实现方法。
该三角图解引自Mukul R. Bhatia & Keith A.W. Crook, 1986, Contrib Mineral Petrol。原图如下：

{{< figure src="/example/ex022/Bhatia-Crool1988.png" title="Th,Sc,La三角图解" width="400px" >}}

- 三个端元值分别为 Th、Sc 和 La含量经归一化后的值，即将三元素含量换算成各自占三者的百分含量。
  以元素 Th 为例，Th'=100\*Th/(Th+Sc+La)，Sc 及 La 计算方法相同。

- A，B，C，D 分别代表不同的大地构造环境，A-大洋岛弧，B-大陆岛弧，C-活动大陆边缘，D-被动大陆边缘

# 实现三角框架和数据投点

psternary 模块可以实现三角框架和数据投点，代码如下：

{{< gmt-code "ternary" >}}

绘图效果如下:

{{< figure src="/example/ex022/ternary.png" title="Th,Sc,La三角图解" width="400px">}}

其中，判断曲线使用 Engauge Digitizer 软件自动获得。
