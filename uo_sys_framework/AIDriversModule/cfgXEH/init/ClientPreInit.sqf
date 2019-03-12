/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */


#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);

[QGVAR(Enabled_Event), {
	params ["_vehicle","_allowNV","_allowFlip"];
	[_vehicle,_allowNV,_allowFlip] call FUNC(EnableAIDriver);
}] call CBA_fnc_addEventHandler;
