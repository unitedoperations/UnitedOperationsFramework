/*	Description: Puts player weapons on safe/lowered at mission start
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		Olsen & Sacher & PiZZADOX
 */

#define COMPONENT SafeStart
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

if (!hasInterface) exitWith {};
if !(UO_FW_Server_SafeStartModule_Allowed) exitWith {};
["Safe Start", "Extra safety for mission start", "Olsen"] call UO_FW_fnc_RegisterModule;

[{(!isNull player) && {(UO_FW_GearReady)}}, {
	if (!UO_FW_SafeStart_Enable) exitwith {};

	if (currentWeapon player != "") then {
		[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
	};

	if (UO_FW_SafeStart_Lowered) then {
		player action ["WeaponOnBack", player];
	};

	if (UO_FW_SafeStart_Unloaded) then {
		private _magazineClass = currentMagazine player;
		player setAmmo [currentWeapon player, 0];
		player addMagazines [_magazineClass, 1];
	};
}, []] call CBA_fnc_waitUntilAndExecute;
