/*    Description: Imports ACE Arsenal Mission Loadouts from clipboard or profilenamespace
 *    Arguments:
 *         STRING - Setting preset name, not used if copying from clipboard
 *         BOOL - Clipboard mode, false imports settings from named array from profileNamespace
 *    Return Value:
 *         ARRAY
 *    Author
 *        R3vo & PiZZADOX
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

params [["_name",""],["_clipBoardMode",false]];

private _loadoutList = (missionNamespace getVariable ["ace_arsenal_defaultLoadoutsList", []]);
if (_clipBoardMode) then {
    private _copyData = call compile copyFromClipboard;
    if (_loadoutList isEqualTo []) then {
        missionNamespace setVariable ["ace_arsenal_defaultLoadoutsList", _copyData];
    } else {
        ace_arsenal_defaultLoadoutsList append _copyData;
    };
    LOG("Loaded Loadout Settings from Clipboard!");
} else {
    private _profileArray = profileNamespace getvariable ["UO_FW_ProfileLoadoutSettingsArray",[]];
    if (_profileArray isEqualto []) exitwith {};
    private _found = false;
    {
        _x params ["_nameArray","_loadoutListArray"];
        if (_nameArray isEqualto _name) exitwith {
            _found = true;
            if (_loadoutList isEqualTo []) then {
                missionNamespace setVariable ["ace_arsenal_defaultLoadoutsList", _loadoutListArray];
            } else {
                ace_arsenal_defaultLoadoutsList append _loadoutListArray;
            };
            LOG_1("Loaded %1 Loadout Preset from Profile!",_name);
        };
    } foreach _profileArray;
    if !(_found) exitwith {
        ERROR_1("%1 Loadout Preset not found in Profile!",_name);
    };
};
