#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
_handle = _this spawn
	{
		private _unit = _this select 0;
		private _target = _this select 1;
		private	_roundType = _this select 2;
		private	_fireRate = _unit call UO_FW_FNC_ArtGetFireRate;
		[_unit , true] call UO_FW_FNC_SetArtyReadyStatus;

		private	_rounds = ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType);
		_unit setVariable [VAR_SART_ARTFMTEXT,_this call UO_FW_FNC_GetGridSpottingFiremissionText,true];

		sleep((_unit call UO_FW_FNC_GetArtyAimTime));
		private _randomPos = [[[_target, _unit getVariable [VAR_SART_ARTSPOTACCURACY,MEANSPOTTINGACCURACY]]],[]] call BIS_fnc_randomPos;
		private _eta = [_unit,_randomPos, ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType) select 0] call UO_FW_FNC_GetArtyEta;
		_unit commandArtilleryFire [_randomPos,  ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType) select 0, 1];
		private _waitTime = (_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]));
		sleep(_waitTime);
		[_unit,objNULL] call UO_FW_FNC_SetArtyCaller;
		[_unit, false] call UO_FW_FNC_SetArtyReadyStatus;
	};