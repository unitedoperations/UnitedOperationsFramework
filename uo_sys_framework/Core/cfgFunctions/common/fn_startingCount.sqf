/*
 * Author: Olsen
 *
 * Starts tracking all units, except ones with FW_DontTrack set to true.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

{

    if (!(_x getVariable ["UO_FW_DontTrack", false])) then {

        _x call UO_FW_fnc_TrackUnit;

    };

} forEach allUnits;
