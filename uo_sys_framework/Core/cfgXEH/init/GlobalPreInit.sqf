call compile preProcessFileLineNumbers "\x\UO_FW\addons\Main\Core\cfgXEH\Settings\CBA_settings.sqf";

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"

INFO_1("Framework Server setting: %1",UO_FW_Server_Framework_Allowed);

if (!UO_FW_Server_Framework_Allowed) exitWith {
	//["","Framework is disabled by the Server."] call UO_FW_fnc_DebugMessageDetailed;
	INFO("Framework is disabled in Server settings, exiting");
};

INFO("Initializing Framework");

UO_FW_EXEC_CHECK(ALL);
UO_FW_Framework_Initialized = false;

INFO("Global Pre Init");
[] call UO_FW_fnc_setDefaults;
