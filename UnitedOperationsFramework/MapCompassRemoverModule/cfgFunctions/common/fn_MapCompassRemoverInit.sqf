#include "\x\UO_FW\addons\main\script_macros.hpp"
"" spawn
{
	[{time > 1}, {		
		{
			_unit = _x;			
			if (local _unit) then 
			{
				if(_unit getVariable ["UO_FW_RemoveMap",false]) then
				{
					_unit unlinkItem "ItemMap";
				};
				if(_unit getVariable ["UO_FW_RemoveCompass",false]) then
				{
					_unit unlinkItem "ItemCompass";
				};								
			};
		} forEach allUnits;
	}] call CBA_fnc_waitUntilAndExecute;
};
