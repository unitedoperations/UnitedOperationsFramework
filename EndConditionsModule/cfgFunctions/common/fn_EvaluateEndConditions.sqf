/*	Description: Checks end conditions in a loop and ends mission if conditions met
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER)

if (isNil "UO_FW_MissionEnded") then {UO_FW_MissionEnded = false;};
//_whilesleep = missionNamespace getvariable ["UO_FW_ConditionSleep",30];
//diag_log format ["_whilesleep: %1",_whilesleep];

//evaluate timelimit variables
//_timelimitenabled = missionNamespace getvariable ["UO_FW_Timelimit_Enabled",false];
//diag_log format ["_timelimit_enabled: %1",_timelimitenabled];
//if (_timelimit_enabled) then {
//	private _timelimit = missionNamespace getvariable ["UO_FW_Timelimit",30];
//	private _timelimitmessage = missionNamespace getvariable ["UO_FW_Timelimit_Message","Time Limit Reached!"];
//};

//main while loop for conditions
//this loop is scheduled... any reason to not move to a spawn since all values are stored already?
while {!UO_FW_MissionEnded} do {
	sleep(UO_FW_ConditionSleep);
	UO_FW_DEBUG("",format ["end cond check with sleep: %1",UO_FW_ConditionSleep])

	//Time Limit block
	//ends with an exitwith
	if (UO_FW_Timelimit_Enabled) then {
		UO_FW_DEBUG("",format ["checking timelimit: %1",UO_FW_Timelimit])
		UO_FW_DEBUG("",format ["checking timelimit message: %1",UO_FW_Timelimit_Message])
		if !(UO_FW_Timelimit == 0) then {
			if ((time / 60) >= UO_FW_Timelimit) exitWith {
				UO_FW_Timelimit_Message call UO_FW_fnc_EndMission;
			};
		} else {
		};
	};
	
	//Add block for specific entities destroyed
	
	//Add block for casualtycounts
	
	//Add custom blocks with compile check 
};