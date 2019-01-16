#include "..\..\Global\defs.hpp"
_handle = _this spawn {
		private _unit = _this select 0;

		private _startPoint = _this select 1;
		private _endPoint = _this select 2;
		private	_salvoCount = _this select 3;
		private	_salvoSize = _this select 4;
		private	_salvoWait = _this select 5;
		private	_minSpottedDistance = _this select 6;
		private	_roundType = _this select 7;
		private	_fireRate = _unit call UO_FW_FNC_ArtGetFireRate;
		private _roundClassName = ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType) select 0 ;

		[_unit, 0,_salvoCount * _salvoSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
		[_unit , true] call UO_FW_FNC_SetArtyReadyStatus;
		_unit setVariable [VAR_SART_ARTFMTEXT,_this call UO_FW_FNC_GetLineFiremissionText,true];
		[_unit,_startPoint,_roundClassName ] call UO_FW_FNC_InternalSpottingFiremission;
		//spotting rounds finished
		sleep( _unit call UO_FW_FNC_GetArtyCalcTime);
	  	private	_dir = _endPoint vectorDiff  _startPoint;
		_dir = _dir vectorMultiply (1 /_salvoCount);
		for "_i" from 0 to _salvoCount do {

			[_unit,_startPoint vectorAdd (_dir vectorMultiply _i),0,_salvoSize,_roundClassName] call UO_FW_FNC_InternalFiremission;
			[_unit, ((_unit getVariable [VAR_SART_ARTROUNDSFIRED,[0,0]]) select 0) + _salvoSize,_salvoCount * _salvoSize] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
			sleep(((_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]) ) * _salvoSize) max _salvoWait);
		};
		[_unit, false] call UO_FW_FNC_SetArtyReadyStatus;
		[_unit,objNULL] call UO_FW_FNC_SetArtyCaller;
		[_unit, 0,0] call UO_FW_FNC_SetArtyFiremissionRoundsRequired;
	};
	(_this select 0) setVariable [VAR_SART_FMHANDLE,_handle,true];