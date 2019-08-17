#define COMPONENT Briefing
#include "\x\UO_FW\addons\Main\script_macros.hpp"

private _pidCards = [] call UO_FW_fnc_Briefing_getAllPIDCards;
private _result = ["None","None",""];
{
	_x params ["_identifier","_description","_path"];
	if(_identifier == _this) then {
		_result = _x;
	};
}forEach _pidCards;
if((_result select 0) == "None" && _this != "None") then {
	private _text = "PID file " + str(_this) + " could not be found!";
	FWDEBUG(_text,_text);
};


_result