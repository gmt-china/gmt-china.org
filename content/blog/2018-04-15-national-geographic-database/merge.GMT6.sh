#!/bin/bash
file="./final"
for i in $(ls -d *.gdb)
do
 if [ ! -d "$file" ]
      then
           echo "creating final filefolder" 
           ogr2ogr -f 'ESRI Shapefile' $file $i -lco encoding=UTF-8
      else
           echo "merging……"
      ogr2ogr -f 'ESRI Shapefile' $file $i -update -append
fi
done
