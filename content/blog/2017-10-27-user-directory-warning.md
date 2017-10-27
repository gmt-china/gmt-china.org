---
title: GMT 5 在 Windows 下提示无法创建用户目录的解决办法
date: 2017-10-27
categories:
    - GMT技巧
authors:
    - 赵志远
slug: user-directory-warning
---

由于某些不明原因，在 Windows 下运行 GMT 5 的某些版本时总是提示

```
gmt: Unable to create GMT User directory : /Users/用户名/.gmt
gmt: Auto-downloading of earth_relief_##m|s.grd files has been disabled.
```

虽然大部分情况下并不影响程序的运行，但总是出现这些警告信息真的让我们很难受。在 GMT 官网搜索相关 [issue](http://gmt.soest.hawaii.edu/issues/1098) 时查到一种解决办法，如下所示

```
1、打开 “我的电脑”->“属性”->“高级系统设置”->“环境变量”
2、新建 “系统变量”
     变量名： HOME
     变量值： C:\Users\用户名\.gmt
```

重新运行脚本检查问题是否得到解决。
