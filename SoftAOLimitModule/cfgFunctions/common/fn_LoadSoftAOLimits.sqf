


// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [1,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
	
	// The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)
	FW_AOTimer = _logic getVariable ["UO_FW_SoftAoLimit_TimeOutside",30];
	// The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)
	FW_AOTimerAir = _logic getVariable ["UO_FW_SoftAoLimit_TimeOutsideAir",-1];
	_markers = [];
	{
		_markers pushBack [west, _x];
	}forEach (_logic getVariable ["UO_FW_SoftAoLimit_BluforMarkers",[]]);
	{
		_markers pushBack [east, _x];
	}forEach (_logic getVariable ["UO_FW_SoftAoLimit_OpforMarkers",[]]);
	{
		_markers pushBack [resistance, _x];
	}forEach (_logic getVariable ["UO_FW_SoftAoLimit_IndependentMarkers",[]]);
	{
		_markers pushBack [civilian, _x];
	}forEach (_logic getVariable ["UO_FW_SoftAoLimit_CivilianMarkers",[]]);
	

	if (!isDedicated) then
	{
		if ((count _markers) > 0) then
		{
			
			_markers call UO_FW_fnc_ExecuteSoftAOLimits;

		};

	};

};
