/*	Description: Checks ACRE module values and sets options accordingly
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */
#define COMPONENT ACRE
#include "\x\UO_FW\addons\main\script_macros.hpp"
if (!UO_FW_ACRE_SETTINGS_ENABLED) exitwith {};

if(!isDedicated && hasinterface) then {
	[] spawn {
		private ["_side","_side_i","_radioTemp","_radioTempI","_radioType"];
		waitUntil {!isNull player};
		waitUntil {!isNull acre_player};
		waitUntil {[] call acre_api_fnc_isInitialized};
		_side = side player;
		_side_i = 3;
		switch (_side) do {
			case west:
			{
				_side_i = 0;
			};
			case east:
			 {
				_side_i = 1;
			};
			case independent:
			{
				_side_i = 2;
			};
			default {
				_side_i = 3;
			};
		};
		if(player getVariable ["UO_FW_ACRE_UNITSETTINGS_ENABLE",false]) then
		{
			_radioTemp = [["UO_FW_ACRE_BLUFOR_SR_TYPE","UO_FW_ACRE_BLUFOR_LR_TYPE","UO_FW_ACRE_BLUFOR_PK_TYPE"],
			["UO_FW_ACRE_OPFOR_SR_TYPE","UO_FW_ACRE_OPFOR_LR_TYPE","UO_FW_ACRE_OPFOR_PK_TYPE"],
			["UO_FW_ACRE_INDEPENDENT_SR_TYPE","UO_FW_ACRE_INDEPENDENT_LR_TYPE","UO_FW_ACRE_INDEPENDENT_PK_TYPE"],
			["UO_FW_ACRE_CIVILIAN_SR_TYPE","UO_FW_ACRE_CIVILIAN_LR_TYPE","UO_FW_ACRE_CIVILIAN_PK_TYPE"]];

			["","Setting Personal Settings"] call UO_FW_fnc_DebugMessageDetailed;
			_radioTempI = _radioTemp select _side_i;

			_radioType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select (missionNamespace getVariable [_radioTempI select 0,0]);
			if((player getVariable ["UO_FW_ACRE_SR_RADIO_ENABLED",false])) then {player addItem _radioType;};

			_radioType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select (missionNamespace getVariable [_radioTempI select 1,0]);
			if((player getVariable ["UO_FW_ACRE_LR_RADIO_ENABLED",false])) then {player addItem _radioType;};

			_radioType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select (missionNamespace getVariable [_radioTempI select 2,0]);
			if((player getVariable ["UO_FW_ACRE_PK_RADIO_ENABLED",false])) then {player addItem _radioType;};

		};
	};
};
