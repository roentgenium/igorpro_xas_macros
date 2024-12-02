#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3
#pragma version=0.1

#include <Execute Cmd On List>

// XPSLoads: Igor Procedure for loading XRD data
// Author: ASAKURA, Hiroyuki
// Version: 0.2
// Last Update: 2024-11-24

Function ExtractFilenameforBL5S2(filename)
	String filename
	String regExp="([[:digit:]]+)\-([[:graph:]]+)\.txt"
	String/G timestamp, fname
	
	SplitString/E=regExp filename, timestamp, fname
End

// Load data file at BL5S2, AichiSR (Single)

Proc LoadBL5S2file()
	PauseUpdate; Silent 1
	
	String columnInfoStr = ""
	columnInfoStr += "N=twotheta;"
	columnInfoStr += "N=intensity;"
	columnInfoStr += "N=stddev;"
	
	LoadWave/Q/G/N/B=columnInfoStr

	ExtractFilenameforBL5S2(S_filename)

	AfterLoadingBL5S2File()
End

Function AfterLoadingBL5S2File()
	Wave twotheta, intensity, stddev
	SVAR fname
	Duplicate/O twotheta, $("x_"+fname); KillWaves twotheta
	Duplicate/O intensity, $("y_"+fname); KillWaves intensity
	Duplicate/O stddev, $("d_"+fname); KillWaves stddev
End

// Load data file at BL5S2, AichiSR (Multiple)

Proc LoadAllBL5S2XRDInFolder()
	PauseUpdate; Silent 1
	
	Variable dataFolder, fileType
	
	String columnInfoStr = ""
	columnInfoStr += "N=twotheta;"
	columnInfoStr += "N=intensity;"
	columnInfoStr += "N=stddev;"
	
	String cmd="LoadWave/Q/G/N/B=columnInfoStr/P=dataFolder \"%s\"; "
	cmd+="ExtractFilenameforBL5S2(S_filename); "
	cmd+="AfterLoadingBL5S2File()"
	
	NewPath/Q/O/M="Select the folder of your BL5S2 files to import" dataFolder
	String files= ListFilesOfBL5S2("dataFolder") 
	
	ExecuteCmdOnList(cmd,files)
End


Function/S ListFilesOfBL5S2(dataFolderStr)
	String dataFolderStr
	String files=""
	String fileType=".txt"

	files= IndexedFile($dataFolderStr,-1,fileType)

	return SortList(files, ";", 16)
End