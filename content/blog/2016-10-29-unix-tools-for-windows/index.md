---
title: "Windows 下可用的 Unix 工具"
date: 2016-10-29
type: post
summary: 我们为Windows用户提供了常用的Unix小工具。
authors:
    - SeisPider
categories:
    - GMT工具
tags:
    - Linux
    - Windows    
redirect: https://docs.gmt-china.org/latest/install/windows/#unixtools

---

<i class="fas fa-download"></i> [UnixTools.zip](/data/UnixTools.zip)

为满足 Windows 下的 GMT 用户对 Linux 工具的需求，我们将常用的 Linux
工具打包供 Windows 用户下载使用。

直接下载 UnixTools.zip 并将解压得到的 exe 文件复制到
GMT 的 bin 目录即可（比如默认的 `C:\programs\gmt5\bin`）。

软件包中包含如下程序：

1.   `cat`：显示文件内容
2.   `cut`：从指定文本中截取文本并输出至标准输出
3.   `gawk`：处理文本信息的编程语言工具
4.   `grep`：从指定文本或标准输入中识别并截取出特定字段等
5.   `head`：输出一个或多个指定文本的前n行
6.   `join`：将两个文件中文本一致的行连接并输出
7.   `md5sum`：检验文本的MD5摘要
8.   `paste`：并排输出两个文件的内容
9.   `printf`：按C语言格式输出文本
10.  `sed`：文本处理工具
11.  `sort`：对文本文档进行排序
12.  `split`：以行为单位切割文件
13.  `tail`：显示文件尾端的n行数据
14.  `uniq`：从文本中去除或禁止重复行
15.  `wc`：输出指定文件的行数、字数和文本数据大小

以上 Unix 工具均提取自 [MS4W](http://www.ms4w.com) 。

如果你发现某些工具存在问题，或者觉得有其他需要的 Unix 工具没有被包含进来，
请向我们反馈，我们会酌情考虑。
