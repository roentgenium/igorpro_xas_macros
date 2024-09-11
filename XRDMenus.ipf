#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3
#pragma version=0.1

Menu "XRD"
	Submenu "Load XRD files"
		"Load BL5S2 file",/Q, LoadBL5S2file()
		"Load BL5S2 files",/Q, LoadAllBL5S2XRDInFolder()
	End
End
