/*    Description: Sets ACRE Presets and ACRE unit settings
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        PiZZADOX & Sacher
 */

#define COMPONENT ACRE
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);
if !(UO_FW_Server_ACREModule_Allowed) exitwith {};

[QEGVAR(Core,SettingsLoaded), {
    if(GETMVAR(SCRAMBLE_Enabled,false)) then
    {
        {
            private _vehicle = _x;
            if(GETVAR(_vehicle,VehicleACRE_Enabled,false)) then {

                private _preset = ["default2", "default3", "default4", "default"];
                private _names = ["Default","Blufor","Opfor","Indfor","Civilian"];
                private _var = GETVAR(_vehicle,VehicleACREPreset,"Default");
                private _index = _names find _var;
                //ignore if Default or not found
                if(_index > 0) then {
                    private _selectedPresetIndex = _index - 1;
                    private _selectedPreset = _preset select  _selectedPresetIndex;
                    LOG_2("Setting vehicle %1 to preset %2",_vehicle,_selectedPreset);
                    [_vehicle, _selectedPreset] call acre_api_fnc_setVehicleRacksPreset;

                };

            };
           

        }forEach vehicles;
    };
    
}] call CBA_fnc_addEventHandler;
