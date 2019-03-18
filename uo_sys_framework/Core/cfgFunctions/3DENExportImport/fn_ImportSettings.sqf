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
EDEN_CHECK;

params [["_name",""],["_clipBoardMode",false]];

if (_clipBoardMode) then {
    private _settingsArray = call compile copyFromClipboard;
    {
        _x params ["_section","_class","_value"];
        _section set3DENMissionAttribute [_class,_value];
    } foreach _settingsArray;
} else {
    private _profileArray = profileNamespace getvariable [QEGVAR(Core,ProfileSettingsArray),[]];
    if (_profileArray isEqualto []) exitwith {};
    private _found = false;
    {
        _x params ["_nameArray","_settingsArray"];
        if (_nameArray isEqualto _name) exitwith {
            _found = true;
            {
                _x params ["_section","_class","_value"];
                LOG_3("_section: %1 _class: %2 _value: %3",_section,_class,_value);
                _section set3DENMissionAttribute [_class,_value];
            } foreach _settingsArray;
            LOG_1("Loaded %1 Settings Preset from Profile!",_name);
        };
    } foreach _profileArray;
    if !(_found) exitwith {
        ERROR_1("%1 Settings Preset not found in Profile!",_name);
    };
};
[] call FUNC(BasicSettings3DEN);
