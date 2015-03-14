﻿iniAllActions.="Get_Clipboard|" ;Add this action to list of all actions on initialisation

runActionGet_Clipboard(InstanceID,ElementID,ElementIDInInstance)
{
	global
	
	if %ElementID%All=0
	{
		tempClipboardAll:=ClipboardAll
		v_SetVariable(InstanceID,v_replaceVariables(InstanceID,%ElementID%Varname),tempClipboardAll,binary)
	}
	else
	{
		v_SetVariable(InstanceID,v_replaceVariables(InstanceID,%ElementID%Varname),Clipboard)
	}
	

	MarkThatElementHasFinishedRunning(InstanceID,ElementID,ElementIDInInstance,"normal")
	return
}
getNameActionGet_Clipboard()
{
	return lang("Get Clipboard")
}
getCategoryActionGet_Clipboard()
{
	return lang("Variable")
}

getParametersActionGet_Clipboard()
{
	global
	parametersToEdit:=["Label|" lang("Variable_name"),"Text||Varname","Radio|1|All|" lang("Only Text") ";" lang("Everything (e.g. picture)")]
	
	return parametersToEdit
}

GenerateNameActionGet_Clipboard(ID)
{
	global
	
	return % lang("Get_Clipboard") "`n" lang("to %1%",GUISettingsOfElement%ID%Varname) 
	
}