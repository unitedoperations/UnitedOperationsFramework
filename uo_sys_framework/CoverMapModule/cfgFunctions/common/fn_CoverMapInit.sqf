#define COMPONENT CoverMap
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);
if (!UO_FW_SERVER_COVERMAPMODULE_ALLOWED) exitWith {};
if (!UO_FW_CoverMap_Enable) exitWith {};

["Cover Map", "Covers map except specified area, allows switching between multiple AOs", "Blackhawk and PIZZADOX"] call UO_FW_FNC_RegisterModule;

if (!hasInterface) exitwith {};
private ["_DefaultAO"];
if !((player getvariable ["UO_FW_CoverMap_UnitDefaultAO",""]) isEqualto "") then {
	_DefaultAO = player getvariable ["UO_FW_CoverMap_UnitDefaultAO",""];
	if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
		ERROR_2("Default CoverMap for unit: %1 area: %1 does not exist!",player,_DefaultAO);
	};
} else {
	switch (side player) do {
		case west: {
			_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_West",""];
			if (_DefaultAO isEqualto "") exitwith {
				ERROR("No Default BLUFOR Area defined for CoverMap!");
			};
			if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
				ERROR_1("Default CoverMap BLUFOR area: %1 does not exist!",_DefaultAO);
			};
		};
		case east: {
			_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_East",""];
			if (_DefaultAO isEqualto "") exitwith {
				ERROR("No Default OPFOR Area defined for CoverMap!");
			};
			if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
				ERROR_1("Default CoverMap OPFOR area: %1 does not exist!",_DefaultAO);
			};
		};
		case resistance: {
			_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_West",""];
			if (_DefaultAO isEqualto "") exitwith {
				ERROR("No Default INDFOR Area defined for CoverMap!");
			};
			if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
				ERROR_1("Default CoverMap INDFOR area: %1 does not exist!",_DefaultAO);
			};
		};
		case civilian: {
			_DefaultAO = MissionNamespace getvariable ["UO_FW_CoverMap_DefaultAO_Civ",""];
			if (_DefaultAO isEqualto "") exitwith {
				ERROR("No Default Civilian Area defined for CoverMap!");
			};
			if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
				ERROR_1("Default CoverMap Civilian area: %1 does not exist!",_DefaultAO);
			};
		};
		default {};
	};
};

UO_FW_CoverMap_currentAO = _DefaultAO;
[_DefaultAO] call UO_FW_fnc_CoverMapBriefing;

[{(visibleMap)},{
	_this call UO_FW_fnc_CoverMapLive;
},_DefaultAO] call CBA_fnc_waitUntilAndExecute;

[{(!isNull player) && {time > 1}}, {
	if (MissionNamespace getvariable ["UO_FW_CoverMap_AllowSwitching",false]) then {
		if !((player getvariable ["UO_FW_CoverMap_UnitAONameArray",[]]) isEqualto []) then {
			private _MapChangeMenu = ["MapChangeMenu", "Switch Map", "", {}, {true}] call ace_interact_menu_fnc_createAction;
			[player, 1, ["ACE_SelfActions","ACE_Equipment"], _MapChangeMenu] call ace_interact_menu_fnc_addActionToObject;
			{
				private _AONameAllowed = _x;
				{
					_x params ["_AOName"];
					if (_AONameAllowed isEqualto _AOName) then {
						if (isNil "_AllowedCount") then {private _AllowedCount = 0;};
						private _condition = {
							params ["_target", "_player", "_params"];
							(visibleMap) && !(UO_FW_CoverMap_currentAO isEqualto (_params select 0)) && (MissionNamespace getvariable ["UO_FW_CoverMap_AllowSwitching",false])
						};
						private _statement = {
							params ["_target", "_player", "_params"];
							[(_params select 0)] call UO_FW_fnc_CoverMapLive;
						};
						private _actionName = format ["_MapChangeAction_%1",_AONameAllowed];
						private _tempAction = ["switch_MapAO", ("Switch Map to " + _AONameAllowed), "", _statement, _condition, {}, [_AONameAllowed]] call ace_interact_menu_fnc_createAction;
						MissionNamespace setvariable [_actionName,_tempAction];
						[player, 1, ["ACE_SelfActions","ACE_Equipment","MapChangeMenu"], (MissionNamespace getvariable _actionName) ] call ace_interact_menu_fnc_addActionToObject;
						_AllowedCount = _AllowedCount + 1;
						LOG_1("CoverMap action added for area: %1",_AONameAllowed);
					};
				} foreach UO_FW_CoverMap_AO_Array;
			} foreach UO_FW_CoverMap_UnitAONameArray;
		};
	};
}] call CBA_fnc_waitUntilAndExecute;
