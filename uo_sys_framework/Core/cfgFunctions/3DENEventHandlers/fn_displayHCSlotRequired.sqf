/*    Description: Handles adding and displaying prompts asking users to add HC object to mission
 *    Arguments:
 *			BOOL - Headless Check disabled? (True = yes)
 *			BOOL - Presence of playable units in mission
 *			BOOL - Presence of Headless-Client object in mission (HC Slot)
 *    Return Value:
 *         N/A
 *    Author
 *        TrainDoctor
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

private _playableFound = false;
private _headlessFound = false;

_playableFound = [] call (EFUNC(3DEN,checkPlayable));
_headlessFound = [] call (EFUNC(3DEN,checkHeadless));

if (EGETMVAR(Core,DisableHeadlessCheck,false)) exitWith { 
	LOG("HEADLESS CLIENT OBJECT CHECK DISABLED");
};

if (_headlessFound) exitWith { LOG("HEADLESS CLIENT OBJECT FOUND"); };

if (!_headlessFound && _playableFound) exitWith {
	[] spawn {
		private _result = ["A headless client slot was not found and will be automatically added. This prevents the last player slot in your mission being occupied by a Headless Client and will not interfere with any scripts that do not use or call a headless client. If you would like to disable this check for this mission go to the mission settings and check the Disable Headless Check checkbox.", "Headless Client Check", true,false, (findDisplay 313)] call BIS_fnc_guiMessage;
		if(_result) then {
			LOG("HEADLESS CLIENT SLOT NOT FOUND, HC OBJECT ADDED");
			private _cameraGPos = getPos get3DENCamera; //Get camera's position
			headless = create3DENEntity ["Logic", "HeadlessClient_F", _cameraGPos];
			headless setVehiclePosition [[_cameraGPos select 0, _cameraGPos select 1], [], 0, "CAN_COLLIDE"]; //set headless object's z position to zero, aka "ground"
		}; /* else {
			//SETMVAR(disableHeadlessCheck,false);
			LOG("HEADLESS CLIENT SLOT NOT FOUND, HEADLESS CHECK DISABLED, HC OBJECT NOT ADDED");
		}; */
	};
};
