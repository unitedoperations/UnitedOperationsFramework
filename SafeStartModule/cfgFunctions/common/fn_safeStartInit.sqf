/*	Description: Gives players custom self actions 
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		TinfoilHate & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT)

[{!isNull player}, {
	if (!UO_FW_SafeStart_Enable) exitwith {};
	["Safe start", "Extra safety for mission start", "Sacher"] call UO_FW_FNC_RegisterModule; 
	if (currentWeapon player != "") then {
		[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
	};
	
	if (UO_FW_SafeStart_Lowered) then {
		player action ["WeaponOnBack", player];
	};
	
	if (UO_FW_SafeStart_Unloaded) then {
		_magazineClass = currentMagazine player;
		player setAmmo [currentWeapon player, 0];
		player addMagazines [_magazineClass, 1];
	};
}, []] call CBA_fnc_waitUntilAndExecute;