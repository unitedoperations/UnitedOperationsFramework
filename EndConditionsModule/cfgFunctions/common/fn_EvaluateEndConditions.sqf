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

<<<<<<< HEAD
//_whilesleep = missionNamespace getvariable ["UO_FW_ConditionSleep",30];
//diag_log format ["_whilesleep: %1",_whilesleep];

//evaluate timelimit variables
//_timelimitenabled = missionNamespace getvariable ["UO_FW_Timelimit_Enabled",false];
//diag_log format ["_timelimit_enabled: %1",_timelimitenabled];
//if (_timelimit_enabled) then {
//	private _timelimit = missionNamespace getvariable ["UO_FW_Timelimit",30];
//	private _timelimitmessage = missionNamespace getvariable ["UO_FW_Timelimit_Message","Time Limit Reached!"];
//};

=======
>>>>>>> f75aeeae1c4f987e0e243f43ae618bbedbe3dec7
//timelimit loop
if (UO_FW_Timelimit_Enabled) then {
	if (UO_FW_Timelimit > 0) then {
		[] spawn {
			while {!UO_FW_MissionEnded} do {
				sleep(missionNamespace getvariable ["UO_FW_ConditionSleep",30]);
				UO_FW_DEBUG("",format ["checking timelimit: %1",UO_FW_Timelimit])
				UO_FW_DEBUG("",format ["checking timelimit message: %1",UO_FW_Timelimit_Message])
				
				if ((time / 60) >= UO_FW_Timelimit) exitWith {
					(missionNamespace getvariable ["UO_FW_Timelimit_Message","Time Limit Reached!"]) call UO_FW_fnc_EndMission;
				};
			};
		};
	} else {
		UO_FW_DEBUG("",format ["invalid timelimit: %1",UO_FW_Timelimit])
	};
};

//exit for custom file
if (UO_FW_ENDCONDITIONS_FILE) exitwith {
	if !(UO_FW_ENDCONDITIONS_FILE_PATH isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_ENDCONDITIONS_FILE_PATH);
	} else {
		UO_FW_DEBUG("No file found for End Conditions!","No file found for End Conditions!")
	};
};

<<<<<<< HEAD
//UO_FW_EndCondition_1_Array pushback _endconditionvalue;
//counts endcondition array
//if ((count (missionNamespace getvariable ["UO_FW_EndCondition_1_Array",[]])) > 0) then {
//	[] spawn {
//		while {!UO_FW_MissionEnded} do {
//			scopename "EndConditionLoop_1";
//			sleep(missionNamespace getvariable ["UO_FW_ConditionSleep",30]);
//			UO_FW_DEBUG("",format ["printing conditions: %1",UO_FW_EndCondition_1_Array])
//			
//			_EndCondition1Compile = 
//			
//			UO_FW_DEBUG("",format ["printing precompiled condition statement: %1",_EndCondition1Compile])
//			
//			//if (call compile _EndCondition1Compile) exitWith {
//			//	(missionNamespace getvariable ["UO_FW_EndCondition_1_Message","End Condition 1 Fired!"]) call UO_FW_fnc_EndMission;
//			//};
//		};
//	};
//};

//Add block for specific entities destroyed

//Add block for casualtycounts

//Add custom blocks with compile check 
		
		
=======
//Category 1 loop
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category1Loop.hpp"

>>>>>>> f75aeeae1c4f987e0e243f43ae618bbedbe3dec7
