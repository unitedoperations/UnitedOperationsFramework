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

if (CBA_missiontime > ((EGETMVAR(EndConditions,ConditionSleep,0)) + (EGETMVAR(EndConditions,ConditionSleep,0)))) then {
    SETMPVAR(MissionEnded,true);
    //endmission hooks for modules
    if (EGETMVAR(ShotCount,Enabled,0)) then {
        LOG("Sending ShotcountData");
        [] call EFUNC(ShotCount,endCount);
    };
    {
        private _team = (_x select 0);
        private _assets = _team call FUNC(GetDamagedAssets);
        [_team, 5, _assets select 0] call FUNC(SetTeamVariable);
        [_team, 6, _assets select 1] call FUNC(SetTeamVariable);
    } forEach UO_FW_Teams;
    ["UO_FW_EndMission_Event", [_scenario]] call CBA_fnc_globalEvent;
} else {
    ERROR("End Conditions have just been triggered. Mission might need to be ended manually!");
};
