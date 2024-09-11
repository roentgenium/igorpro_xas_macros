#pragma TextEncoding = "UTF-8"
// #pragma rtGlobals=3
#pragma version=1.0

// XPSLoads: Igor Procedure for loading XPS data
// Author: ASAKURA, Hiroyuki
// Version: 0.1
// Last Update: 2021-05-20

//
// Load XPS file from ESCA-3400 (single)
//

Proc LoadXPSfile()

	// Initializing...
	PauseUpdate; Silent 1
	
	// Load XPS file
	LoadWave/O/D/G/A/Q
	String/G identifier = StringFromList(0, S_filename, "_")
	String/G samplename = StringFromList(1, S_filename, "_")
	String/G region = StringFromList(2, S_filename, "_")
	AfterLoadingXPSFile()
End

Function AfterLoadingXPSFile()
	Variable i = 0
	Variable remainder
	SVAR region, identifier, samplename

	for(i=0;exists("wave"+num2str(i));i+=1)
		remainder = mod(i,4)
		int block = i / 4
		switch(remainder)
			case 1:
				Duplicate/O $("wave"+num2str(i)), $("BE_"+region+"_"+identifier+"_"+samplename+"_"+num2str(block))
				KillWaves $("wave"+num2str(i))
				break
			case 2:
				Duplicate/O $("wave"+num2str(i)), $(      region+"_"+identifier+"_"+samplename+"_"+num2str(block))
				KillWaves $("wave"+num2str(i))
				break
			default:
				KillWaves $("wave"+num2str(i))
				break
		endswitch
	endfor
End
