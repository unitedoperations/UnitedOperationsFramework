/*	Description: Performs the para drop of object.
 *	Arguments:
 *		STRING	- Classname of Resupply Item
 *		ARRAY	- Position to Drop
 *		NUMBER	- Drop Height
 *		BOOL	- Realism ON/OFF
 *		BOOL	- Vehicle Smoke ON/OFF
 *	Return Value:
 *		TRUE
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	params ["_uc","_pos",["_ph",500,[0]],["_pr",false,[false]],["_ps",true,[true]],["_v",objNull,[objNull]]];
	private _dloc = (_pos vectorAdd [0,0,_ph]);
	private _v = createVehicle [_uc,_dloc,[],0,"NONE"];
	[_v,_pr,_ps] call UO_AI_fnc_paraVehicle;
	true