/*	Description: Gets synced task modules to a group.
 *	Arguments:
 * 		GROUP	- Group need to get tasks for
 * 	Return Value:
 * 		GROUP 	- Synchronised Task Modules
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp",["_AllowedModules",[],[[]]],["_AllowedSynced",[],[[]]],["_item",objNull,[objNull]],["_Allowed",false,[false]],"_j"];
	private _grpldr = leader _grp;
	if (!isNull assignedVehicle _grpldr) then {
		_item = assignedVehicle _grpldr;
	} else {
		_item = _grpldr;
	};
	private _synced = synchronizedObjects _item;	
	for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
		private _syncModule	= _synced select _j;
		if (_syncModule isKindOf "Logic") then {
			if (count _AllowedModules > 0) then {
				_Allowed = (typeof _syncModule) in _AllowedModules;
			} else {
				_Allowed = true;
			};
			if (_Allowed) then {
				_AllowedSynced pushBack _syncModule;
			};
		};
	};
	_AllowedSynced