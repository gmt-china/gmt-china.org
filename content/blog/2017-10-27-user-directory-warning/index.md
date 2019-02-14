---
title: GMT5在Windows下提示无法创建用户目录的解决办法
date: 2017-10-27
type: post
summary: 如何解决“无法创建用户目录”的问题?
authors:
    - 赵志远
categories:
    - GMT技巧
tags:
    - Windows
---

GMT5的某些版本（<5.4.4）在某些特定的Windows下会出现如下警告信息：

```
gmt: Unable to create GMT User directory : /Users/用户名/.gmt
gmt: Auto-downloading of earth_relief_##m|s.grd files has been disabled.
```

这是一个Windows特有，但又不是所有人都会遇到的一个问题。出现该警告信息的本质原因
在于，当前系统没有定义环境变量 `HOME`，进而导致GMT无法知道当前计算机的主目录的
具体位置。

虽然大部分情况下并不影响程序的正常运行，但总是出现这些警告信息真的有点难受。
解决办法是：

```
1、打开 “我的电脑”->“属性”->“高级系统设置”->“环境变量”
2、新建 “系统变量”
     变量名： HOME
     变量值： C:\Users\用户名
```

重新运行GMT检查问题是否得到解决，可能需要重启计算机。

经测试，`HOME` 变量的值可以取任意盘符中任何已存在的文件夹，正常情况下，
执行脚本后会生成 `%HOME%/.gmt/cache` 空文件夹。
