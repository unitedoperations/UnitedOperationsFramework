#define COMPONENT Core
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

//Module functions
if !(getMissionConfigValue["UO_FW_Enabled",false]) exitwith {};

INFO_1("Framework Server setting: %1",UO_FW_SERVER_FRAMEWORK_ALLOWED);

if (!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith {
	//["","Framework is disabled by the Server."] call UO_FW_fnc_DebugMessageDetailed;
};

//["","Initializing Framework"] call UO_FW_fnc_DebugMessageDetailed;

[] call UO_FW_FNC_postInit;
if (UO_FW_SERVER_ACREMODULE_ALLOWED) then {[] call UO_FW_FNC_AcreInit;};
if (UO_FW_SERVER_ACREMODULE_ALLOWED) then {[] call UO_FW_FNC_addRadiosInit;};
if (UO_FW_SERVER_BRIEFING_ALLOWED) then {[] call UO_FW_FNC_initBriefings;};
if (UO_FW_SERVER_AILINK_ALLOWED) then {[] call UO_FW_FNC_AILinkInit;};
if (UO_FW_SERVER_AIDRIVERSMODULE_ALLOWED) then {[] call UO_FW_FNC_AIDriversInit;};
if (UO_FW_SERVER_DISCONNECTMODULE_ALLOWED) then {[] call UO_FW_FNC_DisconnectControlInit;};
if (UO_FW_SERVER_MARKERCONTROLMODULE_ALLOWED) then {[] call UO_FW_FNC_MarkerControlInit;};
if (UO_FW_SERVER_STARTTEXTMODULE_ALLOWED) then {[] call UO_FW_FNC_StartTextInit;};
if (UO_FW_SERVER_JIPMODULE_ALLOWED) then {[] call UO_FW_FNC_jipInit;};
if (UO_FW_SERVER_ENDCONDITIONMODULE_ALLOWED) then {[] call UO_FW_FNC_EndConditionsInit;};

//["","Finished Initializing Framework"] call UO_FW_fnc_DebugMessageDetailed;
UO_FW_Framework_Initialized = true;
INFO_1("Finished framework init, var value: %1",UO_FW_Framework_Initialized);
