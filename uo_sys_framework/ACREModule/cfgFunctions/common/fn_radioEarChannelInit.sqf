/*	Description: Checks ACRE module values and sets options accordingly
 *	Arguments:
 * 		N/A
 * 	Return Value:
 * 		ARRAY
 * 	Author
 * 		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"

if !(UO_FW_SERVER_ACREMODULE_ALLOWED) exitwith {};

if (hasInterface) then {
	[{(!isNull player) && (time > 1) && (isNull acre_player) && ([] call acre_api_fnc_isInitialized)}, {
	if (player getVariable ["UO_FW_ACRE_UNITSETTINGS_ENABLE", false]) then {
		waitUntil {[] call acre_api_fnc_isInitialized};
		{
			private _radioID = [_x] call acre_api_fnc_getRadioByType;
			if (!isNil "_radioID") then {
				private _result = (player getVariable ["UO_FW_ACRE_SR_RADIO_CHANNEL", "1"]) call BIS_fnc_parseNumber;
				if (_result < 0)then {
					[(player getVariable ["UO_FW_ACRE_SR_RADIO_CHANNEL", "1"]) + " is not a valid Channel Number", ""] call UO_FW_fnc_DebugMessageDetailed;
				} else {
					["", "Setting Personal Channel to " + (player getVariable ["UO_FW_ACRE_SR_RADIO_CHANNEL", "1"])] call UO_FW_fnc_DebugMessageDetailed;
					[_radioID, _result] call acre_api_fnc_setRadioChannel;
				};

				[_radioID, (["CENTER", "LEFT", "RIGHT"] select  (player getVariable ["UO_FW_ACRE_SR_RADIO_EAR", 0]))] call acre_api_fnc_setRadioSpatial;
			};
		} forEach ["ACRE_PRC343", "ACRE_SEM52SL"];

		{
			private _radioID = [_x] call acre_api_fnc_getRadioByType;
			if ( ! isNil "_radioID") then {
				private _result = (player getVariable ["UO_FW_ACRE_LR_RADIO_CHANNEL", "1"]) call BIS_fnc_parseNumber;
				if (_result < 0) then {
					[(player getVariable ["UO_FW_ACRE_LR_RADIO_CHANNEL", "1"]) + " is not a valid Channel Number", ""] call UO_FW_fnc_DebugMessageDetailed;
				} else {
					[_radioID, _result] call acre_api_fnc_setRadioChannel;
				};
				[_radioID, (["CENTER", "LEFT", "RIGHT"] select  (player getVariable ["UO_FW_ACRE_LR_RADIO_EAR", 0]))] call acre_api_fnc_setRadioSpatial;
			};
		} forEach ["ACRE_PRC148", "ACRE_PRC152"];

		{
			private _radioID = [_x] call acre_api_fnc_getRadioByType;
			if ( ! isNil "_radioID") then {
				private _result = (player getVariable ["UO_FW_ACRE_PK_RADIO_CHANNEL", "1"]) call BIS_fnc_parseNumber;
				if (_result < 0) then {
					[(player getVariable ["UO_FW_ACRE_PK_RADIO_CHANNEL", "1"]) + " is not a valid Channel Number", ""] call UO_FW_fnc_DebugMessageDetailed;
				} else {
					[_radioID, _result] call acre_api_fnc_setRadioChannel;
				};
				[_radioID, (["CENTER", "LEFT", "RIGHT"] select (player getVariable ["UO_FW_ACRE_PK_RADIO_EAR", 0]))] call acre_api_fnc_setRadioSpatial;
			};
		} forEach ["ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"];
	};

	}] call CBA_fnc_waitUntilAndExecute;
};
