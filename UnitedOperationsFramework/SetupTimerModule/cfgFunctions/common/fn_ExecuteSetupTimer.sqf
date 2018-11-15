params[["_selectedSide",sideLogic,[west]],["_time",0,[0]],["_marker","",[""]],["_deleteMarker",true,[true]]];
if(!([_selectedSide,_time,_marker,_deleteMarker] call UO_FW_fnc_ValidateSetupTimer)) exitWith 
{
	"Setup timer failed to Validate" call UO_FW_fnc_DebugMessage;
};
["Setup Timer", "Allows the mission maker to restrict the AO of a side for a set amount of time.", "Olsen"] call UO_FW_FNC_RegisterModule;
if (isServer) then
{
	[] spawn
	{
		waitUntil {time > 0};
		UO_FW_setup_start_time = serverTime;
		publicVariable "UO_FW_setup_start_time";
	};
};


if (!isDedicated) then
{
	if ((_selectedSide == (side player)) && [(vehicle player), _marker] call UO_FW_FNC_InArea) then
	{

		UO_FW_setup_start_Markers pushBack [_selectedSide,_time,_marker,_deleteMarker];

	} 
	else 
	{

		_marker setMarkerAlphaLocal 0;

	};
	

	private ["_markers", "_pos", "_timeLeft", "_string", "_displayed"];
	if(UO_FW_setup_start_Looping) exitWith {};
	UO_FW_setup_start_Looping = true;
	waitUntil {time > 0};
	if ((count UO_FW_setup_start_Markers) > 0) then
	{
		["","Starting Setup Timer with: " + (str UO_FW_setup_start_Markers)] call UO_FW_FNC_DebugMessageDetailed;
		_marker spawn
		{

			_marker = [];
			_displayed = false;

			waitUntil {!isNil "UO_FW_setup_start_time"};
			_startTime = UO_FW_setup_start_time;
			//we are checking for a bug described on serverTime wiki page
			//bugged value is usually around 400 000
			if (abs (UO_FW_setup_start_time - serverTime) > 100000) then
			{
				_startTime = serverTime;
				UO_FW_setup_start_time = serverTime; //client time is used instead, according to wiki it's always correct
				//we send it across network. Possible issue: multiple clients send it at the same time
				//and increase network traffic. Shouldn't be too bad because data is small.
				publicVariable "UO_FW_setup_start_time";
				systemchat "Setup Timer: Detected desynchronized server and client clock, using client's time instead.";
			};

			_pos = getPosATL (vehicle player);

			while {(count UO_FW_setup_start_Markers) > 0} do
			{
				_marker = UO_FW_setup_start_Markers select 0;
				_vehicle = (vehicle player);

				if ([_vehicle, (_marker select 2)] call UO_FW_FNC_InArea) then 
				{

					_pos = getPosATL _vehicle;

				} else 
				{

					_vehicle setPos _pos;

				};

				_timeLeft = round(_startTime + (_marker select 1) - serverTime);

				if (_timeLeft < 0) then 
				{

					_timeLeft = 0;

				};

				if (_timeLeft > 0 && !_displayed) then 
				{
					_displayed = true;
					missionNamespace setVariable ["UO_FW_ST_TimeLeft", _timeLeft];
					("UO_FW_SetupTimer_Layer" call BIS_fnc_rscLayer) cutRsc ["UO_RscSetupTimer", "PLAIN", 0.5, false];
				};

				if (_timeLeft == 0) then 
				{

					if((_marker select 3)) then {(_marker select 2) setMarkerAlphaLocal 0;};
					UO_FW_setup_start_Markers deleteAt 0;

				};

				sleep(0.1);

			};
		};
	};
};