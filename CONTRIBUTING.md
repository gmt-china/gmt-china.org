# 贡献指南

## 在本地构建网站

社区主页用静态网站引擎 [Hugo](https://gohugo.io/) 构建，主题来自于
[hugo-academic](https://github.com/gcushen/hugo-academic)。

1.  安装 Hugo

    Hugo 具有跨平台、易安装、速度快的特点。

    对于Linux & Windows 用户，直接到 [Release](https://github.com/gohugoio/hugo/releases)
    页面下载平台对应的安装包，解压得到一个二进制文件，即可使用。

    macOS 用户：

        brew update && brew install hugo

2.  下载网站源码

    ```
    git clone --recursive https://github.com/gmt-china/gmt-china.org.git
    cd gmt-china.org/
    ```

3.  终端执行 `hugo server` 然后浏览器打开 `localhost:1313` 即可在本地查看网页效果

## GMT用户分布图

### 添加新用户

添加新用户时需要提供如下信息：

1. 机构名称
2. 所在城市
3. 经纬度

用户信息保存在 `content/user-map.json` 中。由于 json 格式不友好，新增用户时
应直接向 `content/user-map.toml` 中添加，再使用 `content/toml2json.py` 将 TOML
文件转换为JSON文件。

`content/user-map.toml` 的基本格式为:

```
[[user]]
name = " 中国科学技术大学 地球和空间科学学院"
city = " 合肥市"
coordinates = [117.270375, 31.841339]
```

### 经纬度信息

经纬度信息需要通过[谷歌地图](http://www.google.cn/maps)获取。

这是因为根据中国法律，所有地图和实际情况都必须有所偏移，真实的经纬度不能和地图匹配。
我们使用的是谷歌地图，所以只能通过谷歌地图获取经纬度。

打开谷歌地图之后，找到自己单位的位置，鼠标点击单位所在位置，右键菜单中点击『这儿有什么？』，
网页下方就会出现经纬度信息。

## 添加贡献者

若想在社区首页的贡献者列表中出现，需要向 `content/author` 中添加贡献者信息。

必须提供的信息包括：

- 用户名 （可以是真名或昵称）
- 姓名（可以是真名或昵称）

选择性提供的信息包括：

- 当前身份/职位
- 一句话的自我简介
- 研究方向
- 学历信息
- 社交网站信息，如GitHub、个人网站、邮箱等
- 头像

具体格式可以参考 `content/author/seisman` 中的内容。

## 新增博文

博文位于 `content/blog` 目录下，每个博文有自己的一个目录，目录名为
`YYYY-mm-dd-URL`\ ，博文正文、相关图片以及文件都放在该目录下。

博文内容使用Markdown格式书写，保存在博文目录下的 `index.md` 文件中。

博文开头需要加上一些 frontmatter 信息:
```
---
title: "博文标题，如果有特殊符号，请加上双引号"
date: 2016-04-06
type: post
summary: 博文内容简介
categories:
    - 分类1
    - 分类2
tags:
    - 标签1
    - 标签2
authors:
    - 作者1
    - 作者2
---

这里是博文正文，请使用 markdown 格式。
```

若该目录下存在一个名为 `featured.jpg` 的图片，则该图片会在博文列表的右侧显示。

## 新增示例

### 示例内容

所有示例都位于 `content/example` 目录下，示例从 ex001 开始顺序编号。

每个文件夹包含一个示例。以示例1为例，示例1的文件夹为 `content/example/ex001/`。
该文件夹下需要包含如下信息：

1.  说明文件 `index.md` （必须，详细格式见下面）
2.  绘图脚本，文件名格式为 `XXX.GMT5.sh`，目前可以接受GMT5、GMT6的bat和bash脚本
3.  生成的图片 `xxx.png` （必须，以PNG格式为主，如果JPG格式的图片更小，也可以）
4.  绘图所需数据 `xxx.dat` （可选，数据应尽量小）
5.  其他地学数据 `xxx.dat` （如果数据可重复利用，比如国界数据，可以将数据放在
    `content/data` 目录下并在此做软链接）

### 示例说明文件书写要求

示例要遵守 markdown 语法和社区的格式要求，并包含对绘图意义的说明、对所用核心模块的
关键语法简单描述、绘图脚本、图片和绘图必须的数据等。

示例说明文件的模板通常如下：
```
---
title: "这里是标题"
date: 2016-10-03
type: post
summary: 博文简介
tags:
    - 标签1
    - 标签2
authors:
    - 作者1
    - 作者2
images:
    - xxx1.png
    - xxx2.png
commands:
    - psbasemap
    - pscoast
---

以下是说明文档的正文部分，请包括如下信息：

1. 这张图画的是什么
2. 对绘图所使用的核心模块及其核心选项要进行简单描述，要简要说明其功能和原理。

{{< gmt-code "figname_prefix" >}}

{{< figure src="/example/ex001/xxx1.png" title="图片标题" >}}
```

注意事项：

1. 文件应使用UTF8编码和Linux换行符
2. `images` 中列出的图片会展示在 [gallery](http://gmt-china.org/gallery/) 中
3. `commands` 中可列出当前脚本主要使用的命令
3. `gmt-code` 用于将脚本的内容插入到博文中，脚本的路径格式为 `xxx.sh`
5. `figure` 用于将图片插入到博文中，图片的路径格式为 `/example/ex001/xxx.png`

### 绘图脚本规范

脚本示例如下:
```
#!/bin/bash

PS=example.ps

gmt set XXX
# ======= 描述接下来一段脚本的主要用途 ====
# psbasemap用于绘制底图
gmt psbasemap ...
gmt pscoast ...
# -Sa选项的输入数据格式为xxx
gmt psxy -Sa ...

# ======= 描述接下来一段脚本的主要用途 ====
gmt psxy ...
gmt pxtext ...

gmt psxy -J -R -O -T >> $PS
gmt psconvert -A -P -Tg $PS
rm gmt.*
```

1. 推荐使用Bash，也可以使用bat或Perl等语言；
2. GMT5脚本必须严格遵循GMT5语法，不得使用GMT4语法；
3. GMT6脚本必须使用现代模式，不得使用经典模式；
3. 加入必要的注释信息，说明某个代码段、某个命令选项的功能及其他重要信息；
4. 对命令的简要解释要在这部分命令的前一行；
6. 图片的 PS 文件名需要用变量表示，变量名为 `$PS`
7. 脚本最后要使用 `gmt psconvert -A -Tg $PS` 将图片转换为PNG格式
8. 脚本最后使用 `rm -r gmt.*` 删除GMT临时文件
9. 若一行命令太长，可使用反斜杠换行，并且脚本的行数要尽量小；
10. 需要缩进时，应使用四个空格；
