---
title: "《流浪地球》之GMT绘制三维地形轨迹图"
date: 2019-02-16
type: post
summary: '''
随着《流浪地球》这一硬核科幻巨作的热播，众网友也是见仁见智纷纷从各自领域去
考据其细节。热衷于作图的你们是否在一掠而过的镜头中发现了一个酷炫三维轨迹特效呢？
'''
authors:
    - eyou
images:
    - WanderingView.jpg

image:
  preview_only: true
---

<i class="fas fa-download"></i>
[CN-border-La.dat](CN-border-La.dat) |
[truck.png](truck.png) |
[cloud.jpg](cloud.jpg) |
[land.png](land.png)

**论文Top区管理委温馨提示:**

> 软件千万种，精通某一种
>
> 作图不规范，毕业两行泪

随着《流浪地球》这一硬核科幻巨作的热播，众网友也是见仁见智纷纷从各自领域去
考据其细节。热衷于作图的你们是否在一掠而过的镜头中发现了一个酷炫三维轨迹特效呢？
就是这个⬇⬇⬇⬇

![movie.gif](/example/ex024/movie.gif)

忽略这恢弘的风雪，我们可以把这个场景描述为“地形起伏叠加矢量区界限的行车轨迹三维图”。
如果硬要加个难度值，那就是地形被真实地貌（冰雪）覆盖。

下面我们使用GMT来模拟这个场景，所用GMT模块包括：
`grdcut`，`grdfilter`，`grdedit`，`grdview`，`grdtrack`，
`psxyz`，`psxy`，`pstext`，`psimage`

{{< gmt-code "WanderingView" >}}

成图效果：

![风雪图](/example/ex024/WanderingView.jpg)

为了模拟风雪场景，上图选了一张神之模糊的云海图（cloud.jpg）作为地貌纹理。使用卫星影像（land.png）替代上文，成图效果如下：

![卫星图](/example/ex024/WanderingLand.jpg)

## 延展：

将不同视角的图片制作为gif，就可以做出三维漫游的效果。具体可参考
[gallery/anim04](http://gmt.soest.hawaii.edu/doc/5.4.5/gallery/anim04.html#anim-04)。
如有兴趣，欢迎来稿探讨，先放一张效果图抛砖引玉。

![anim](/example/ex024/anim.gif)
