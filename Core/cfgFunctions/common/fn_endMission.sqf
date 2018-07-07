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

private _scenario = _this;

if (time > 0) then {

	UO_FW_MissionEnded = true;

	if (!isNil "aCount_endCount") then {call UO_FW_fnc_aCountendCount};

	{
		private _team = (_x select 0);
		private _assets = _team call UO_FW_fnc_GetDamagedAssets;
		[_team, 5, _assets select 0] call UO_FW_fnc_SetTeamVariable;
		[_team, 6, _assets select 1] call UO_FW_fnc_SetTeamVariable;
	} forEach UO_FW_Teams;

	["UO_FW_EndMission_Event", [_scenario, UO_FW_TimeLimit, UO_FW_Teams]] call CBA_fnc_globalEvent;

} else {
	"End Conditions have just been triggered. Mission will have to be ended manually." remoteExec ["systemChat", 0, false];
};
