/*    Description: Checks for presence of headless client in mission
 *    Arguments:
 *         N/A
 *    Return Value:
 *         BOOL - Presence of Headless-Client Slot in mission, true = present
 *    Author
 *        TrainDoctor
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

private _headlessFound = false;

{
    LOG_1("_logic:%1",_x,typeof _x);
    if (_x isKindOf "headlessclient_f") exitWith {
        LOG_1("HEADLESS CLIENT SLOT FOUND! _object class:%1",typeof _x);
		_headlessFound = true;
		_headlessFound;
    };
} foreach (all3DENentities select 3);

_headlessFound;