/*
 * Author: Olsen & PiZZADOX
 *
 * Add module to list. Will not add additional/duplicate _name entries
 *
 * Arguments:
 * 0: name <string>
 * 1: description <string>
 * 2: author <string>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

params ["_name", "_description", "_author"];
if (isNil "ModuleDiaryEntries") then {ModuleDiaryEntries = []};
if !(_name in ModuleDiaryEntries) then {
	[_name,_description,_author] spawn {
		params ["_name", "_description", "_author"];
		ModuleDiaryEntries append [_name];
		player createDiaryRecord ["UO_FW_Menu", [_name,"<font size='16'>" + _name + "</font><br/>Description: " + _description + "<br/>by " + _author]];
	};
};
