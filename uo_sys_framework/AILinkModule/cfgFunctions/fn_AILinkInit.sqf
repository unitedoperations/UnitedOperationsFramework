#define COMPONENT AILink
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(missionNamespace getVariable ["UO_FW_AILink_Enabled",false]) exitWith {};
["UO_FW_RegisterModuleEvent", ["AI link", "Shares targeting information between AI groups based on radios.", "TinfoilHate and Sacher"]] call CBA_fnc_globalEvent;
tin_AILink_startDelay 	= (missionNamespace getVariable ["UO_FW_AILink_StartDelay",30]);		//Delay in seconds when starting the mission until the first loop runs.
tin_AILink_shareDelay	= (missionNamespace getVariable ["UO_FW_AILink_ShareDelay",15]);		//Delay in seconds  between loops after the first.
tin_AILink_transDelay	= (missionNamespace getVariable ["UO_FW_AILink_TransDelay",10]);		//Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than tin_AILink_shareDelay.

tin_AILink_longRange 	= (missionNamespace getVariable ["UO_FW_AILink_LRRange",800]);	//Range if both groups have long-range radios, also used if tin_AILink_needRadio is false.
tin_AILink_shortRange 	= (missionNamespace getVariable ["UO_FW_AILink_SRRange",400]);	//Range if both groups have short-range radios.

tin_AILink_needRadio	= (missionNamespace getVariable ["UO_FW_AILink_NeedRadio",false]);;	//Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.
tin_AILink_maxKnows		= (missionNamespace getVariable ["UO_FW_AILink_MaxKnows",3.5]);;		//The maximum amount that knowsAbout will be set to via this script.

tin_AILink_debug 		= (missionNamespace getVariable ["UO_FW_AILink_Debug",false]);;	//Debug Information; Very spammy.

if (!hasInterface) then {
    [{call UO_FW_fnc_AILink},[],tin_AILink_startDelay] call CBA_fnc_waitAndExecute;
}
