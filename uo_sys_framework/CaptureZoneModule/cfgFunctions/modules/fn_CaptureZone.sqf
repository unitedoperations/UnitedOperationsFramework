#define COMPONENT CaptureZone
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params [["_mode","",[""]],["_input",[],[[]]]];
switch (_mode) do {
    // Default object init
    case "init": {
        if (!is3DEN) then {
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            private _zoneName = GETVAR(_logic,ZoneName,"");
            private _loc = getPosATL _logic;
            private _radiusX = GETVAR(_logic,RadiusX,100);
            private _radiusY = GETVAR(_logic,RadiusY,100);
            private _direction = getdir _logic;
            private _isRectangle = if ((typeof _logic) isEqualTo "UO_FW_CaptureZoneModule_R") then {true} else {false};
            private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
            private _repeatable = GETVAR(_logic,Repeatable,true);
            private _ratioNeeded = ((GETVAR(_logic,RatioNeeded,75)) / 100);
            private _BluforCap = (GETVAR(_logic,Blufor,0));
            private _OpforCap = (GETVAR(_logic,Opfor,0));
            private _IndforCap = (GETVAR(_logic,Indfor,0));
            private _CIVCap = (GETVAR(_logic,Civilian,0));
            private _BluforTime = (GETVAR(_logic,Blufor,30));
            private _OpforTime = (GETVAR(_logic,Opfor,30));
            private _IndforTime = (GETVAR(_logic,Indfor,30));
            private _CIVTime = (GETVAR(_logic,Civilian,30));
            private _BluforMessage = GETVAR(_logic,Message_Blufor,ARR_2("BLUFOR is capturing the zone!","BLUFOR has captured the zone!"));
            private _OpforMessage = GETVAR(_logic,Message_Opfor,ARR_2("OPFOR is capturing the zone!","OPFOR has captured the zone!"));
            private _IndforMessage = GETVAR(_logic,Message_Indfor,ARR_2("Independent is capturing the zone!","Independent has captured the zone!"));
            private _CIVMessage = GETVAR(_logic,Message_Civilian,ARR_2("Civilian is capturing the zone!","Civilian has captured the zone!"));
            private _ContestedMessage = GETVAR(_logic,ContestedMessage,"The zone is contested!");
            private _UncontestedMessage = GETVAR(_logic,UncontestedMessage,"The zone is uncontested!");
            private _colours = GETVAR(_logic,Colours,ARR_6("ColorBlue","ColorRed","ColorGreen","ColorYellow","ColorWhite","ColorKhaki"));
            private _hidden = GETVAR(_logic,Hidden,false);
            private _silent = GETVAR(_logic,Silent,false);
            private _automessages = GETVAR(_logic,AutoMessages,false);
            private _cond = GETVAR(_logic,Condition,true);
            [_logic,_zoneName,_area,_repeatable,[_BluforCap,_OpforCap,_IndforCap,_CIVCap],[_BluforTime,_OpforTime,_IndforTime,_CIVTime],[_BluforMessage,_OpforMessage,_IndforMessage,_CIVMessage,_ContestedMessage,_UncontestedMessage],_colours,_hidden,_silent,_automessages,_ratioNeeded,_cond] call FUNC(CaptureZoneLoop);
        };
    };
    // When some attributes were changed (including position and rotation)
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = GETVAR(_logic,RadiusX,100);
        private _radiusY = GETVAR(_logic,RadiusY,100);
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
