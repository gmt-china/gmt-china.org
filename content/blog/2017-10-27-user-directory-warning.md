---
title: GMT 5 在 Windows 下提示无法创建用户目录的解决办法
date: 2017-10-27
categories:
    - GMT技巧
authors:
    - 赵志远
slug: user-directory-warning
---

某些情况下，在 Windows 下运行 GMT 5 时总是出现警告信息：

```
gmt: Unable to create GMT User directory : /Users/用户名/.gmt
gmt: Auto-downloading of earth_relief_##m|s.grd files has been disabled.
```

经社区维护人员讨论，确定这是一个 Windows 特有，但又不是所有人都会遇到的一个问题。

虽然大部分情况下并不影响程序的正常运行，但总是出现这些警告信息真的有点难受。在官网提交 [issue](https://gmt.soest.hawaii.edu/issues/1163) 后得到一种解决办法：

```
1、打开 “我的电脑”->“属性”->“高级系统设置”->“环境变量”
2、新建 “系统变量”
     变量名： HOME
     变量值： C:\Users\用户名
```

重现运行脚本检查问题是否得到解决。

经过测试， `HOME` 变量的值可以取任意盘符中任何已存在的文件夹，正常情况下，执行脚本后会生成 `%HOME%/.gmt/cache` 空文件夹。
