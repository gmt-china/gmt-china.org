import arcpy
infile = r"F:\results "
arcpy.env.workspace = infile
qry = '"GB" = 620201 or "GB" = 620202 or "GB" = 250200'

try:	
	arcpy.MakeFeatureLayer_management("BOUL.shp","BOUL_1")
	arcpy.SelectLayerByAttribute_management("BOUL_1","NEW_SELECTION",qry)
	arcpy.CopyFeatures_management("BOUL_1","BOUL_1.shp")
except:
	print "An error occured during selection"
