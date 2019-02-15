#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3
#pragma version=1.0

#include <Execute Cmd On List>

Function/S ExtractFilename(filename)
	String filename
	String fn
	fn = ReplaceString(".q", filename, "")
	filename = ReplaceString(".dat", fn, "")	
	return ParseFilePath(3, filename, ":", 0, 0)
End

//
// .nor
//

Proc Loadnorfile()
	PauseUpdate; Silent 1
	
	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
			Display
		endif
	endif

	LoadWave/Q/G/N/W
	String/G filename = ExtractFilename(S_filename)
	AfterLoadingnorFile()
End

Proc AfterLoadingnorFile()
	KillWaves nbkg, normW, fbkg, nder, nsec
	Duplicate/O eW, $("x_"+filename); KillWaves eW
	Duplicate/O flat, $("y_"+filename); KillWaves flat

	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
		AppendToGraph $("y_"+filename) vs $("x_"+filename)
		endif
	endif
End

Proc LoadAllnorSpectraInFolder()
	PauseUpdate; Silent 1
	
	Variable dataFolder, fileType
	String cmd="LoadWave/Q/G/N/W/P=dataFolder \"%s\"; "
	cmd+="String/G filename=ExtractFilename(S_filename); "
	cmd+="AfterLoadingnorFile()"
	
	NewPath/Q/O/M="Select the folder of your nor files to import" dataFolder
	String files= ListFilesOfnor("dataFolder") 
	
	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
			Display
		endif
	endif
	
	ExecuteCmdOnList(cmd,files)
End

Function/S ListFilesOfnor(dataFolderStr)
	String dataFolderStr
	String files=""
	String fileType=".nor"

	files= IndexedFile($dataFolderStr,-1,fileType)

	return SortList(files, ";", 16)
End

//
// .chik
// 

Proc Loadchikfile()
	PauseUpdate; Silent 1
	
	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
			Display
		endif
	endif

	LoadWave/Q/G/N/W
	String/G filename = ExtractFilename(S_filename)
	AfterLoadingchikFile()
End

Proc AfterLoadingchikFile()
	KillWaves win, chi, chik, chik2, energy
	Duplicate/O k, $("x_ED_"+filename); KillWaves k
	Duplicate/O chik3, $("y_ED_"+filename); KillWaves chik3

	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
		AppendToGraph $("y_ED_"+filename) vs $("x_ED_"+filename)
		endif
	endif
End

Proc LoadAllchikSpectraInFolder()
	PauseUpdate; Silent 1
	
	Variable dataFolder, fileType
	String cmd="LoadWave/Q/G/N/W/P=dataFolder \"%s\"; "
	cmd+="String/G filename=ExtractFilename(S_filename); "
	cmd+="AfterLoadingchikFile()"
	
	NewPath/Q/O/M="Select the folder of your chik files to import" dataFolder
	String files= ListFilesOfchik("dataFolder") 
	
	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
			Display
		endif
	endif
	
	ExecuteCmdOnList(cmd,files)
End

Function/S ListFilesOfchik(dataFolderStr)
	String dataFolderStr
	String files=""
	String fileType=".chik"

	files= IndexedFile($dataFolderStr,-1,fileType)

	return SortList(files, ";", 16)
End

//
// .chir
//

Proc Loadchirfile()
	PauseUpdate; Silent 1
	
	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
			Display
		endif
	endif

	LoadWave/Q/G/N/W
	String/G filename = ExtractFilename(S_filename)
	AfterLoadingchirFile()
End

Proc AfterLoadingchirFile()
	KillWaves win, chir_pha, deriv_pha
	Duplicate/O rW, $("d_FT_"+filename); KillWaves rW
	Duplicate/O chir_re, $("r_FT_"+filename); KillWaves chir_re
	Duplicate/O chir_im, $("i_FT_"+filename); KillWaves chir_im
	Duplicate/O chir_mag, $("p_FT_"+filename); KillWaves chir_mag

	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
		AppendToGraph $("p_FT_"+filename) vs $("d_FT_"+filename)
		endif
	endif
End

Proc LoadAllchirSpectraInFolder()
	PauseUpdate; Silent 1
	
	Variable dataFolder, fileType
	String cmd="LoadWave/Q/G/N/W/P=dataFolder \"%s\"; "
	cmd+="String/G filename=ExtractFilename(S_filename); "
	cmd+="AfterLoadingchirFile()"
	
	NewPath/Q/O/M="Select the folder of your chir files to import" dataFolder
	String files= ListFilesOfchir("dataFolder") 
	
	DoWindow /F XASImportConfigPanel
	if (V_flag == 1)
		ControlInfo /W=XASImportConfigPanel MakeGraphAutomatically
		if (V_Value == 1)
			Display
		endif
	endif
	
	ExecuteCmdOnList(cmd,files)
End

Function/S ListFilesOfchir(dataFolderStr)
	String dataFolderStr
	String files=""
	String fileType=".chir"

	files= IndexedFile($dataFolderStr,-1,fileType)

	return SortList(files, ";", 16)
End
