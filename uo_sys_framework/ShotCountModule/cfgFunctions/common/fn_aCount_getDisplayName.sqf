/*	Description: Gets Magazine Displayname for Ammo Count
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		TinfoilHate
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params ["_className"];
private _ret = "Error";
private _foundClass = UO_FW_aCount_classNames findIf {(_x select 0) isEqualto _className};
if (_foundClass isEqualto -1) then {
	private _cfg = (configFile >> "CfgMagazines" >> _className);
	_ret = 	getText(_cfg >> "displayName");
	UO_FW_aCount_classNames pushBack [_className,_ret];
} else {
	_ret = ((UO_FW_aCount_classNames select _foundClass) select 1);
};

_ret
