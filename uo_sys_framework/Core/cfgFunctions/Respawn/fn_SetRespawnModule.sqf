#define COMPONENT Respawn
#include "\x\UO_FW\addons\Main\script_macros.hpp"

params [["_mode","",[""]],["_input",[],[[]]]];
switch (_mode) do {
    // Default object init
    case "init": {
        EXEC_CHECK(SERVER);
        if (!is3DEN) then {
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            private _radiusX = GETVAR(_logic,RadiusX,100);
			private _radiusY = GETVAR(_logic,RadiusY,100);
			private _sideNum = GETVAR(_logic,SideSelect,100);
			private _side = [west,east,independent,civilian] select _sideNum;
			private _isRectangle = if ((typeof _logic) isEqualTo QGVAR(RespawnZoneModule_R)) then {true} else {false};


			private _center = createCenter sideLogic;
			private _group = createGroup _center;
			private _pos = getPos _logic;
			private _gameLogic = _group createUnit ["LOGIC",_pos , [], 0, ""];
			SETPVAR(_gameLogic,IsRectangle,_isRectangle);
			
			switch(_side) do {
				case west:{
					ESETMPVAR(Respawn,RespawnModule_Blufor,_logic);
				};
				case east:{
					ESETMPVAR(Respawn,RespawnModule_Opfor,_logic);
				};
				case independent:{
					ESETMPVAR(Respawn,RespawnModule_Indfor,_logic);
				};
				case civilian:{
					ESETMPVAR(Respawn,RespawnModule_Civilian,_logic);
				};
				
			}

			//[[center, a, b, angle, isRectangle]] call CBA_fnc_randPosArea;
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
