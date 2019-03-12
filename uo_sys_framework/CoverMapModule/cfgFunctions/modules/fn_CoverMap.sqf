#define COMPONENT CoverMap
#include "\x\UO_FW\addons\Main\script_macros.hpp"

params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
    case "init": {
        EXEC_CHECK(ALL);
        if !is3DEN then {
            if (!UO_FW_Server_CoverMapModule_Allowed) exitWith {};
            if !(GVAR(Enable)) exitWith {};
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            private _AOName = GETVAR(_logic,AOName,"Area0");
            _AOName = toLower(_AOName);
            private _AOZoom = GETVAR(_logic,ZoomLevel,0.4);
            private _loc = getPosATL _logic;
            private _radiusX = GETVAR(_logic,RadiusX,100);
            private _radiusY = GETVAR(_logic,RadiusY,100);
            private _direction = getdir _logic;
            private _area = [_loc,_radiusX,_radiusY,_direction,true];
            if (isNil QGVAR(AOArray)) then {
                GVAR(AOArray) = [[_AOName,_area,_AOZoom,_logic]];
            } else {
                GVAR(AOArray) pushback [_AOName,_area,_AOZoom,_logic];
            };
            publicvariable QGVAR(AOArray);
        };
    };
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = GETVAR(_logic,RadiusX,100);
        private _radiusY = GETVAR(_logic,RadiusY,100);
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
