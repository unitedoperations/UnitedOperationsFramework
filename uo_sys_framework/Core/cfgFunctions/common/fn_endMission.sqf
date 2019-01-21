/*
 * Author: Olsen
 *
 * Ends mission in orderly fashion and displays end screen.
 * Sends the team stats, time limit, scenario and executes "UO_FW_EndMission_Event" on all players machines.
 *
 * Arguments:
 * 0: text to display in end screen <string>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params ["_scenario"];

if (CBA_missiontime > ((missionNamespace getvariable ["UO_FW_ConditionDelay",0]) + ((missionNamespace getvariable ["UO_FW_ConditionSleep",30]) * 1.5))) then {
    UO_FW_MissionEnded = true;
    //endmission hooks for modules
    if ((missionNamespace getVariable ["UO_FW_ShotCount_Enabled",false])) then {
        LOG("Sending ShotcountData");
        [] call UO_FW_fnc_aCount_endCount;
    };
    {
        private _team = (_x select 0);
        private _assets = _team call UO_FW_fnc_GetDamagedAssets;
        [_team, 5, _assets select 0] call UO_FW_fnc_SetTeamVariable;
        [_team, 6, _assets select 1] call UO_FW_fnc_SetTeamVariable;
    } forEach UO_FW_Teams;
    ["UO_FW_EndMission_Event", [_scenario]] call CBA_fnc_globalEvent;
} else {
    ERROR("End Conditions have just been triggered. Mission might need to be ended manually!");
};
