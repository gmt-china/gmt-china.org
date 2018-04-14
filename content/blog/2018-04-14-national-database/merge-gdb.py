import arcpy,os  
# 77个gdb数据库合并
def MergeFileGDB(inPath, outPath, outName):  
    arcpy.env.workspace = inPath  
    mergeFilePath = outPath + os.sep + outName  
    print mergeFilePath    
    
    workspaces = arcpy.ListWorkspaces("*", "FileGDB")    
    for workspace in workspaces:  
        print(workspace)  
        arcpy.env.workspace = workspace  
        mergeFileExist = os.path.exists(mergeFilePath)  
        if mergeFileExist:  
            featureclasses = arcpy.ListFeatureClasses()  
            for fc in featureclasses:  
                   arcpy.Append_management(fc, os.path.join(outPath + os.sep + outName, os.path.splitext(fc)[0]),"TEST","","")  

        else:  
            arcpy.CreateFileGDB_management(outPath, outName)  
            featureclasses = arcpy.ListFeatureClasses()  
            for fc in featureclasses:  
                arcpy.FeatureClassToFeatureClass_conversion(fc, outPath + os.sep + outName, os.path.splitext(fc)[0])  
                   
# 提取gdb数据库的所有shp图层
def gdb2shp(out_location,out_name) :
    arcpy.env.workspace = out_location + os.sep + out_name;
    print arcpy.env.workspace
    featureclasses = arcpy.ListFeatureClasses()
    for fc in featureclasses:
        arcpy.CopyFeatures_management(fc,out_location + os.sep + str(fc))
        print(fc)
		
in_file = r"F:\from"    
out_location = r"F:\results"  
out_name = "merge.gdb"  
MergeFileGDB(in_file, out_location,out_name)   
gdb2shp(out_location,out_name)
