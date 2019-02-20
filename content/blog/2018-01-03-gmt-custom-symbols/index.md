---
title: "一些实用的自定义符号"
date: 2018-01-03
type: post
summary: 我们提供了可用于GMT的自定义符号
categories:
    - GMT技巧
tags:
    - psxy
    - pslegend
authors:
    - 赵志远
---

虽然 GMT 内置了 40 个不同的自定义符号，但对于广大用户来说还是远远无法满足需求。目前，社区提供了一些常用的但还没有被 GMT 官方内置的自定义符号，如果你觉得有其它实用的符号没有被包含进来，请向我们反馈，我们会酌情考虑。

在GMT中文社区[下载](https://github.com/gmt-china/GMT_custom_symbols)所需 def 文件复制到以下任意路径（按脚本搜索顺序排列）：

1. `current directory`，即运行脚本所在目录
2. `~/.gmt` 目录
3. `$GMT_SHAREDIR/custom` 目录。

使用方法如下：

{{< include-code "plot_custom_symbols.sh" bash >}}

绘图效果如下：

{{< figure src="/blog/gmt-custom-symbols/plot_custom_symbols.png" title="绘制自定义符号" width="450px">}}
