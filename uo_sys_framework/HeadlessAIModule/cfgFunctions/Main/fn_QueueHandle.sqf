#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(HC)

if (!(UO_FW_AI_Enabled)) exitWith {};

while {true} do {
	sleep 0.25;
	//systemchat format ["UO_FW_AI_UnitQueue: %1",UO_FW_AI_UnitQueue];
	if !(UO_FW_AI_UnitQueue isEqualTo []) then
	{
		private _ConsideringUnit = UO_FW_AI_UnitQueue select 0;
		private _Disabled = _ConsideringUnit getVariable ["UO_FW_AI_NOAI",false];
		if ((vehicle _ConsideringUnit) isKindOf "Plane") then {_Disabled = true;_ConsideringUnit setVariable ["UO_FW_AI_NOAI",true];};
		if (!(isNull _ConsideringUnit) && !(_Disabled)) then {
			if (side _ConsideringUnit in UO_FW_AI_SideBasedExecution) then {
				[_ConsideringUnit] execFSM "x\UO_FW\addons\main\HeadlessAIModule\cfgFunctions\FSM\AIBEHAVIORTEST.fsm";
			} else {
				_ConsideringUnit forcespeed -1;
			};
				UO_FW_AI_ActiveList pushback _ConsideringUnit;
				UO_FW_AI_UnitQueue deleteAt 0;
		} else {
				UO_FW_AI_UnitQueue deleteAt 0;
				_ConsideringUnit forcespeed -1;
		};

		{
			if (isNull _x) then {UO_FW_AI_ActiveList = UO_FW_AI_ActiveList - [_x];};
		} foreach UO_FW_AI_ActiveList;
	};
};
