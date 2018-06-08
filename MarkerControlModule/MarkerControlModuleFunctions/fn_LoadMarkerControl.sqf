

_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];


// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["Marker Control", "Allows the mission maker to create markers visible to a single side.", "Olsen"] call UO_FNC_RegisterModule;


    	_west = (_logic getVariable ["BluforMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;
        _westBriefing = (_logic getVariable ["BluforBriefingMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;

        _east = (_logic getVariable ["OpforMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;
        _eastBriefing = (_logic getVariable ["OpforBriefingMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;

        _indfor = (_logic getVariable ["IndforMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;
        _indforBriefing = (_logic getVariable ["IndforBriefingMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;

        _civilian = (_logic getVariable ["CivilianMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;
        _civilianBriefing = (_logic getVariable ["CivilianBriefingMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;

        _noone = (_logic getVariable ["NooneMarkerArgument","[]"]) call UO_fnc_StringArrayToArray;


    #define ADDMARKER(SIDE, NAME, DELETE_AFTER_START) \
    if !(markerType NAME == "") then { \
    	_markers set [count _markers, [SIDE, NAME, DELETE_AFTER_START]]; \
    } else { \
    	_temp = format ["Marker control module:<br></br>Warning marker ""%1"", in file ""modules\marker control\settings.sqf"" does not exist.", NAME]; \
    	_temp call UO_FNC_DebugMessage; \
    };

    if (!isDedicated) then
    {

    	private ["_markers"];

    	_markers = [];

        {
            ADDMARKER(west,_x,false);
        }forEach _west;
        {
            ADDMARKER(west,_x,true);
        }forEach _westBriefing;
        {
            ADDMARKER(east,_x,false);
        }forEach _east;
        {
            ADDMARKER(east,_x,true);
        }forEach _eastBriefing;
        {
            ADDMARKER(resistance,_x,false);
        }forEach _indfor;
        {
            ADDMARKER(resistance,_x,true);
        }forEach _indforBriefing;
        {
            ADDMARKER(civilian,_x,false);
        }forEach _civilian;
        {
            ADDMARKER(civilian,_x,true);
        }forEach _civilianBriefing;
        {
            ADDMARKER(sideLogic,_x,true);
        }forEach _noone;

    	{
    		if ((_x select 0) != (side player)) then {
    			(_x select 1) setMarkerAlphaLocal 0;
    		};
    	} forEach _markers;

    	[{time > 0},
    	{
    		{
    			if (_x select 2) then
                {
    				(_x select 1) setMarkerAlphaLocal 0;
    			};
    		} forEach _this;
    	}, _markers] call CBA_fnc_WaitUntilAndExecute;

    };

};
