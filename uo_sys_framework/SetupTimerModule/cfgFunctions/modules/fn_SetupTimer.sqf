#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
    case "init": {
        if (!is3DEN) then {
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            private _selectedSide = [west,east,resistance,civilian] select ((_logic getVariable ["UO_FW_SetupTimer_SideSelect",0]));
              private _time = _logic getVariable ["UO_FW_SetupTimer_Time",30];
            private _loc = getPosATL _logic;
            private _radiusX = _logic getVariable ["UO_FW_SetupTimer_RadiusX",100];
            private _radiusY = _logic getVariable ["UO_FW_SetupTimer_RadiusY",100];
            //_isRectangle = _logic getVariable ["UO_FW_SetupTimer_RectangleShape",false];
            private _direction = getdir _logic;
            private _isRectangle = if ((typeof _logic) isEqualTo "UO_SetupTimerModule_R") then {true} else {false};
            private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];

            [_logic,_area,_selectedSide,_time] call UO_FW_fnc_ExecuteSetupTimer;
        };
    };
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = _logic getVariable ["UO_FW_SetupTimer_RadiusX",_logic getVariable ["UO_FW_SetupTimer_RadiusX", 100]];
        private _radiusY = _logic getVariable ["UO_FW_SetupTimer_RadiusY",_logic getVariable ["UO_FW_SetupTimer_RadiusY", 100]];
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
