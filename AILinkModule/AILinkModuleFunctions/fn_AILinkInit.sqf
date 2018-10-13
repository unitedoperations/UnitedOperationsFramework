_isEnabled = missionNamespace getVariable ["UO_FW_AILink_Enabled",false];
if(!_isEnabled) exitWith {};
["AI link", "Shares targeting information between AI groups based on radios.", "Sacher"] call UO_FW_FNC_RegisterModule;
tin_aiLink_startDelay 	= (missionNamespace getVariable ["UO_FW_AILink_StartDelay",30]);		//Delay in seconds when starting the mission until the first loop runs.
tin_aiLink_shareDelay	= (missionNamespace getVariable ["UO_FW_AILink_ShareDelay",15]);		//Delay in seconds  between loops after the first.
tin_aiLink_transDelay	= (missionNamespace getVariable ["UO_FW_AILink_TransDelay",10]);		//Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than tin_aiLink_shareDelay.

tin_aiLink_longRange 	= (missionNamespace getVariable ["UO_FW_AILink_LRRange",800]);	//Range if both groups have long-range radios, also used if tin_aiLink_needRadio is false.
tin_aiLink_shortRange 	= (missionNamespace getVariable ["UO_FW_AILink_SRRange",400]);	//Range if both groups have short-range radios.

tin_aiLink_needRadio	= (missionNamespace getVariable ["UO_FW_AILink_NeedRadio",false]);;	//Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.
tin_aiLink_maxKnows		= (missionNamespace getVariable ["UO_FW_AILink_MaxKnows",3.5]);;		//The maximum amount that knowsAbout will be set to via this script.

tin_aiLink_debug 		= (missionNamespace getVariable ["UO_FW_AILink_Debug",false]);;	//Debug Information; Very spammy.



if (!hasInterface) then
{
    [{call UO_FW_fnc_AILink},[],tin_aiLink_startDelay] call CBA_fnc_waitAndExecute;
}

