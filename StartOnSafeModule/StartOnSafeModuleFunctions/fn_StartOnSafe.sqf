
// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["Start on safe", "Forces ACE Safety on all players when the mission starts.", "Olsen"] call FNC_RegisterModule;

    if (!isDedicated) then {

    	"" spawn {

    		sleep 0.01;

    		if (currentWeapon player != "") then {

    			[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;

    		};
    	};
    };
};
