#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
_pre = param [0,1];
_ret = false;

_radioList = [] call acre_api_fnc_getCurrentRadioList;
{
	if (([_x, "ACRE_PRC148"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC152"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC117F"] call acre_api_fnc_isKindOf || [_x, "ACRE_PRC77"] call acre_api_fnc_isKindOf) && !_ret) then {

		if (!isNil QGVAR(CallChannel_Blufor) || !isNil QGVAR(CallChannel_Opfor) || !isNil QGVAR(CallChannel_Indfor) || !isNil QGVAR(CallChannel_Civfor)) then {
			switch (side player) do {
				case west: {
					_pre = GVAR(CallChannel_Blufor);
				};
				case east: {
					_pre = GVAR(CallChannel_Opfor);
				};
				case independent: {
					_pre = GVAR(CallChannel_Indfor);
				};
				case civilian: {
					_pre = GVAR(CallChannel_Civfor);
				};
			};
		};

		if ([_x] call acre_api_fnc_getRadioChannel == _pre) then {
			_ret = true
		};
	};
} forEach _radioList;

_ret