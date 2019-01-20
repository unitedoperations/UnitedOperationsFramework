/*
 * Author: Olsen
 *
 * Disable tracking of unit by framework.
 * Unit will be ignored in casualty count etc.
 *
 * Arguments:
 * 0: unit to not track <object>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

#include "\x\UO_FW\addons\Main\script_macros.hpp"

if (!isServer) exitwith {_this remoteExec ["UO_FW_fnc_notTrackUnit",2];};

UO_FW_EXEC_CHECK(SERVER);

private _unit = _this;

if (isServer) then {

    _unit setVariable ["UO_FW_DontTrack", true];

};
