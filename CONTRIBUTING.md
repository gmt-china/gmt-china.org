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
name = "中国科学技术大学 地球和空间科学学院"
city = "合肥市"
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

博文位于 `content/blog` 目录下，每个博文有自己的一个目录，
目录名为 `YYYY-mm-dd-URL`\ ，博文正文、相关图片以及文件都放在该目录下。

博文内容使用 Markdown 格式书写，保存在博文目录下的 `index.md` 文件中。
需使用 UTF8 编码和 Linux 换行符。

### 博文 Frontmatter

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

若博文目录下存在一个名为 `featured.jpg` 的图片，则该图片会在博文列表的右侧显示。

### 博文正文

`gmt-code` 用于将脚本的内容插入到博文中，脚本的路径格式为 `xxx.sh`\ ：

```
{{< gmt-code "figname_prefix" >}}
```

`figure` 用于将图片插入到博文中，图片的路径格式为 `/blog/20xx-xx-xx/xxx.png`\ ：

```
{{< figure src="/blog/20xx-xx-xx/xxx.png" title="图片标题" >}}
```


### 博文绘图脚本

请参考[GMT 中文手册：贡献指南](https://docs.gmt-china.org/latest/contributing/)
中描述的绘图示例风格，表写绘图脚本。

脚本示例如下:
```
#!/usr/bin/env bash
#
# 描述脚本的主要用途
#

gmt begin example png,pdf
gmt set xxx
# ======= 描述接下来一段脚本的主要用途 ====
# basemap 用于绘制底图
gmt basemap ...
gmt coast ...
# -Sa 选项的输入数据格式为 xxx
gmt plot -Sa ...

# ======= 描述接下来一段脚本的主要用途 ====
gmt plot ...
gmt text ...

gmt plot -J -R -O -T >> $PS
gmt end
```
