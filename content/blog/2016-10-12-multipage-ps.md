+++
title = "生成多页PS/PDF文件"
date = "2016-10-12"
categories = ['GMT技巧']
tags = ["psconvert"]
authors = ['seisman']
slug = "multipage-ps"
+++

通常，在使用GMT画图时都是一个PS文件中保存一张图。因而，在需要画很多张同类型的图时，就需要生成很多个PS文件。比如要画1000个台站的波形数据，每张图只能放下20个波形，那么就需要写个循环画50张图，最终得到50个PS文件。有没有可能生成一个多页文件，每一页一张图呢？

常规的做法是：先生成一堆PS文件，然后利用 `gmt psconvert -TF -Fout.pdf *.ps`
将所有PS文件转换成一个多页PDF文件 `out.pdf` ，最后把生成的PS文件删除。

另一种做法是，直接生成一个多页PS文件，也就是把原来的脚本做小小的修改，使得所有绘图命令的输出都重定向到同一个PS文件中。比如，下面这个示例代码会生成10个PS文件，每个PS文件上写一个数字：

``` bash
#!/bin/bash

J=X10c/10c
R=0/10/0/10
for (( i = 0; i < 10; i++)); do
    PS=map_$i.ps
    gmt psxy -J$J -R$R -T -K > $PS
    echo 5 5 $i | gmt pstext -J$J -R$R -B1 -F+f50p -K -O >> $PS
    gmt psxy -J$J -R$R -T -O >> $PS
done
```

对上面的代码做一点微小的改动：
``` bash
#!/bin/bash

J=X10c/10c
R=0/10/0/10
PS=map.ps

[ -e $PS ] && rm $PS

for (( i = 0; i < 10; i++)); do
    gmt psxy -J$J -R$R -T -K >> $PS
    echo 5 5 $i | gmt pstext -J$J -R$R -B1 -F+f50p -K -O >> $PS
    gmt psxy -J$J -R$R -T -O >> $PS
done
```
改动主要有三点：

1. 将变量 `PS` 的定义放在了循环外部，意味着所有命令的输出都会保存到一个PS文件中
2. 第一个绘图命令的 `>` 改成了 `>>` ，以保证每次循环时不会新建PS文件
3. 循环开始前判断PS文件是否存在，若存在则删除，以避免多次执行脚本时将多次执行的结果写到同一个文件中

经过这样的改动之后，就生成了一个多页PS文件。可以使用`gmt psconvert -Tf map.ps`
将其转换为多页PDF文件。

{{% notice warning %}}
将多页PS文件转换为多页PDF文件时，`psconvert` 的 `-A` 和 `-P` 等选项无法使用。
{{% /notice %}}
