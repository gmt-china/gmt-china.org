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

GMT6 计划于今年年底正式发布。GMT6 完全兼容 GMT5 并新增了更易用的现代模式，
想要提前体验的可以按照如下说明安装 GMT6 的开发版。

<!--more-->

# Linux 平台

使用如下命令获取 GMT6 开发版源码：

```bash
$ git clone https://github.com/GenericMappingTools/gmt
```

获取源码之后，按照如下步骤即可安装。详细步骤可参考
《[Linux下安装GMT](https://docs.gmt-china.org/latest/install/linux/)》一文。

```
$ cd gmt
$ cp cmake/ConfigUserTemplate.cmake cmake/ConfigUser.cmake

# Edit cmake/ConfigUser.cmake [见《Linux下安装GMT》一文]

$ mkdir build
$ cd build
$ cmake ..
$ make -j
$ make -j install
```

GMT6 目前还处在密切的发布前更新中，如果想更新，可以在GMT源码目录下执行::

    git pull origin master

然后cd进入之前的build并执行::

    cmake ..
    make -j
    make -j install

# macOS 平台

macOS 用户建议用 [homebrew](https://brew.sh/) 安装软件。
这里提供了一个可以安装GMT6的formula文件：
<i class="fas fa-download"></i> [gmt6.rb](gmt6.rb)

下载后执行如下命令安装GMT6:
```
brew unlink gmt # 临时删除 GMT5
brew install --HEAD gmt6.rb # 安装 GMT6
```

从GMT6切换回GMT5:
```
brew unlink gmt6; brew link gmt
```

从GMT5切换回GMT6:
```
brew unlink gmt; brew link gmt6
```

GMT6 目前还处在密切的发布前更新中，如果想更新，可以先删除，再重新安装:
```
brew uninstall gmt6
brew install --HEAD gmt6.rb
```

# Windows 平台

Windows下可以直接使用开发版的GMT6安装包，该安装包会不定期更新。

安装包下载地址： http://w3.ualg.pt/~jluis/mirone/downloads/gmt.html

安装包文件名格式为 GMT-6.0.0_*.exe。
