/*	Description: Set group to use flashlights.
 * 	Arguments:
 *		GROUP	- Group
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp"];
	{
		private _u = _x;
		private _items = _u weaponAccessories primaryWeapon _u;
		_u removePrimaryWeaponItem (_items select 1);
		private _nvg = hmd _u;
		if (count _nvg > 2) then {
			_u unassignItem "NVGoggles";
			_u removeItem "NVGoggles";
		};
		_u addPrimaryWeaponItem "acc_flashlight";
		_u enablegunlights "forceOn";
	} forEach (units _grp);
	true