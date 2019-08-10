#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
if (isDedicated) exitWith { };

[_this] spawn {
	params ["_msgArray"];
	private ["_sleepTime"];

	_sleepTime = 0;
	_msgSide = _msgArray # 0 # 2;
	
	if (side player == _msgSide) then {
		_netVar = QGVAR(NetBusy_) + str(_msgSide);
		
		waitUntil {!(missionNameSpace getVariable _netVar)};
		
		SETMPVAR(_netVar, true);

		{
			_x params ["_msgChan","_msgText"];
	
			enableRadio true;

			sleep 0.05;

			_sleepTime = (count _msgText) * 0.08;

			[_msgChan,_msgText] call FUNC(radio_sysChat);

			enableRadio false;
			sleep _sleepTime;
		} forEach _msgArray;

		SETMPVAR(_netVar, false);
	};
};