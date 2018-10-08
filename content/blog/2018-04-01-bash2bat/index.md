---
title: "将 Bash 脚本改成 Bat 脚本"
date: 2018-04-01
type: post
authors:
    - 赵志远
categories:
    - GMT技巧
tags:
    - Windows
    - Linux
---

社区提供的 GMT 绘图脚本多是基于 Linux 下的 bash 脚本，有相当一部分用户并不熟悉
bash，因此有必要介绍如何将 bash 脚本改成 Windows 下可用的 bat 脚本。

<!--more-->

简单来说，将 bash 脚本改成 bat 脚本需要注意以下几点：

1. 注释符号： `#` => `rem`
2. 设置变量： `PS=MAP.PS` => `set PS=MAP.PS`
3. 引用变量： `$PS` => `%PS%`
4. 删除文件： `rm gmt.*` => `del gmt.*`

使用编辑器搜索替换功能可以很方便地实现转换。
比如搜索 `#` 并全部替换为 `rem `，搜索 `$PS`、`$R`、`$J`
分别替换为 `%PS%`、`%R%`、`%J%`。

当然还有一些比较复杂的语句就需要你对 bat 脚本语言比较熟悉。

比如 bash 下的嵌套命令可以将一条命令的结果作为变量使用：

```bash
T1=$(gmt grdinfo world6m.grd -T1000)
gmt makecpt -Crainbow $T1 > 1.cpt
```

而在 bat 下可以用如下两种方法来实现：

```bat
rem 方法1
for /f %%i in ('gmt grdinfo world6m.grd -T1000') do set T1=%%i
gmt makecpt -Crainbow %T1% > 1.cpt

rem 方法2
gmt grdinfo world6m.grd -T1000 > tmp.txt
set /p T1=<tmp.txt
gmt makecpt -Crainbow %T1% > 1.cpt
```

再比如 bash 下可以非常方便的进行多段文本的输入

```bash
# 被 EOF 包起来的几行文本将作为 gmt plot 的输入
gmt plot -Sc0.5c -Gred -W0.5p,black << EOF
112.35 36.56
113.78 42.15
114.50 37.60
EOF
```

在 bat 下则只能将两行文本先写入到文本中，再将文本作为命令的输入

```bat
echo 112.35 36.56 > tmp
echo 113.78 42.15 >> tmp
echo 114.50 37.60 >> tmp
gmt plot tmp -Sc0.5c -Gred -W0.5p,black
```

最后，如果脚本中出现了 grep、cut、wc、cat 等命令，可以下载社区提供的
[UnixTools](/blog/unix-tools-for-windows/)
工具包并解压缩到 GMT 安装路径的 bin 目录下，需要注意的是 bash 脚本中的 awk
需要更改为 gawk，同时单引号需要改为双引号。

下面给出一个简单的 bash 脚本：

```bash
#!bin/bash
gmt begin example png
# 绘制底图
gmt basemap -R108/125/33/43 -JM6i -B3
gmt makecpt -Ctopo $(gmt grdinfo huabei.grd -T100) > huabei.cpt
# 绘制华北地形
gmt grdimage huabei.grd -Chuabei.cpt
# 绘制台站分布
gmt plot -St0.5c -Gblack << EOF
112 36
120 40
115 39
EOF

# 绘制 event.dat 中地震，从第二行开始提取第 4 列作为经度，提取第 3 列作为纬度
awk '{if (NR>1) print $4,$3}' event.dat | gmt plot -Sc0.4c -Gblack
# 删除临时文件
rm huabei.cpt
gmt end
```

按照上述方法修改成的 bat 脚本如下：

```bat
gmt begin example png
rem 绘制底图
gmt basemap -R108/125/33/43 -JM6i -B3
for /f %%i in ('gmt grdinfo huabei.grd -T100') do set T1=%%i
gmt makecpt -Ctopo %T1% > huabei.cpt
rem 绘制华北地形
gmt grdimage huabei.grd -Chuabei.cpt
rem 绘制台站分布
echo 112 36 > tmp
echo 120 40 >> tmp
echo 115 39 >> tmp
gmt plot tmp -St0.5c -Gblack

rem 绘制 event.dat 中地震，从第二行开始提取第 4 列作为经度，提取第 3 列作为纬度
gawk "{if (NR>1) print $4,$3}" event.dat | gmt plot -Sc0.4c -Gblack
rem 删除临时文件
del huabei.cpt tmp
gmt end
```
