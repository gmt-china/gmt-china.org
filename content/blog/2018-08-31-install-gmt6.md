---
title: GMT 6 的安装 —— 正式推出前体验 GMT 6
date: 2018-08-31
categories:
    - GMT技巧
authors:
    - 王亮
    - 田冬冬
slug: install-gmt6
---

GMT 6 将在今年年底正式发布。GMT 6 完全兼容 GMT 5。

# Linux 平台

````bash
git clone https://github.com/GenericMappingTools/gmt
cd gmt
cp cmake/ConfigUserTemplate.cmake cmake/ConfigUser.cmake

#Edit cmake/ConfigUser.cmake [see comments in the file]. Then:

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -jx
#where x is the number of threads you want to use and depends on the number of cores in your CPU and if hyperthreading is available or not. cmake will build out-of-source in the the directory build. CMAKE_BUILD_TYPE can be one of: empty, Debug, Release, RelWithDebInfo or MinSizeRel
make -jx install
````

# OS X 平台

通常，Mac 用户都是用 brew 安装的：

下载辅助文件：https://gitlab.com/snippets/1749251/raw?inline=false

````bash
brew unlink gmt # 删除 gmt5
brew install --HEAD gmt6.rb # 安装 gmt6
````

# Windows 平台

下载地址：http://w3.ualg.pt/~jluis/mirone/GMT-6.0.0_r20419+MB-win64.exe
