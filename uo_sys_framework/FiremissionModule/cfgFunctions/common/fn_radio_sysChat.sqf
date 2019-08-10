#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
_pre = param [0,1];
_msg = param [1,""];
_radioList = [] call acre_api_fnc_getCurrentRadioList;
{
	if (([_x, "ACRE_PRC148"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC117F"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC77"] call acre_api_fnc_isKindOf)) exitwith {
		systemChat _msg;
	};
} forEach _radioList;