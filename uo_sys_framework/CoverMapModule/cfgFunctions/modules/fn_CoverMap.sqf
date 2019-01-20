#define COMPONENT CoverMap
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
    case "init": {
        if !is3DEN then {
            if (!UO_FW_Server_CoverMapModule_Allowed) exitWith {};
            if (!UO_FW_CoverMap_Enable) exitWith {};
            _input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
            if !(_isActivated) exitWith {};

                private _AOName = _logic getVariable ["UO_FW_CoverMap_AOName","Area0"];
                private _AOZoom = _logic getVariable ["UO_FW_CoverMap_ZoomLevel",0.4];
                private _loc = getPosATL _logic;
                private _radiusX = _logic getVariable ["UO_FW_CoverMap_RadiusX",100];
                private _radiusY = _logic getVariable ["UO_FW_CoverMap_RadiusY",100];
                private _direction = getdir _logic;
                //_isRectangle = if ((typeof _logic) isEqualTo "UO_FW_CoverMapModule_R") then {true} else {false};
                private _area = [_loc,_radiusX,_radiusY,_direction,true];

                if (isNil "UO_FW_CoverMap_AO_Array") then {UO_FW_CoverMap_AO_Array = [];};
                UO_FW_CoverMap_AO_Array pushback [_AOName,_area,_AOZoom,_logic];
                publicvariable "UO_FW_CoverMap_AO_Array";

        };
    };
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = _logic getVariable ["UO_FW_CoverMap_RadiusX",_logic getVariable ["UO_FW_CoverMap_RadiusX", 100]];
        private _radiusY = _logic getVariable ["UO_FW_CoverMap_RadiusY",_logic getVariable ["UO_FW_CoverMap_RadiusY", 100]];
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
