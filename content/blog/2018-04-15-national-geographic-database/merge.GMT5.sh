#!/bin/bash
file="./final/merge.shp"
for i in $(ls *.shp)
do
 if [ -f "$file" ]
      then
           echo "creating final/merge.shp" 
           ogr2ogr -f ‘ESRI Shapefile’ -update -append $file $i -nln merge
      else
           echo "merging……"
      ogr2ogr -f 'ESRI Shapefile' $file $i
fi
done