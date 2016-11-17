+++
title = "下载"
type = "page"
+++


## 软件下载

<div>
<ul class="nav nav-tabs" role="tablist">
{{% tablist-header title="Window用户" id="windows" status="active" %}}
{{% tablist-header title="Linux用户" id="linux" %}}
{{% tablist-header title="Mac用户" id="mac" %}}
</ul>

<div class="tab-content">
{{% tablist-body id="windows" status="active" %}}
- **GMT安装包**： [GMT 5.3.1 32位](http://mirrors.ustc.edu.cn/gmt/bin/gmt-5.3.1-win32.exe) [GMT 5.3.1 64位](http://mirrors.ustc.edu.cn/gmt/bin/gmt-5.3.1-win64.exe)
- **ghostscript安装包**： [gs 9.19 32位](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/gs919w32.exe) [gs 9.19 64位](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/gs919w64.exe)
- **gsview安装包**： [gsview 6.0](http://www.gsview.com/downloads/gsview_setup_6.0.exe)
- **UnixTools**: [UnixTools.zip](http://gmt-china.org/datas/UnixTools.zip)
{{% /tablist-body %}}

{{% tablist-body id="linux" %}}
- **GMT源码**： [GMT 5.3.1](http://mirrors.ustc.edu.cn/gmt/gmt-5.3.1-src.tar.gz)
- **GSHHG 全球海岸线数据**： [GSHHG 2.3.6](http://mirrors.ustc.edu.cn/gmt/gshhg-gmt-2.3.6.tar.gz)
- **DCW 数据**： [DCW 1.1.2](http://mirrors.ustc.edu.cn/gmt/dcw-gmt-1.1.2.tar.gz)
{{% /tablist-body %}}

{{% tablist-body id="mac" %}}
- **GMT 安装包**： [GMT 5.3.1 64位](http://mirrors.ustc.edu.cn/gmt/bin/gmt-5.3.1-darwin-x84_64.dmg)
{{% /tablist-body %}}
</div>
</div>

---

## 文档下载

### GMT 参考手册

- GMT 5.3.1：[在线阅读](http://docs.gmt-china.org) [PDF](https://github.com/gmt-china/GMT_docs/raw/doc-dev/GMT_docs-dev.pdf) [HTML](https://github.com/gmt-china/GMT_docs/raw/doc-dev/GMT_docs-dev.zip)
- GMT 5.2.1：[PDF](https://github.com/gmt-china/GMT_docs/releases/download/v5.2.1/GMT_docs-v5.2.1.pdf) [HTML](https://github.com/gmt-china/GMT_docs/releases/download/v5.2.1/GMT_docs-v5.2.1-HTML.zip)

### GMT 模块手册

- GMT 5.3.1：[在线阅读](http://modules.gmt-china.org) [PDF](https://github.com/gmt-china/GMT_modules/raw/doc-dev/GMT_modules-dev.pdf) [HTML](https://github.com/gmt-china/GMT_modules/raw/doc-dev/GMT_modules-dev.zip)
- GMT 5.2.1：[PDF](https://github.com/gmt-china/GMT_modules/releases/download/v5.2.1/GMT_modules-v5.2.1.pdf) [HTML](https://github.com/gmt-china/GMT_modules/releases/download/v5.2.1/GMT_modules-v5.2.1-HTML.zip)

---

## GMT相关工具下载

---

## 数据下载

### 地形起伏数据

| 数据源       			     | 空间分辨率     | 覆盖范围     | 陆地/海洋  |
|------------------------------|--------------|-------------|------------|
| [etopo1][etopo1]             | 1弧分         | 全球         | 陆地+海洋  |
| [GEBCO][GEBCO]               | 1弧分/30弧秒   | 全球         | 陆地+海洋  |
| [GTOPO30][GTOPO30]           | 30弧秒        | 全球         | 陆地       |
| [SRTM30_PLUS][SRTM30_PLUS]   | 30弧秒(约1km) | 纬度[-81,81] | 陆地+海洋  |
| [SRTM15_PLUS][SRTM15_PLUS]   | 15弧秒(约500m)| 纬度[-81,81] | 陆地+海洋  |
| [SRTM][SRTM]                 | 3弧秒(约90m)  | 纬度[-60,60] | 陆地       |
| ASTER GDEM                   | 1弧秒(约30m)  | 纬度[-83,83] | 陆地       |

[etopo1]: http://www.ngdc.noaa.gov/mgg/global/
[GEBCO]: http://www.bodc.ac.uk/data/online_delivery/gebco/
[GTOPO30]: ftp://edcftp.cr.usgs.gov/data/gtopo30/global/
[SRTM30_PLUS]: http://topex.ucsd.edu/WWW_html/srtm30_plus.html
[SRTM15_PLUS]: http://topex.ucsd.edu/WWW_html/mar_topo.html
[SRTM]:http://srtm.csi.cgiar.org/SELECTION/inputCoord.asp
