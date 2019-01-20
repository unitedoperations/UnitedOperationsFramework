#include "..\..\Global\defs.hpp"
if (isServer) then {
_handle = _this spawn {
		private _unit = _this select 0;
		{
			_tempArray = _this;
			_tempArray set [0,_x];
			_x setVariable [VAR_SART_ARTFMTEXT,_tempArray call UO_FW_fnc_GetCurtainFiremissionText,true];
				[_x , true] call UO_FW_fnc_SetArtyReadyStatus;
		} forEach _unit;
		private _startPoint = _this select 1;
		private _endPoint = _this select 2;
		private _width = _this select 3;
		private	_salvoCount = _this select 4;
		private	_salvoSize = _this select 5;
		private	_salvoWait = _this select 6;
		private	_minSpottedDistance = _this select 7;

		private	_roundType = _this select 8;
		private _roundClassName = ((_unit call UO_FW_fnc_GetArtyAmmo) select _roundType) select 0 ;
		{
			[_x , true] call UO_FW_fnc_SetArtyReadyStatus;
			_x setVariable [VAR_SART_ARTFMTEXT,_this call UO_FW_fnc_GetPointFiremissionText,true];
			[_x, 0,_salvoCount * _salvoSize] call UO_FW_fnc_SetArtyFiremissionRoundsRequired;
		} forEach _unit;
		private	_fireRate = [];
		sleep((_unit call UO_FW_fnc_GetArtyAimTime));
		private	_dis = 1000;
		private	_tempAcc = ((_unit select 0) getVariable [VAR_SART_ARTSPOTACCURACY,MEANSPOTTINGACCURACY]) + 1;
		private	_dir = _endPoint vectorDiff  _startPoint;
		_dir = _dir vectorMultiply (1 /_salvoCount);

		private _rightDir = (vectorNormalized _dir) vectorCrossProduct [0,1,0];
		private _leftDir = [0,0,0] vectorDiff _rightDir;
		private _interval = _width / ( count _unit);
		private _startingSpots = [];
		private _leftEdge = _startPoint vectorAdd (_leftDir vectorMultiply ( _width / 2));
		private _tempCount = 0;
		{
				_startingSpots pushBack (_leftEdge vectorAdd (_rightDir vectorMultiply  (_tempCount * _interval)));
				_fireRate pushBack (_x call UO_FW_fnc_ArtGetFireRate);
				_tempCount = _tempCount + 1;
		} forEach _unit;
		[_unit,_startPoint,_roundClassName ] call UO_FW_fnc_InternalSpottingFiremission;
		//spotting rounds finished


		sleep( (_unit getVariable [VAR_SART_ARTCALCSPEED,MEANCALCULATIONTIME]) + 1);
		for "_i" from 0 to _salvoCount do {
				_row = 0;
				{
						[_unit,(_startingSpots select _row) vectorAdd (_dir vectorMultiply _i),0,_salvoSize,_roundClassName] call UO_FW_fnc_InternalFiremission;
						[_x, ((_x getVariable [VAR_SART_ARTROUNDSFIRED,[0,0]]) select 1) + _salvoSize,_salvoCount * _salvoSize] call UO_FW_fnc_SetArtyFiremissionRoundsRequired;
						_row = _row + 1;
				} forEach _unit;
					sleep((((_fireRate select 0) * ((_unit select 0) getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]) ) * _salvoSize) max _salvoWait);
		};
		{
				[_x, 0,0] call UO_FW_fnc_SetArtyFiremissionRoundsRequired;
				[_x , false] call UO_FW_fnc_SetArtyReadyStatus;
				[_x,objNULL] call UO_FW_fnc_SetArtyCaller;
		} forEach _unit;
	};
	{
		_x setVariable [VAR_SART_FMHANDLE,_handle,true];
	} forEach (_this select 0);