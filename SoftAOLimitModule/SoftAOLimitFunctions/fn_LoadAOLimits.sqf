

#define ADDAOMARKER(SIDE, NAME) \
if !(markerType NAME == "") then { \
	_markers set [count _markers, [SIDE, NAME]]; \
} else { \
	_temp = format ["AO limit module:<br></br>Warning marker ""%1"", in file ""modules\ao limit\settings.sqf"" does not exist.", NAME]; \
	_temp call UO_fnc_DebugMessage; \
};

// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
["Soft AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Olsen &amp; Starfox64"] call UO_fnc_RegisterModule;
	// The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)
	FW_AOTimer = _logic getVariable ["UO_SoftAOLimitModule_AOTimer",30];
	// The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)
	FW_AOTimerAir = _logic getVariable ["UO_SoftAOLimitModule_AOTimerAir",-1];

	_bluforArray = _logic getVariable ["AOBluforMarkerArray",[]];
	_opforArray = _logic getVariable ["AOopforMarkerArray",[]];
	_indforArray = _logic getVariable ["AOIndforMarkerArray",[]];
	_civilianArray = _logic getVariable ["AOCivilianMarkerArray",[]];

	_markers = [];

	{
		ADDAOMARKER(west,_x);
	}forEach _bluforArray;
	{
		ADDAOMARKER(east,_x);
	}forEach _opforArray;
	{
		ADDAOMARKER(resistance,_x);
	}forEach _indforArray;
	{
		ADDAOMARKER(civilian,_x);
	}forEach _civilianArray;

	if (!isDedicated) then
	{
		if ((count _markers) > 0) then
		{

			[_markers] spawn
			{

				_markers = [];

				_allowedOutside = true;

				_vehicle = (vehicle player);

				{
					if ((_x select 0) == (side player) || (_x select 0) == ANY) then
					{
						_markers set [count _markers, (_x select 1)];

						if ([_vehicle, (_x select 1)] call UO_fnc_InArea) then
						{
							_allowedOutside = false;
						};
					};
				} forEach (_this select 0);

				while {true} do
				{

					_vehicle = (vehicle player);
					_air = _vehicle isKindOf "Air";
					_allowedOutside = (FW_AOTimer < 0 && !_air) || (FW_AOTimerAir < 0 && _air);
					_outSide = true;

					{
						if ([_vehicle, _x] call UO_fnc_InArea) exitWith
						{
							_outSide = false;
						};
					} forEach _markers;

					_displayed = missionNamespace getVariable ["FW_AOL_Display", false];
					missionNamespace setVariable ["FW_AOL_Display", _outSide];

					if (_outSide) then {
						if (!(_allowedOutside) && !_displayed && (_vehicle call UO_fnc_Alive)) then
						{
							_timeLeft = if (_air) then {FW_AOTimerAir} else {FW_AOTimer};

							missionNamespace setVariable ["FW_AOL_TimeLeft", _timeLeft];
							cutRsc ["RscAOLimit", "PLAIN", 0.5, false];
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

	};

};
