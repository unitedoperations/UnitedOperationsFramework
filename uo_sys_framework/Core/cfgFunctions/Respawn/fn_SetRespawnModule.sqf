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
			private _pos = getPos _logic;
			_pos = [_pos select 0,_pos select 1, 0];
            private _radiusX = GETVAR(_logic,RadiusX,100);
			private _radiusY = GETVAR(_logic,RadiusY,100);
			private _sideNum = GETVAR(_logic,SideSelect,0);
			private _show = GETVAR(_logic,ShowMarker,false);
			private _side = [west,east,independent,civilian] select _sideNum;
			private _isRectangle = if ((typeof _logic) isEqualTo QGVAR(RespawnZoneModule_R)) then {true} else {false};

			private _marker = "";
			switch(_side) do {
				case west:{
					_marker = createMarker [QEGVAR(Respawn,RespawnModuleMarker_Blufor), _pos];
					_marker setMarkerColor "ColorWEST";

				};
				case east:{
					_marker = createMarker [QEGVAR(Respawn,RespawnModuleMarker_Opfor), _pos];
					_marker setMarkerColor "ColorEAST";
				};
				case independent:{
					_marker = createMarker [QEGVAR(Respawn,RespawnModuleMarker_Indfor), _pos];
					_marker setMarkerColor "ColorGUER";
				};
				case civilian:{
					_marker = createMarker [QEGVAR(Respawn,RespawnModuleMarker_Civ), _pos];
					_marker setMarkerColor "ColorCIV";

				};

			};
			if(_isRectangle) then {
				_marker setMarkerShape "RECTANGLE";
			} else {
				_marker setMarkerShape "ELLIPSE";
			};

			if(_show) then {
				_marker setMarkerAlpha 0.8;
			} else{
				_marker setMarkerAlpha 0;		
			};
			_marker setMarkerBrush "Border";

			_marker setMarkerDir (getDir _logic);
			_marker	setMarkerSize [_radiusX, _radiusY];

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