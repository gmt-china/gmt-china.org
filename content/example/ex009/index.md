---
title: 绘制晨昏线及太阳位置
date: 2016-11-01
type: post
authors:
    - 虎哥
images:
    - solar.png
commands:
    - psxy
    - pssolar
redirect: https://docs.gmt-china.org/latest/module/solar/#gmt-solar-example
    
---

<i class="fas fa-download"></i>
[sunglasses.eps](/example/ex009/sunglasses.eps)

本文利用 GMT 5.3 中新增的 `pssolar` 模块绘制了晨昏线并计算得到太阳的位置，
同时利用 `psxy` 的新增功能，直接将 `eps` 格式的太阳图片绘制在指定位置。

{{< gmt-code "pssolar" >}}

{{< figure src="/example/ex009/solar.png" title="绘制晨昏线" >}}
