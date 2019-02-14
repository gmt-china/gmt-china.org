---
title: "GMT6 的安装: 正式推出前体验 GMT6"
date: 2018-08-31
type: post
summary:
categories:
    - GMT技巧
authors:
    - 王亮
    - seisman
---

GMT 6 计划于今年年底正式发布。GMT 6 完全兼容 GMT 5 并新增了更易用的现代模式，想要提前体验的可以按照如下说明安装 GMT 6 的开发版。

<!--more-->

# Linux 平台


使用如下命令获取 GMT 6 开发版源码：

```bash
$ git clone https://github.com/GenericMappingTools/gmt
```

获取源码之后，按照如下步骤即可安装。详细步骤可参考《[Linux下安装GMT](https://docs.gmt-china.org/install/linux/)》一文。

```
$ cd gmt
$ cp cmake/ConfigUserTemplate.cmake cmake/ConfigUser.cmake

# Edit cmake/ConfigUser.cmake [见《Linux下安装GMT》一文]

$ mkdir build
$ cd build
$ cmake ..
$ make -jx
$ make -jx install
```

# macOS 平台

Mac 用户建议用 homebrew 安装软件。这里提供了一个GMT6的formula。

下载地址：https://gitlab.com/snippets/1749251/raw?inline=false

下载完成后执行如下命令：
````bash
brew unlink gmt # 删除 gmt5
brew install --HEAD gmt6.rb # 安装 gmt6
````

# Windows 平台

Windows下可以直接使用GMT6安装包。

安装包下载地址： http://w3.ualg.pt/~jluis/mirone/downloads/gmt.html

安装包文件名格式为 GMT-6.0.0_*.exe。
