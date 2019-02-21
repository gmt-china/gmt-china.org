---
title: 绘制自定义符号
date: 2017-10-13
type: post
authors:
    - 赵志远
images:
    - plot_def.png
    - def.png
commands:
    - psxy
---

GMT 官方目前内置了 40 个自定义符号，如下所示：

{{< figure src="/example/ex018/def.png" title="GMT 内置自定义符号" width="750px">}}

但是对于广大用户来说，这些自定义符号仍然远远无法满足需求。因此，社区将在[这里](https://github.com/gmt-china/GMT_custom_symbols)持续更新一些常用的但还没有被 GMT 官方内置的自定义符号。如果你觉得有其它实用的符号没有被包含进来，请向我们反馈，我们会酌情考虑。

GMT 官方内置的自定义符号可以直接引用，但是社区提供的自定义符号需要下载后复制到以下任意路径（按脚本搜索顺序排列）：

1. `current directory`，即运行脚本所在目录
2. `~/.gmt` 目录
3. `$GMT_SHAREDIR/custom` 目录。

绘制自定义符号脚本如下：

{{< gmt-code "plot_def" >}}

绘图效果如下：

{{< figure src="/example/ex018/plot_def.png" title="绘制自定义符号" width="750px">}}
