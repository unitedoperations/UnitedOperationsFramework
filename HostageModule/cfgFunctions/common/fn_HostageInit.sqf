/*	Description: Initalizes
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		Starfox64 (Ported by TrainDoctor)
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

if (!UO_FW_Enabled) exitwith {};
["Hostage", "Allows the mission maker to easily add hostages to their missions.", "Starfox64"] call UO_FW_FNC_RegisterModule;

if (isServer) then {

    [] spawn {
        //waitUntil {UO_FW_MissionEnded};

        //private ["_unit"];

        {
          if((_x getVariable ["UO_FW_Hostage_State",false])) then {
              _unit = _x;
              [_unit,_unit getVariable ["UO_FW_Hostage_Rescue_Location",""]] call UO_FW_FNC_HostageSet;
          };
        } forEach allUnits;

    };

};