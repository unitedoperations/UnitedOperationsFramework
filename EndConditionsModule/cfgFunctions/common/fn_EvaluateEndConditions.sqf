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

//timelimit loop
if (UO_FW_Timelimit_Enabled) then 
{
	if (UO_FW_Timelimit > 0) then 
	{
		[] spawn {
			while {!UO_FW_MissionEnded} do 
			{
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

//Category 1 loop
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category1Loop.hpp"
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category2Loop.hpp"
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category3Loop.hpp"
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category4Loop.hpp"
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category5Loop.hpp"
#include "\x\UO_FW\addons\main\EndConditionsModule\defines\Category6Loop.hpp"