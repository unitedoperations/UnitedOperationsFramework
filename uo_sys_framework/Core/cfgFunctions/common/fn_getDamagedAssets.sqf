/*
 * Author: Olsen
 *
 * Outputs disabled and destroyed tracked assets for set team.
 *
 * Arguments:
 * 0: team <string>
 *
 * Return Value:
 * disabled and destroyed assets <array>
 *
 * Public: No
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_team"];

private _disabledAssets = [];
private _destroyedAssets = [];
{
    if (_x getVariable "UO_FW_AssetTeam" isEqualto _team) then {
        if (alive _x) then {
            if (!canMove _x && {!canFire _x}) then {
                _disabledAssets set [count _disabledAssets, _x getVariable "UO_FW_AssetName"];
            };
        } else {
            _destroyedAssets set [count _destroyedAssets, _x getVariable "UO_FW_AssetName"];
        };
    };
} forEach vehicles;
_destroyedAssets = _destroyedAssets call UO_FW_fnc_StackNames;
_disabledAssets = _disabledAssets call UO_FW_fnc_StackNames;
[_disabledAssets, _destroyedAssets]
