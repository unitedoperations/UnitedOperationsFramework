#include "\x\UO_FW\addons\main\script_macros.hpp"
<<<<<<< HEAD
=======
#include "\x\UO_FW\addons\main\BriefingModule\module_macros.hpp"
>>>>>>> f75aeeae1c4f987e0e243f43ae618bbedbe3dec7
UO_FW_EXEC_CHECK(ALL)

[] spawn {
	waituntil {!isNull player};
	_side = (side player);
	_briefing = [];
	
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
		default {};
	};
};