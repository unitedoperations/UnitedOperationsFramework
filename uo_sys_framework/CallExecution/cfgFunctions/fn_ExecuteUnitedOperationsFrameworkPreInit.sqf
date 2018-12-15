#include "\x\UO_FW\addons\main\script_macros.hpp"

	if(!(getMissionConfigValue  ["UO_FW_Enabled",false])) exitWith {};
	if(!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith {};
	_this call UO_FW_FNC_setDefaults;
