call compile preProcessFileLineNumbers "\x\UO_FW\addons\Main\Core\cfgXEH\Settings\CBA_settings.sqf";

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"

INFO_1("Framework Server setting: %1",UO_FW_Server_Framework_Allowed);

if (!UO_FW_Server_Framework_Allowed) exitWith {
	INFO("Framework is disabled in Server settings, exiting");
};

if !(UO_FW_GETMVALUE(UO_FW_Enabled,false)) exitWith {
	INFO("Framework is disabled in mission settings, exiting");
};

INFO("Initializing Framework");

UO_FW_Framework_Initialized = false;

LOG("Global Pre Init");

[] call UO_FW_fnc_setDefaults;

["UO_FW_EntityAttributeLoad", {
	params ["_object", "_propertyName", "_value", ["_isGlobal",false,[false]]];
	_object setvariable [_propertyName,_value,_isGlobal];
}] call CBA_fnc_addEventHandler;
