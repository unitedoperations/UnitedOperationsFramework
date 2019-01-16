#define COMPONENT Briefing
#include "\x\UO_FW\addons\main\script_macros.hpp"
#include "\x\UO_FW\addons\main\BriefingModule\module_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

[{!isNull player}, {
	private _side = (side player);
	private _briefing = [];

	switch (_side) do {
		case west: {
			#include "\x\UO_FW\addons\main\BriefingModule\defines\blufor_briefing.hpp"
		};
		case east: {
			#include "\x\UO_FW\addons\main\BriefingModule\defines\opfor_briefing.hpp"
		};
		case resistance: {
			#include "\x\UO_FW\addons\main\BriefingModule\defines\indfor_briefing.hpp"
		};
		case civilian: {
			#include "\x\UO_FW\addons\main\BriefingModule\defines\civilian_briefing.hpp"
		};
	};
}] call CBA_fnc_waitUntilAndExecute;
