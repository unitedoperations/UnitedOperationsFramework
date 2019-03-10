#define COMPONENT AOLimit
#include "\x\UO_FW\addons\Main\script_macros.hpp"

params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do {
    case "init": {
        EXEC_CHECK(ALL);
        if !(UO_FW_Server_AOLIMIT_Allowed) exitwith {};
        if !is3DEN then {
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            private _selectedSides = [];
            if (GETVAR(_logic,Blufor,true)) then {_selectedSides pushBackUnique west;};
            if (GETVAR(_logic,Opfor,true)) then {_selectedSides pushBackUnique east;};
            if (GETVAR(_logic,Indfor,true)) then {_selectedSides pushBackUnique independent;};
            if (GETVAR(_logic,Civilian,true)) then {_selectedSides pushBackUnique civilian;};
            if (_selectedSides isEqualTo []) exitwith {LOG("No sides defined for AO limit!");};
            private _entryMode = (GETVAR(_logic,EntryMode,false));
            private _airsetting = (GETVAR(_logic,AirUnits,true));
            private _AOMode = (GETVAR(_logic,AOMode,"HARD"));
            private _softAOtime = (GETVAR(_logic,SoftTimeOutside,30));
            private _softAOtimeAir = (GETVAR(_logic,SoftTimeOutsideAir,120));
            private _loc = getPosATL _logic;
            private _radiusX = (GETVAR(_logic,RadiusX,100));
            private _radiusY = (GETVAR(_logic,RadiusY,100));
            private _direction = getdir _logic;
            private _isRectangle = if ((typeof _logic) isEqualTo QGVAR(AOLimitModule_R)) then {true} else {false};
            private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];

            [_logic,_area,_selectedSides,_entryMode,_airsetting,_AOMode,_softAOtime,_softAOtimeAir] call FUNC(Init);
        };
    };
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = (GETVAR(_logic,RadiusX,100));
        private _radiusY = (GETVAR(_logic,RadiusY,100));
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
