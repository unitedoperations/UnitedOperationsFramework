#include "..\..\..\Global\defs.hpp"
_requester  = _this select 0;
_selectedUnit = _this select 1;
_selectedAmmo = _this select 2;
_startGrid = _this select 3;
_endGrid = _this select 4;
_salvoNumber = _this select 5;
_salvoRounds = _this select 6;
_salvoDelay = _this select 7;
_spotting =  _this select 8;

[_selectedUnit,_requester] call UO_FW_fnc_SetArtyCaller;
[_selectedUnit,[_startGrid,true] call CBA_fnc_mapGridToPos,[_endGrid,true] call CBA_fnc_mapGridToPos,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call UO_FW_fnc_BracketFiremission;

