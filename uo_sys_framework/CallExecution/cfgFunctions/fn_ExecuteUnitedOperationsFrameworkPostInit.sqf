#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

//Module functions
if !(getMissionConfigValue["UO_FW_Enabled",false]) exitwith {};

//["","Initializing Framework"] call UO_FW_fnc_DebugMessageDetailed;

[] call UO_FW_FNC_postInit;
if (UO_FW_Server_AcreModule_Allowed) then {[] call UO_FW_FNC_AcreInit;};
if (UO_FW_Server_AcreModule_Allowed) then {[] call UO_FW_FNC_addRadiosInit;};
if (UO_FW_Server_Briefing_Allowed) then {[] call UO_FW_FNC_initBriefings;};
if (UO_FW_Server_AILink_Allowed) then {[] call UO_FW_FNC_AILinkInit;};
//if (UO_FW_Server_StartTextModule_Allowed) then {[] call UO_FW_FNC_StartTextInit;};
if (UO_FW_Server_JiPModule_Allowed) then {[] call UO_FW_FNC_JiPInit;};
if (UO_FW_Server_EndConditionModule_Allowed) then {[] call UO_FW_FNC_EndConditionsInit;};

//["","Finished Initializing Framework"] call UO_FW_fnc_DebugMessageDetailed;
UO_FW_Framework_Initialized = true;
INFO("Finished Framework Initialization");
