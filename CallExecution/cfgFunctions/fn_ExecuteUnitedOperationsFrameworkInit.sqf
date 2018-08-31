"" spawn
{
	#include "\x\UO_FW\addons\main\script_macros.hpp"
	//waitUntil{!(isNil "UO_FW_ENABLED")};
	UO_FW_EXEC_CHECK(ALL)
	//if(!UO_FW_Enabled) exitWith {};
	["","Starting Framework"] call UO_FW_fnc_DebugMessageDetailed;
	_this call UO_FW_FNC_init;
	_this call UO_FW_FNC_GearInit;
	_this call UO_FW_FNC_AcreInit;
	//_this call UO_FW_FNC_debugInit
	_this call UO_FW_FNC_AIDriversInit;
	_this call UO_FW_FNC_antiNDInit;
	_this call UO_FW_FNC_AOLimitInit;
	_this call UO_FW_FNC_EvaluateEndConditions;
	_this call UO_FW_FNC_InitAILink;
	_this call UO_FW_FNC_InitAutoTrackAsset;
	_this call UO_FW_FNC_InitDisconnectControl;
	_this call UO_FW_FNC_initLoadArtilleryData;
	_this call UO_FW_FNC_InitMarkerControl;
	_this call UO_FW_FNC_InitStartText;
	_this call UO_FW_FNC_jipInit;
	_this call UO_FW_FNC_safeStartInit;
	_this call UO_FW_FNC_selfActionsInit;
	_this call UO_FW_FNC_shotCountInit;
	_this call UO_FW_FNC_SoftAOLimitInit;
	_this call UO_FW_FNC_StartInParachuteInit;
	_this call UO_FW_FNC_teamColourInit;

	["","Finished Initializing Framework"] call UO_FW_fnc_DebugMessageDetailed;
};

