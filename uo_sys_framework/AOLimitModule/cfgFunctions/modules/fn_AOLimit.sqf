#define COMPONENT AOLimit
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_Server_AOLIMIT_Allowed) exitwith {};
params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
	case "init": {
		if !is3DEN then {
			_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
			if !(_isActivated) exitWith {};
			private _selectedSides = [];
			if (_logic getVariable ["UO_FW_AOLimit_Blufor",true]) then {_selectedSides pushBackUnique west;};
			if (_logic getVariable ["UO_FW_AOLimit_Opfor",true]) then {_selectedSides pushBackUnique east;};
			if (_logic getVariable ["UO_FW_AOLimit_Indfor",true]) then {_selectedSides pushBackUnique resistance;};
			if (_logic getVariable ["UO_FW_AOLimit_Civilian",true]) then {_selectedSides pushBackUnique civilian;};
			if (_selectedSides isEqualTo []) exitwith {UO_FW_DEBUG("","No sides defined for AO limit!");};
			private _entryMode = _logic getVariable ["UO_FW_AOLimit_EntryMode",false];
			private _airsetting = _logic getVariable ["UO_FW_AOLimit_AirUnits",true];
			private _AOMode = _logic getVariable ["UO_FW_AOLimit_AOMode","HARD"];
			private _softAOtime = _logic getVariable ["UO_FW_AoLimit_SoftTimeOutside",30];
			private _softAOtimeAir = _logic getVariable ["UO_FW_AoLimit_SoftTimeOutsideAir",120];
			// The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)
			private _loc = getPosATL _logic;
			private _radiusX = _logic getVariable ["UO_FW_AOLimit_RadiusX",100];
			private _radiusY = _logic getVariable ["UO_FW_AOLimit_RadiusY",100];
			private _direction = getdir _logic;
			private _isRectangle = if ((typeof _logic) isEqualTo "UO_FW_AOLimitModule_R") then {true} else {false};
			private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];

			[_logic,_area,_selectedSides,_entryMode,_airsetting,_AOMode,_softAOtime,_softAOtimeAir] call UO_FW_fnc_AOLimitInit;
		};
	};
	case "attributesChanged3DEN": {
		private _logic = _input param [0,objNull,[objNull]];
		private _radiusX = _logic getVariable ["UO_FW_AOLimit_RadiusX",_logic getVariable ["UO_FW_AOLimit_RadiusX", 100]];
		private _radiusY = _logic getVariable ["UO_FW_AOLimit_RadiusY",_logic getVariable ["UO_FW_AOLimit_RadiusY", 100]];
		set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
	};
	default {};
};
true
