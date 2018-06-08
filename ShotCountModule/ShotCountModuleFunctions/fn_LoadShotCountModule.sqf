_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["Ammo Counter", "Counts ammunition types fired and displays it in the mission endscreen.", "TinfoilHate"] call FNC_RegisterModule;
    if(isServer) then
    {
        _ammoArray = [];
        {
            {
                _ammoClass = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
                if !(_ammoClass in _ammoArray) then {
                    _ammoArray set [count _ammoArray,_ammoClass];
                };
            } forEach magazines _x;
        } forEach allMissionObjects "ALL";
        diag_log _ammoArray;


        aCount_west_ExpendedAmmunition = [];
        aCount_resistance_ExpendedAmmunition = [];
        aCount_east_ExpendedAmmunition = [];

        aCount_classNames = [];

        ["aCount_event_addEH",UO_FNC_ShotCountAddEventHandler] call CBA_fnc_addEventHandler;
    };

    if (!isDedicated && hasInterface) then
    {
    	["aCount_event_scoreScreen",UO_FNC_ShotCountShotDisplay] call CBA_fnc_addEventHandler;
    };

    if (isServer) then {
    	[{ time > 0 }, {
    		{ _x call UO_FNC_ShotCountAddEventHandler; } forEach allMissionObjects "All";
    	}] call CBA_fnc_waitUntilAndExecute;
    };

    if (!isDedicated && hasInterface) then {
    	if (didJIP) then {
    		[{!isNull player}, {
    			["aCount_event_addEH", player] call CBA_fnc_serverEvent;
    		}] call CBA_fnc_waitUntilAndExecute;
    	};
    };
};
