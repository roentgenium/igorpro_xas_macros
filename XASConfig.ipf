#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3
#pragma version=1.0

Function MakeXASImportConfigPanel()
	PauseUpdate; Silent 1
	DoWindow /K XASImportConfigPanel
	NewPanel /K=1/N=XASImportConfigPanel/W=(60,100,300,200) as "Config"
	PopupMenu MakeGraphAutomatically value="Yes;No",pos={30,40}
	PopupMenu MakeGraphAutomatically help={"Make Graph Automatically?"}
	PopupMenu MakeGraphAutomatically title="Make graph automatically?"
	PopupMenu MakeGraphAutomatically mode=1
End