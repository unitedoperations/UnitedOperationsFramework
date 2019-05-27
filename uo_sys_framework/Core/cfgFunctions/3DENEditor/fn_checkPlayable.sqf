/*    Description: Checks for presence of playable units in mission
 *    Arguments:
 *         N/A
 *    Return Value:
 *         BOOL - Presence of playable unit(s) in a mission, true = present
 *    Author
 *        TrainDoctor
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

private _playableFound = false;

{
	_unitMP = _x get3DENAttribute "ControlMP";
    if (_unitMP select 0) exitWith {
        LOG_1("PLAYABLE UNIT SLOT FOUND! %1", typeof _x);
		_playableFound = true;
		_playableFound;
    };
} foreach (all3DENentities select 0);

_playableFound;