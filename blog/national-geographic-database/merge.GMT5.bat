REM 将A49分幅的gdb数据转为一组shp格式的文件，文件夹命名为Merged
REM 编码为UTF-8以正确显示属性字段中的中文
ogr2ogr -f "ESRI Shapefile" -lco encoding=UTF-8 Merged A49.gdb

REM 将当前目录下所有的gdb数据追加Merged，同类shp文件合并。
for /f %%i in ('dir /s/b "*.gdb"') do (
ogr2ogr -f "ESRI Shapefile" -update -append Merged %%i
)
