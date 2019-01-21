/*    Description: Imports UO_FW mission attributes from clipboard or profilenamespace
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

LOG_1("ImportSettings params: %1",_this);
params [["_name",""],["_clipBoardMode",false]];

if (_clipBoardMode) then {
    private _settingsArray = call compile copyFromClipboard;
    LOG_1("_settingsArray: %1",_settingsArray);
    {
        _x params ["_section","_class","_value"];
        LOG_3("_section: %1 _class: %2 _value: %3",_section,_class,_value);
        _section set3DENMissionAttribute [_class,_value];
    } foreach _settingsArray;
} else {
    private _profileArray = profileNamespace getvariable ["UO_FW_ProfileSettingsArray",[]];
    if (_profileArray isEqualto []) exitwith {};
    private _found = false;
    LOG_1("_profileArray: %1",_profileArray);
    {
        _x params ["_nameArray","_settingsArray"];
        LOG_1("_nameArray: %1",_nameArray);
        if (_nameArray isEqualto _name) exitwith {
            _found = true;
            LOG_1("_settingsArray: %1",_settingsArray);
            {
                _x params ["_section","_class","_value"];
                LOG_3("_section: %1 _class: %2 _value: %3",_section,_class,_value);
                _section set3DENMissionAttribute [_class,_value];
            } foreach _settingsArray;
            LOG_1("loaded %1 settings preset!",_name);
        };
    } foreach _profileArray;
    if !(_found) exitwith {diag_log format ["settings preset %1 not found!",_name];};
};
