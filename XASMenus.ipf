#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3
#pragma version=1.0

Menu "XAFS"

	"Popup Config",/Q, MakeXASImportConfigPanel()
	
	Submenu "Load Athena files"
	
		"Load .nor file",/Q, Loadnorfile()
		"Load .xmu file",/Q, Loadxmufile()
		"Load .chik file",/Q, Loadchikfile()
		"Load .chir file",/Q, Loadchirfile()
		
		// "Load .peak file",/Q, LoadPeakfile()
		// "Load .chi3 file",/Q, Loadchi3file()
		// "Load .rsp file",/Q, Loadrspfile()
		// "Load .rmag file",/Q, Loadrmagfile()
		
		"Load .nor files",/Q, LoadAllnorSpectraInFolder()
		"Load .xmu files",/Q, LoadAllxmuSpectraInFolder()
		"Load .chik files",/Q, LoadAllchikSpectraInFolder()
		"Load .chir files",/Q, LoadAllchirSpectraInFolder()
		
		// "Load .peak files",/Q, LoadAllPeakSpectraInFolder()
		// "Load .chi3 files",/Q, LoadAllchi3SpectraInFolder()
		// "Load .rsp files",/Q, LoadAllrspSpectraInFolder()
		// "Load .rmag files",/Q, LoadAllrmagSpectraInFolder()
		
	End
	
	Submenu "Load FDMNES files"
	
		"Load conv file",/Q, LoadFDMNESfile()
	
	End

	Submenu "Load FEFF files"
	
		"Load xmu file",/Q, LoadFEFFxmufile()
	
	End

End
