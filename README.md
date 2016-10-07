# GMT中文社区

[![Build Status](https://travis-ci.org/gmt-china/gmt-china.org.svg?branch=master)](https://travis-ci.org/gmt-china/gmt-china.org)

## 本地构建

社区主页用静态网站引擎 [Hugo](https://gohugo.io/) 构建。

1.  安装 hugo

    Hugo 具有跨平台、易安装的特点。

    对于Linux & Windows 用户，直接到 [Release](https://github.com/spf13/hugo/releases) 页面下载平台对应的安装包，解压得到一个二进制文件，即可使用。

    Mac 用户：

        brew update && brew install hugo

2.  下载源码

    ```
    git clone https://github.com/gmt-china/gmt-china.org.git
    cd gmt-china.org/
    ```

3.  更新源码

    ```
    git pull
    ```

4.  本地查看网页效果

    终端执行 `hugo server` 然后浏览器打开 `localhost:1313` 即可。

5.  手动推送到 GitHub

    能够推送到 GitHub 的前提是有本repo的写权限。
    ```
    $ hugo
    $ ./deploy.sh
    ```

## 发布博文

一般博文位于 `content` 目录下，GMT示例位于 `example` 目录下。

## 作者列表

要想出现在 [作者列表](http://gmt-china.org/authors/) 页面，需要满足如下两个条件：

1.  发布任意一篇一般博文或GMT示例
2.  在 `data/authors.toml` 添加了作者信息

## GMT用户分布图

将信息加入到 `content/gmt-chinese-users.dat` 中并执行脚本 `GeoJSON.pl` 以生成 `content/gmt-chinese-users.json` 文件。
