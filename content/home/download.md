+++
# A Demo section created with the Blank widget.
# Any elements can be added in the body: https://sourcethemes.com/academic/docs/writing-markdown-latex/
# Add more sections by duplicating this file and customizing to your requirements.

widget = "blank"  # See https://sourcethemes.com/academic/docs/page-builder/
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
  # gradient_start = "DeepSkyBlue"
  # gradient_end = "SkyBlue"

  # Background image.
  # image = "headers/bubbles-wide.jpg"  # Name of image in `static/img/`.
  # image_darken = 0.6  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.

  # Text color (true=light or false=dark).
  text_color_light = false

[design.spacing]
  # Customize the section spacing. Order is top, right, bottom, left.
  #padding = ["20px", "0", "20px", "0"]

[advanced]
 # Custom CSS.
 css_style = ""

 # CSS class.
 css_class = ""

+++

{{% row "featurette" %}}

{{% col "col-12 col-sm-4" %}}

<div class="featurette-icon"><i class="fab fa-windows"></i></div>
**GMT v5.4.5**:
[32位](http://mirrors.ustc.edu.cn/gmt/bin/gmt-5.4.5-win32.exe) |
[64位](http://mirrors.ustc.edu.cn/gmt/bin/gmt-5.4.5-win64.exe)
</br>
**Ghostscript 9.26**:
[32位](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/gs926aw32.exe)
[64位](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/gs926aw64.exe)
</br>
**GSview 5.0**:
[32位](http://www.ghostgum.com.au/download/gsv50w32.exe)
[64位](http://www.ghostgum.com.au/download/gsv50w64.exe)
</br>
**UnixTools**:
[UnixTools.zip](/data/UnixTools.zip)
{{% /col %}}

{{% col "col-12 col-sm-4" %}}
<div class="featurette-icon"><i class="fab fa-linux"></i></div>
**GMT源码**:
[v5.4.5](http://mirrors.ustc.edu.cn/gmt/gmt-5.4.5-src.tar.gz)
<br>
**GSHHG数据**:
[v2.3.7](http://mirrors.ustc.edu.cn/gmt/gshhg-gmt-2.3.7.tar.gz)
<br>
**DCW数据**:
[v1.1.4](http://mirrors.ustc.edu.cn/gmt/dcw-gmt-1.1.4.tar.gz)
{{% /col %}}

{{% col "col-12 col-sm-4" %}}
<div class="featurette-icon"><i class="fab fa-apple"></i></div>
**GMT安装包**:
[v5.4.5](http://mirrors.ustc.edu.cn/gmt/bin/gmt-5.4.5-darwin-x86_64.dmg)
{{% /col %}}

{{% /row %}}
