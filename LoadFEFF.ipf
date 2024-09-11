// LoadFEFF: Igor Procedure for loading FEFF XANES spectrum
// Author: ASAKURA, Hiroyuki
// Version: 0.1
// Last Update: 2013-01-04
//
// Have fun!
//

//
// Load FEFF xmu file (single)
//

Proc LoadFEFFxmufile()

	// Initializing...
	PauseUpdate; Silent 1
	
	// Load conv file
	String columnInfostr = ""
	columnInfostr += "C=1,T=2,N=energy;"
	columnInfostr += "C=1,T=2,N=energy_Fermi;"
	columnInfostr += "C=1,N=tmp2;"
	columnInfostr += "C=1,T=2,N=mu;"
	columnInfostr += "C=1,T=2,N=mu0;"
	columnInfostr += "C=1,N=tmp3;"
	LoadWave/Q/O/D/G/A/W/B=columnInfostr
	String/G name=ParseFilePath(0, S_Path, ":", 1, 0)
	String/G edge=ParseFilePath(0, S_Path, ":", 1, 1)
	AfterLoadingFEFFxmuFile()
	End

End

Proc AfterLoadingFEFFxmuFile()

	KillWaves tmp2, tmp3
	Duplicate/O energy, $("e_"+name+"_"+edge); KillWaves energy
	Duplicate/O energy_Fermi, $("eF_"+name+"_"+edge); KillWaves energy_Fermi
	Duplicate/O mu, $("mu_"+name+"_"+edge); KillWaves mu
	Duplicate/O mu0, $("mu0_"+name+"_"+edge); KillWaves mu0
	End

End

Proc LoadAllFEFFxmufilesInFolder()

	// Initialize
	PauseUpdate; Silent 1
	Variable dataFolder, fileType
	
	String columnInfostr = ""
	columnInfostr += "C=1,T=2,N=energy;"
	columnInfostr += "C=1,T=2,N=energy_Fermi;"
	columnInfostr += "C=1,N=tmp2;"
	columnInfostr += "C=1,T=2,N=mu;"
	columnInfostr += "C=1,T=2,N=mu0;"
	columnInfostr += "C=1,N=tmp3;"
	
	String cmd="NewPath/Q/O directory, \"%s\"; "
	cmd+="LoadWave/C/Q/O/D/G/A/W/B=columnInfostr/P=directory \"xmu.dat\"; "
	cmd+="String/G name=ParseFilePath(0, S_Path, \":\", 1, 0); "
	cmd+="String/G edge=ParseFilePath(0, S_Path, \":\", 1, 1); "
	cmd+="AfterLoadingFEFFxmuFile()"
	
	// Directroy Setting Dialog
	NewPath/O/M="Select the (parent) folder of your xmu files to import" dataFolder
	String files= ListPathsOfFEFFxmufiles("dataFolder") 
	ExecuteCmdOnList(cmd,files)

End

Function/S ListPathsOfFEFFxmufiles(dataFolderStr)

	// Initialize
	String dataFolderStr
	String paths=""

	// Get the File Paths
	paths = IndexedDir($dataFolderStr,-1,1)
	print paths
	return paths

End

//
// Load FEFF ldos file (single)
//

Proc LoadFEFFldosfile()

	// Initializing...
	PauseUpdate; Silent 1
	
	// Load conv file
	String columnInfostr = ""
	columnInfostr += "C=1,T=2,N=energy;"
	columnInfostr += "C=1,T=2,N=sDOS;"
	columnInfostr += "C=1,T=2,N=pDOS;"
	columnInfostr += "C=1,T=2,N=dDOS;"
	columnInfostr += "C=1,T=2,N=fDOS;"
	LoadWave/Q/O/D/G/A/W/B=columnInfostr
	String/G name=ParseFilePath(0, S_Path, ":", 1, 0)
	String/G edge=ParseFilePath(0, S_Path, ":", 1, 1)
	String/G ldosfile=RemoveEnding(S_filename, ".dat")
	AfterLoadingFEFFldosFile()
	End

End

Proc AfterLoadingFEFFldosFile()

	Duplicate/O energy, $(ldosfile+"_e_"+name); KillWaves energy
	Duplicate/O sDOS, $(ldosfile+"_sDOS_"+name); KillWaves sDOS
	Duplicate/O pDOS, $(ldosfile+"_pDOS_"+name); KillWaves pDOS
	Duplicate/O dDOS, $(ldosfile+"_dDOS_"+name); KillWaves dDOS
	Duplicate/O fDOS, $(ldosfile+"_fDOS_"+name); KillWaves fDOS
	End

End
