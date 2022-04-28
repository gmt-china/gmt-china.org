# GMT中文社区

[![Deploy](https://github.com/gmt-china/gmt-china.org/actions/workflows/deploy.yml/badge.svg)](https://github.com/gmt-china/gmt-china.org/actions/workflows/deploy.yml)

此项目是 [GMT中文社区](https://gmt-china.org) 主页的网站源码。

## 编译网站

社区主页用静态网站引擎 [Hugo](https://gohugo.io/) 构建，主题来自于
[Wowchemy](https://wowchemy.com/)。

1.  安装 Hugo

    Hugo 具有跨平台、易安装、速度快的特点。

    用户可以访问 Hugo 的 [Release](https://github.com/gohugoio/hugo/releases) 页面，
    根据自己的操作系统，下载以 `hugo_extended` 开头的安装包，解压得到二进制文件
    ``hugo`` 可直接使用。

2.  下载网站源码

    ```
    git clone --depth=5 https://github.com/gmt-china/gmt-china.org.git
    cd gmt-china.org/
    ```

3.  终端执行 `hugo server` 然后浏览器打开 `localhost:1313` 即可在本地查看网页效果

## 新增博文

博文位于 `content/blog` 目录下。每篇博文分别对应一个目录，
目录名为 `YYYY-mm-dd-URL`。博文正文、相关图片以及文件都放在该目录下。

博文内容使用 Markdown 格式书写，保存在博文目录下的 `index.md` 文件中。
需使用 UTF8 编码和 Linux 换行符。

`index.md` 文件的详细格式和语法请参考其他已有博文。
