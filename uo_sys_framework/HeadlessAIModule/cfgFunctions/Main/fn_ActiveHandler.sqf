#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(HC)

if (!(UO_FW_AI_Enabled)) exitWith {};

while {true} do {
	{
		if (local _x && {simulationEnabled _x}) then {
				if (!(_x in UO_FW_AI_ActiveList) && {!(_x in UO_FW_AI_UnitQueue)}) then {
					_x forcespeed 0;
					UO_FW_AI_UnitQueue pushback _x;
				};
		};
	} forEach allUnits;
	sleep (random (10) + 10);
};
