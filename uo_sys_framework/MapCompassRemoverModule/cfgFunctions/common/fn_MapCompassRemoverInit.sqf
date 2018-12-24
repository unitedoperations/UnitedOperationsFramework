#include "\x\UO_FW\addons\main\script_macros.hpp"
if(!UO_FW_SERVER_REMOVERMODULE_ALLOWED) exitWith {};
["Map and Compass Remover", "Removes Map and Compass upon spawn", "TinfoilHate, Sacher and PiZZADOX"] call UO_FW_FNC_RegisterModule;

if (isServer || !hasinterface) then {
	[{(time > 1)}, {
		{
			if(_x getVariable ["UO_FW_RemoveMap",false]) then {
				_x unlinkItem "ItemMap";
			};
			if(_x getVariable ["UO_FW_RemoveCompass",false]) then {
				_x unlinkItem "ItemCompass";
			};
		} foreach (allUnits select {local _x});
	}] call CBA_fnc_waitUntilAndExecute;
};
if (hasInterface) then {
	[{!isNull player && (time > 1)}, {
			if(player getVariable ["UO_FW_RemoveMap",false]) then {
				player unlinkItem "ItemMap";
			};
			if(player getVariable ["UO_FW_RemoveCompass",false]) then {
				player unlinkItem "ItemCompass";
			};
	}] call CBA_fnc_waitUntilAndExecute;
};
