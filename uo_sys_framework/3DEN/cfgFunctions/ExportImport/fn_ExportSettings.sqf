/*	Description: Exports UO_FW mission attributes to clipboard or profileNamespace
 *	Arguments:
 * 		STRING - Setting preset name, not used if copying to clipboard
 * 		BOOL - Clipboard mode, false saves profile name to profileNamespace
 *	Return Value:
 * 		ARRAY
 *	Author
 *		R3vo & PiZZADOX
 */

if (!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith {};
#define COMPONENT 3DEN
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

diag_log format ["ExportSettings params: %1",_this];
params [["_name",""],["_clipBoardMode",false]];

private ["_attributeValues","_sections"];
UO_FW_EXPORTSETTINGSSDEBUGMODE = true;
_attributeValues = [];

_sections = "!(((str(configname _x)) find 'UO_FW') isEqualto -1)" configClasses (Configfile >> "Cfg3DEN" >> "Mission");
{
	private _section = configName _x;
	if (UO_FW_EXPORTSETTINGSSDEBUGMODE) then {
		diag_log format ["foreach _section: %1",_section];
	};
	private _children = [configfile >> "Cfg3DEN" >> "Mission" >> _section >> "AttributeCategories",2,false] call BIS_fnc_returnChildren;
	if (UO_FW_EXPORTSETTINGSSDEBUGMODE) then {
		diag_log format ["_children: %1",_children];
	};
	{
		private _attributeName = "";
		_attributeName = getText (_x >> "data");
		private _attributeValue = _section get3DENMissionAttribute _attributeName;//By default get value by data config entry
		if (isNil "_attributeValue") then
		{
			_attributeName = configName _x;
			_attributeValue = _section get3DENMissionAttribute _attributeName;//If value is nil, try to get it by the attribute name
			if (isNil "_attributeValue") then
			{
				_attributeName = getText (_x >> "property");
				_attributeValue = _section get3DENMissionAttribute _attributeName;//If data is still nil, use property config entry
			};
		};
		if !(isNil "_attributeValue") then//If there are still values which are nil, they are either categories, internal oder never fully implemented attributes by BIS
		{
			_attributeValues pushBack [_section,_attributeName,_attributeValue];
		};
	} foreach _children;
} foreach _sections;

if (_clipBoardMode) then {
	copytoClipboard (str _attributeValues);
	diag_log "Mission settings copied to clipboard";
} else {
	private _profileArray = profileNamespace getvariable ["UO_FW_ProfileSettingsArray",[]];
	if (_profileArray isEqualto []) then {
		_profileArray pushback [_name,_attributeValues];
		profileNamespace setvariable ["UO_FW_ProfileSettingsArray",_profileArray];
		saveProfileNamespace;
	} else {
		private _findIfResult = _profileArray findif {((toLower (_x select 0)) isEqualto (toLower _name))};
		if (!((_findIfResult) isEqualto -1)) then {
			diag_log format ["preset _name: %1 already found in _profileArray!, setting option for overwrite",_name];
			[_profileArray,_name,_attributeValues,_findIfResult] spawn {
				params ["_profileArray","_name","_attributeValues","_findIfResult"];
				private _result = ["Setting Preset Name is already in profile, do you want to overwrite this preset?", "Overwrite Settings Preset", "Overwrite", true, (findDisplay 313)] call BIS_fnc_guiMessage;
				if (_result) then {
					_profileArray deleteat _findIfResult;
					_profileArray pushback [_name,_attributeValues];
					profileNamespace setvariable ["UO_FW_ProfileSettingsArray",_profileArray];
					saveProfileNamespace;
				};
			};
		} else {
			_profileArray pushback [_name,_attributeValues];
			profileNamespace setvariable ["UO_FW_ProfileSettingsArray",_profileArray];
			saveProfileNamespace;
		};
	};
};
