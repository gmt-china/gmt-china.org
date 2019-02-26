---
title: 绘制自定义符号
date: 2017-10-13
type: post
authors:
    - 赵志远
images:
    - custom_symbol.png
    - def.png
commands:
    - psxy
---

GMT 官方目前内置了 40 个自定义符号，如下所示：

{{< figure src="/example/ex018/def.png" title="GMT 内置自定义符号" width="750px">}}

但是对于广大用户来说，这些自定义符号仍然远远无法满足需求。
因此，社区在[这里](https://github.com/gmt-china/GMT_custom_symbols)
持续更新一些常用的但还没有被 GMT 官方内置的自定义符号。
如果你觉得有其它实用的符号没有被包含进来，请向我们反馈，我们会酌情考虑。

GMT 在使用自定义符号时会按照顺序在如下目录中依次搜索自定义符号：

1. 当前目录，即运行脚本所在目录
2. Linux和Mac用户：`~/.gmt/custom`；Windows用户：`C:\Users\XXXX\.gmt\custom`
3. `$GMT_SHAREDIR/custom` 目录

因而用户可以下载社区提供的自定义符号并复制到以上任一路径即可使用这些自定义符号。
通常建议放在 `~/.gmt/custom` 目录（Linux和Mac用户）或 `C:\Users\XXXX\.gmt\custom` (Windows用户）
下。

绘制自定义符号脚本如下：

{{< gmt-code "custom_symbol" >}}

绘图效果如下：

{{< figure src="/example/ex018/custom_symbol.png" title="绘制自定义符号" width="750px">}}
