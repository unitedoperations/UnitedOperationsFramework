#include "\x\UO_FW\addons\main\script_macros.hpp"
"" spawn
{
	//waitUntil{!(isNil "UO_FW_ENABLED")};
	//UO_FW_EXEC_CHECK(ALL)
	//if(!UO_FW_Enabled) exitWith {};
	UO_FW_EXEC_CHECK(ALL)
	_this call UO_FW_FNC_initBriefings;
	_this call UO_FW_FNC_setDefaults;
	_this call UO_FW_FNC_CaptureZoneDefs;
	_this call UO_FW_FNC_GVarSetupTimer;
};

