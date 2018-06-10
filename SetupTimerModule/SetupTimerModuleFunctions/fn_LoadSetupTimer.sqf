
#define ADDSETUPMARKER(SIDE, TIME, NAME) \
if !(markerType NAME == "") then { \
    FW_setup_start_Markers set [count FW_setup_start_Markers, [SIDE, TIME, NAME]]; \
} else { \
    _temp = format ["Setup timer module:<br></br>Warning marker ""%1"", in file ""modules\setup timer\settings.sqf"" does not exist.", NAME]; \
    _temp call UO_FNC_DebugMessage; \
};

_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];


// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
        ["Setup Timer", "Allows the mission maker to restrict the AO of a side for a set amount of time.", "Olsen"] call UO_FNC_RegisterModule;

        _sides = [west,east,resistance,civilian];
        _selectedSide = _sides select ((_logic getVariable ["SideSelectArgument",1]));
        _time = _logic getVariable ["TimeArgument",300];
        _marker = _logic getVariable ["MarkerArgument",""];
        _marker = call compile _marker;



        private _aborted = false;
        if (!isMultiplayer) then
        {
        	_aborted = true;
        	"Setup Timer: Singleplayer session detected, this module will function only in multiplayer." call UO_FNC_DebugMessage;
        };

        if (isServer) then
        {
        	[] spawn
            {
        		waitUntil {time > 0};
        		FW_setup_start_time = serverTime;
        		publicVariable "FW_setup_start_time";
        	};
        };

        if (isNil "FW_setup_start_Markers") then { FW_setup_start_Markers = []};
        if (isNil "FW_setup_start_Loop_Running") then { FW_setup_start_Loop_Running = false};

        ADDSETUPMARKER(_selectedSide,_time,_marker);

        if (!isDedicated && !_aborted && !FW_setup_start_Loop_Running) then
        {

        	private ["_markers", "_pos", "_timeLeft", "_string", "_displayed"];


            FW_setup_start_Loop_Running = true;


            waitUntil {time > 0};
        	if ((count FW_setup_start_Markers) > 0) then
            {

        		"" spawn
                {

        			_marker = [];
        			_displayed = false;

        			waitUntil {!isNil "FW_setup_start_time"};
        			_startTime = FW_setup_start_time;
        			//we are checking for a bug described on serverTime wiki page
        			//bugged value is usually around 400 000
        			if (abs (FW_setup_start_time - serverTime) > 100000) then
                    {
        				_startTime = serverTime;
        				FW_setup_start_time = serverTime; //client time is used instead, according to wiki it's always correct
        				//we send it across network. Possible issue: multiple clients send it at the same time
        				//and increase network traffic. Shouldn't be too bad because data is small.
        				publicVariable "FW_setup_start_time";
        				systemchat "Setup Timer: Detected desynchronized server and client clock, using client's time instead.";
        			};

        			{
        				if (((_x select 0) == (side player)) && [(vehicle player), (_x select 2)] call UO_FNC_InArea) then {

        					_marker = [(_x select 1), (_x select 2)];

        				} else {

        					(_x select 2) setMarkerAlphaLocal 0;

        				};

        			} forEach (FW_setup_start_Markers);

        			_pos = getPosATL (vehicle player);

        			while {(count _marker) > 0} do
                    {

        				_vehicle = (vehicle player);

        				if ([_vehicle, (_marker select 1)] call UO_FNC_InArea) then {

        					_pos = getPosATL _vehicle;

        				} else {

        					_vehicle setPos _pos;

        				};

        				_timeLeft = round(_startTime + (_marker select 0) - serverTime);

        				if (_timeLeft < 0) then {

        					_timeLeft = 0;

        				};

        				if (_timeLeft > 0 && !_displayed) then {
        					_displayed = true;
        					missionNamespace setVariable ["FW_ST_TimeLeft", _timeLeft];
        					cutRsc ["UO_RscSetupTimer", "PLAIN", 0.5, false];
        				};

        				if (_timeLeft == 0) then {

        					(_marker select 1) setMarkerAlphaLocal 0;
        					_marker = [];

        				};

        				sleep(0.1);

        			};
        		};
        	};
        };

};
