
#include "\x\UO_FW\addons\main\script_macros.hpp"

if(!isDedicated && (missionNamespace getVariable ["UO_FW_SoftAoLimit_Enabled",false])) then
{// The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)
	UO_FW_AOTimer = missionNamespace getVariable ["UO_FW_SoftAoLimit_TimeOutside",30];
	// The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)
	UO_FW_AOTimerAir = missionNamespace getVariable ["UO_FW_SoftAoLimit_TimeOutsideAir",-1];
	_tempMarker = [];
	{
		_tempMarker pushBack [west, _x];
	}forEach (missionNamespace getVariable ["UO_FW_SoftAoLimit_BluforMarkers",[]]);
	{
		_tempMarker pushBack [east, _x];
	}forEach (missionNamespace getVariable ["UO_FW_SoftAoLimit_OpforMarkers",[]]);
	{
		_tempMarker pushBack [resistance, _x];
	}forEach (missionNamespace getVariable ["UO_FW_SoftAoLimit_IndependentMarkers",[]]);
	{
		_tempMarker pushBack [civilian, _x];
	}forEach (missionNamespace getVariable ["UO_FW_SoftAoLimit_CivilianMarkers",[]]);
	_markers = [];
	{
		if(markerType (_x select 1) == "") then
		{
			_isValid = false;
			["Soft AO Limit Error",format ["Soft AO limit module:<br></br>Warning marker ""%1"" does not exist.", _x]] call UO_FW_fnc_DebugMessageDetailed;
		}
		else
		{
			_markers pushBack _x;
		};
	}forEach _tempMarker;


	if(count _markers == 0) exitWith {};

	["Soft AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Sacher"] call UO_FW_fnc_RegisterModule;
	_markers spawn
	{
		sleep(5);
		_markers = [];

		_allowedOutsideAtBegin = true;

		_vehicle = (vehicle player);

		{
			if ((_x select 0) == (side player) || (_x select 0) == sideLogic) then
			{
				_markers set [count _markers, (_x select 1)];

				if (_vehicle inArea (_x select 1)) then
				{
					_allowedOutsideAtBegin = false;
				};
			};
		} forEach (_this);
		if(count _markers == 0) exitWith {};
		while {true} do
		{

			_vehicle = (vehicle player);
			_air = _vehicle isKindOf "Air";
			_allowedOutside = (UO_FW_AOTimer < 0 && !_air) || (UO_FW_AOTimerAir < 0 && _air);
			_outSide = true;

			{
				if (_vehicle inArea _x) exitWith
				{
					_outSide = false;
					_allowedOutsideAtBegin = false;
				};
			} forEach _markers;

			_displayed = missionNamespace getVariable ["UO_FW_AOL_Display", false];
			missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];

			if (_outSide && (!_allowedOutsideAtBegin)) then
			{
				if (!(_allowedOutside) && !_displayed && (_vehicle call UO_FW_fnc_Alive)) then
				{
					_timeLeft = if (_air) then {UO_FW_AOTimerAir} else {UO_FW_AOTimer};

					missionNamespace setVariable ["UO_FW_AOL_TimeLeft", _timeLeft];
					("UO_FW_SoftAOLimit_Layer" call BIS_fnc_rscLayer) cutRsc ["RscAOLimit", "PLAIN", 0.5, false];
				};
			}
			else
			{
				_allowedOutside = false;
			};

			sleep(0.1);

		};

	};
};
