# 贡献指南

## 在本地构建网站

社区主页用静态网站引擎 [Hugo](https://gohugo.io/) 构建，主题来自于
[Wowchemy](https://wowchemy.com/)。

1.  安装 Hugo

    Hugo 具有跨平台、易安装、速度快的特点。

    对于Linux & Windows 用户，直接到 [Release](https://github.com/gohugoio/hugo/releases)
    页面下载平台对应的安装包，解压得到一个二进制文件，即可使用。

    macOS 用户：

        brew update && brew install hugo

2.  下载网站源码

    ```
    git clone --depth=5 https://github.com/gmt-china/gmt-china.org.git
    cd gmt-china.org/
    ```

3.  终端执行 `hugo server` 然后浏览器打开 `localhost:1313` 即可在本地查看网页效果

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

`includecode` 用于将脚本的内容插入到博文中，脚本的路径格式为 `xxx.sh`：

```
{{< includecode "xxx.sh" "bash" >}}
```

`figure` 用于将图片插入到博文中，图片的路径格式为 `/blog/20xx-xx-xx/xxx.png`：

```
{{< figure src="/blog/20xx-xx-xx/xxx.png" title="图片标题" >}}
```
