REM 灏咥49鍒嗗箙鐨刧db鏁版嵁杞负涓�缁剆hp鏍煎紡鐨勬枃浠讹紝鏂囦欢澶瑰懡鍚嶄负Merged
REM 缂栫爜涓篣TF-8浠ユ纭樉绀哄睘鎬у瓧娈典腑鐨勪腑鏂�
ogr2ogr -f "ESRI Shapefile" -lco encoding=UTF-8 Merged A49.gdb

REM 灏嗗綋鍓嶇洰褰曚笅鎵�鏈夌殑gdb鏁版嵁杩藉姞Merged锛屽悓绫籹hp鏂囦欢鍚堝苟銆�
for /f %%i in ('dir /s/b "*.gdb"') do (
ogr2ogr -f "ESRI Shapefile" -update -append Merged %%i  
)