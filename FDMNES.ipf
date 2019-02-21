// XASLoads: Igor Procedure for loading FDMNES convoluted XANES spectrum
// Author: ASAKURA, Hiroyuki
// Version: 0.0.1
// Last Update: 2009-10-04
//
// Have fun!
//

//
// Load FDMNES conv file (single)
//

Proc LoadFDMNESfile()

	// Initializing...
	PauseUpdate; Silent 1
	
	// Load conv file
	LoadWave/G/D/Q/O/W/A/K=0
	String/G filename=RemoveEnding(S_filename, ".txt")
	AfterLoadingFDMNESFile()
	End

End

Proc AfterLoadingFDMNESFile()

	Duplicate/O Energy, $("e_"+filename); KillWaves Energy
	Duplicate/O xanes_, $("i_"+filename); KillWaves xanes_
	End

End
