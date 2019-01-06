#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_SERVER_GEARMODULE_ALLOWED) exitwith {};

if (!isDedicated && hasinterface) then {
	
};
if (!hasinterface) then {
	if (UO_FW_GearSystem_Enabled) then {

	};
	if (UO_FW_Gear_Olsen_Enabled) then {

	};
};
