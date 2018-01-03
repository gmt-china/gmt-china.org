---
title: "一些实用的 DIY 符号"
date: 2018-01-03
categories:
    - GMT技巧
tags:
    - psxy
    - pslegend
authors:
    - 赵志远
slug: useful-diy-symbols
---

{{% notice info %}}
下载地址：[diy-symbols.zip](/datas/diy-symbols.zip)
{{% /notice %}}

虽然 GMT 内置了 40 个不同的自定义符号，但对于广大用户来说还是远远无法满足需求，因此，社区将在这里持续更新一些常用的但还没有被 GMT 官方内置的自定义符号。如果你觉得有其它实用的符号没有被包含进来，请向我们反馈，我们会酌情考虑。

直接下载 [diy-symbols.zip](/datas/diy-symbols.zip) 并根据需求将解压得到的 def 文件复制到以下任意路径（按脚本搜索顺序排列）：

1. `current directory`，即运行脚本所在目录
2. `～/.gmt` 目录 
3. `$GMT_SHAREDIR/custom` 目录。

目前压缩包中包含的自定义符号：

1.   `city`：城市符号
2.   `compass`：指北针符号

绘制方法如下：

{{< include-code "/blog/plot_diy_symbols.sh" bash >}}

绘图效果如下：

{{< figure src="/blog/plot_diy_symbols.png" title="绘制diy符号" width="450px">}}
