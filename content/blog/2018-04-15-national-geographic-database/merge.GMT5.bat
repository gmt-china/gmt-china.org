REM ��A49�ַ���gdb����תΪһ��shp��ʽ���ļ����ļ�������ΪMerged
REM ����ΪUTF-8����ȷ��ʾ�����ֶ��е�����
ogr2ogr -f "ESRI Shapefile" -lco encoding=UTF-8 Merged A49.gdb

REM ����ǰĿ¼�����е�gdb����׷��Merged��ͬ��shp�ļ��ϲ���
for /f %%i in ('dir /s/b "*.gdb"') do (
ogr2ogr -f "ESRI Shapefile" -update -append Merged %%i  
)