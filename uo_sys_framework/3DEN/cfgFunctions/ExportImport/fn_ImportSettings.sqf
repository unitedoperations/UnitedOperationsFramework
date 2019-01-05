/*	Description: Imports UO_FW mission attributes from clipboard or profilenamespace
 *	Arguments:
 * 		STRING - Setting preset name, not used if copying from clipboard
 * 		BOOL - Clipboard mode, false imports settings from named array from profileNamespace
 *	Return Value:
 * 		ARRAY
 *	Author
 *		R3vo & PiZZADOX
 */

diag_log format ["ImportSettings params: %1",_this];
params [["_name",""],["_clipBoardMode",false]];

if (_clipBoardMode) then {
	private _settingsArray = call compile copyFromClipboard;
	diag_log format ["_settingsArray: %1",_settingsArray];
	{
		diag_log format ["_x _this: %1",_x];
		_x params ["_section","_class","_value"];
		diag_log format ["_section: %1",_section];
		diag_log format ["_class: %1",_class];
		diag_log format ["_value: %1",_value];
		_section set3DENMissionAttribute [_class,_value];
	} foreach _settingsArray;
} else {
	private _profileArray = profileNamespace getvariable ["UO_FW_ProfileSettingsArray",[]];
	if (_profileArray isEqualto []) exitwith {};
	private _found = false;
	diag_log format ["_profileArray: %1",_profileArray];
	{
		_x params ["_nameArray","_settingsArray"];
		diag_log format ["_nameArray: %1",_nameArray];
		if (_nameArray isEqualto _name) exitwith {
			_found = true;
			diag_log format ["_settingsArray: %1",_settingsArray];
			{
				diag_log format ["_x _this: %1",_x];
				_x params ["_section","_class","_value"];
				diag_log format ["_section: %1",_section];
				diag_log format ["_class: %1",_class];
				diag_log format ["_value: %1",_value];
				_section set3DENMissionAttribute [_class,_value];
			} foreach _settingsArray;
			diag_log format ["loaded %1 settings preset!",_name];
		};
	} foreach _profileArray;
	if !(_found) exitwith {diag_log format ["settings preset %1 not found!",_name];};
};
