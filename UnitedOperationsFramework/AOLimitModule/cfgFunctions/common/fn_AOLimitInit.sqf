if (!UO_FW_AOLimit_Enabled) exitwith {};
["AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Olsen"] call UO_FW_FNC_RegisterModule;
_tempMarkers = [];
_markers = [];
_west = missionNamespace getVariable ["UO_FW_AOLimit_BluforMarker",[]];
_east = missionNamespace getVariable ["UO_FW_AOLimit_OpforMarker",[]];
_ind = missionNamespace getVariable ["UO_FW_AOLimit_IndependentMarker",[]];
_civ = missionNamespace getVariable ["UO_FW_AOLimit_CivilianMarker",[]];
{
	_tempMarkers pushBack [west, _x];
}forEach _west;
{
	_tempMarkers pushBack [east, _x];
}forEach _east;
{
	_tempMarkers pushBack [independent, _x];
}forEach _ind;
{
	_tempMarkers pushBack [civilian, _x];
}forEach _civ;

{
	if(markerType (_x select 1) == "") then
	{
		
		_temp = format ["AO limit module:<br></br>Warning marker ""%1"" does not exist.", _x]; 
		_temp call UO_FW_fnc_DebugMessage;
	}
	else
	{
		_markers pushBack _x;
		
	};
}forEach _tempMarkers;


if ((count _markers) > 0) then 
{

	[_markers] spawn 
	{

		_markers = [];
		
		_allowedOutside = true;

		_vehicle = (vehicle player);
		_pos = getPosATL _vehicle;

		{
			if ((_x select 0) == (side player) || (_x select 0) == sideLogic) then 
			{
				_markers set [count _markers, (_x select 1)];

				if ([_vehicle, (_x select 1)] call UO_FW_FNC_InArea) then 
				{
					_allowedOutside = false;
				};
			};
		} forEach (_this select 0);
		["","Executing AO Limit with: " + (str _markers)] call UO_FW_fnc_DebugMessageDetailed;
		while {true} do 
		{

			_vehicle = (vehicle player);

			if (!(_vehicle isKindOf "Air")) then 
			{

				_outSide = true;

				{
					if ([_vehicle, _x] call UO_FW_FNC_InArea) exitWith 
					{
						_outSide = false;
					};
				} forEach _markers;

				if (_outside) then 
				{
					if (!(_allowedOutside) && (_vehicle call UO_FW_FNC_Alive)) then 
					{
						_vehicle setPos _pos;
					};
				} else 
				{
					_allowedOutside = false;
					_pos = getPosATL _vehicle;
				};

			} else 
			{
				_allowedOutside = true;
			};
			sleep(0.1);

		};

	};

};