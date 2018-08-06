_markers = _this;

if(!(_markers call UO_FW_fnc_ValidateSoftAOLimits)) exitWith
{
		"Soft AO Limtis failed to Validate" call UO_FW_fnc_DebugMessage;
		false
};
["Soft AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Sacher"] call UO_FW_fnc_RegisterModule;
_markers spawn
{

	_markers = [];

	_allowedOutside = true;

	_vehicle = (vehicle player);

	{
		if ((_x select 0) == (side player) || (_x select 0) == sideLogic) then
		{
			_markers set [count _markers, (_x select 1)];

			if ([_vehicle, (_x select 1)] call UO_FW_fnc_InArea) then
			{
				_allowedOutside = false;
			};
		};
	} forEach (_this);

	while {true} do
	{

		_vehicle = (vehicle player);
		_air = _vehicle isKindOf "Air";
		_allowedOutside = (UO_FW_AOTimer < 0 && !_air) || (UO_FW_AOTimerAir < 0 && _air);
		_outSide = true;

		{
			if ([_vehicle, _x] call UO_FW_fnc_InArea) exitWith
			{
				_outSide = false;
			};
		} forEach _markers;

		_displayed = missionNamespace getVariable ["UO_FW_AOL_Display", false];
		missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];

		if (_outSide) then
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
