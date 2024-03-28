+++
# A Demo section created with the Blank widget.
# Add more sections by duplicating this file and customizing to your requirements.

widget = "blank"  # See https://wowchemy.com/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 20  # Order that this section will appear.

title = '<i class="fas fa-download"></i> 下载'
subtitle = ""

[design]
  # Choose how many columns the section has. Valid values: 1 or 2.
  columns = "2"

[design.background]
  # Apply a background color, gradient, or image.
  #   Uncomment (by removing `#`) an option to apply it.
  #   Choose a light or dark text color by setting `text_color_light`.
  #   Any HTML color name or Hex value is valid.

  # Background color.
  # color = "navy"

  # Background gradient.
  # gradient_start = "DarkGreen"
  # gradient_end = "ForestGreen"

  # Background image.
  # image = "image.jpg"  # Name of image in `static/media/`.
  # image_darken = 0.6  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.
  # image_size = "cover"  #  Options are `cover` (default), `contain`, or `actual` size.
  # image_position = "center"  # Options include `left`, `center` (default), or `right`.
  # image_parallax = true  # Use a fun parallax-like fixed background effect? true/false

  # Text color (true=light or false=dark).
  text_color_light = false

[design.spacing]
  # Customize the section spacing. Order is top, right, bottom, left.
  # padding = ["20px", "0", "20px", "0"]

[advanced]
 # Custom CSS.
 css_style = ""

 # CSS class.
 css_class = ""
+++

{{% row "featurette" %}}

{{% col "col-12 col-sm-4" %}}
<div class="featurette-icon"><i class="fab fa-windows"></i></div>

**GMT v6.5.0**:
[64 位](https://mirrors.ustc.edu.cn/gmt/bin/gmt-6.5.0-win64.exe)
</br>
**Ghostscript 10.03.0**:
[64 位](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10030/gs10030w64.exe)
</br>
{{% /col %}}

{{% col "col-12 col-sm-4" %}}
<div class="featurette-icon"><i class="fab fa-linux"></i></div>

**GMT 源码**:
[v6.5.0](https://mirrors.ustc.edu.cn/gmt/gmt-6.5.0-src.tar.gz)
<br>
**GSHHG 数据**:
[v2.3.7](https://mirrors.ustc.edu.cn/gmt/gshhg-gmt-2.3.7.tar.gz)
<br>
**DCW 数据**:
[v2.1.2](https://mirrors.ustc.edu.cn/gmt/dcw-gmt-2.1.2.tar.gz)

{{% /col %}}

{{% col "col-12 col-sm-4" %}}
<div class="featurette-icon"><i class="fab fa-apple"></i></div>

**GMT v6.5.0 安装包**:
[Intel](https://mirrors.ustc.edu.cn/gmt/bin/gmt-6.5.0-darwin-x86_64.dmg) |
[ARM](https://mirrors.ustc.edu.cn/gmt/bin/gmt-6.5.0-darwin-arm64.dmg)
{{% /col %}}

{{% /row %}}

----

老版本的源码和安装包可以从 [GMT 科大镜像](https://mirrors.ustc.edu.cn/gmt)
以及其子目录 `bin` 和 `legacy` 下获取。
