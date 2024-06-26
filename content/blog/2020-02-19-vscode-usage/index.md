---
title: "GMT脚本执行利器——VS Code"
date: 2020-02-19
type: post
authors:
    - 刘珠妹
    - 赵志远
categories:
    - GMT技巧
tags:
    - Windows
    - Linux
    - Mac
---

Visual Studio Code，简称vscode，是微软推出的一款免费、轻量且功能强大的编辑器。vscode除一键执行、语法高亮、分屏显示外，还可实现bat/bash脚本的顺滑切换运行、jpg/gif/pdf等成图结果实时预览、脚本报错信息显示，非常适合全平台下执行GMT脚本。

**注：vscode是跨平台软件，支持linux/Mac/Windows平台。本文以windows为例介绍其使用方法。**

## vscode安装

vscode下载地址为：[官网](https://code.visualstudio.com/Download)

安装中建议勾选下图中两项，目的是添加右键打开的快捷方式。

{{< figure src="vscode_pic1.png"  width="600px">}}

安装完成之后有三种打开vscode的方式：

1. 开始菜单中，直接找到Visual Studio Code应用程序打开。
2. 直接在对应脚本或工作文件夹点击右键，选择“**通过Code打开（Open with Code）**”。
3. `Ctrl+R`打开运行窗口，输入`code` (前提是重启后，vscode已加入PATH路径)。

## 插件安装

vscode通过不同功能的插件实现代码的开发运行、图片文件的预览等等一系列功能。执行GMT脚本命令，推荐安装的插件包括：

- **Code Runner** 支持代码一键运行
- **vscode-pdf** pdf预览插件

插件安装方式：打开**Extensions**扩展插件菜单，搜索对应插件，点击安装。安装成功之后，**Install**图标将变为**齿轮**，可点击该齿轮，修改插件属性。已安装启用的插件都可在**Extension**中查看设置。

{{< figure src="vscode_pic2.png"  width="700px">}}

在 Extensions 菜单中，点击 Code Runner 插件的**齿轮**图标，弹出菜单中选择“**Extension Settings**”，勾选以下三个选项。不勾选这三个选项可能会导致无法正确执行 GMT 脚本。

{{< figure src="vscode_pic3.jpg" width="700px">}}

## vscode执行GMT脚本过程

GMT脚本建议在独立工作空间（文件夹）中执行，有以下两种方式：

- 在vscode中的Explore资源管理器菜单，选择“**打开文件夹**“：

{{< figure src="vscode_pic4.png" width="500px">}}

- 或者，在文件夹上右键，选择“**通过Code打开**”：

   {{< figure src="vscode_gif1.gif"  width="700px">}}

   含有中文的脚本需要设置编码为GB2312，否则会出现乱码：点击右下角的编码按钮，
   再选择“**重新打开编码（Reopen with Encoding）**”，选择**中文简体GB2312**编码。

   {{< figure src="vscode_pic5.png" width="700px">}}

   执行脚本可选择脚本页面右上方三角符号（Alt+F1），脚本运行信息显示在下方Terminal终端窗体。若想同时预览生成结果，可增加编辑窗口（Split Editor），两个窗口分别显示脚本和运行结果。

   {{< figure src="vscode_gif2.gif"  width="700px">}}

   若本机安装了Bash终端，vscode也可识别并自动选择bash终端来执行bash脚本。也可通过手工切换，或多个终端切换执行：

   {{< figure src="vscode_pic6_1.jpg"  width="700px">}}

   {{< figure src="vscode_pic6_2.jpg"  width="700px">}}

   请注意，如果你运行的是 bat 脚本，请点击上图终端窗口的加号旁边的向下箭头，然后点击“选择默认配置文件”。在出现的选项中选择“Command Prompt”。绝对不要使用 PowerShell。

> 如果你运行的是 bash 脚本，则必须在 `gmt begin` 之前添加一行 `export GMT_SESSION_NAME=$$` ，否则脚本运行将出现错误。
> 详情请参阅[GMT中文手册的begin模块说明页面](https://docs.gmt-china.org/latest/module/begin/#unix-shell)

   为提高编码效率，推荐使用快捷键进行代码注释、代码运行、窗格切换等操作。键盘单击F1，调出vscode的命令面板，输入”shortcut“检索出快捷键编辑命令：

   {{< figure src="vscode_pic7.png"  width="700px">}}

   我们可以查询或自定义众多快捷键，包括但不限于行注释（Add Line Comment/Remove Line Comment）、窗口分割（View: Split Editor Down/Right/Up/Left）、窗口关闭（View：Close Editor）等。
