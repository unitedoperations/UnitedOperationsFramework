#define COMPONENT SetupTimer
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
    case "init": {
        if (!is3DEN) then {
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            private _selectedSide = [west,east,independent,civilian] select ((GETVAR(_logic,SideSelect,0)));
              private _time = GETVAR(_logic,Time,30);
            private _loc = getPosATL _logic;
            private _radiusX = GETVAR(_logic,RadiusX,100);
            private _radiusY = GETVAR(_logic,RadiusY,100);
            //_isRectangle = GETVAR(_logic,RectangleShape,false);
            private _direction = getdir _logic;
            private _isRectangle = if ((typeof _logic) isEqualTo "UO_SetupTimerModule_R") then {true} else {false};
            private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];

            [_logic,_area,_selectedSide,_time] call FUNC(ExecuteSetupTimer);
        };
    };
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = GETVAR(_logic,RadiusX,GETVAR(_logic,RadiusX,100));
        private _radiusY = GETVAR(_logic,RadiusY,GETVAR(_logic,RadiusY,100));
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
