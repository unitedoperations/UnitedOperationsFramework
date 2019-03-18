/*    Description: Create a vehicle and apply required settings.
 *     Arguments:
 *         ARRAY    - Position to create the vehicle at
 *        ARRAY    - Required Unit Settings
 *     Return Value:
 *         OBJECT     - Vehicle with settings
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_pos","_vehArgs","_side",["_initmode",false,[false]]];
_vehArgs params ["_uv","_vehClass","_vehpos","_vectorDir","_vectorUp","_damage","_fuel","_turretMags","_locked","_vehInWater","_vehName","_persistent","_vehInit","_fly","_flyInHeight"];
LOG_1("_vehArgs: %1",_vehArgs);
private _flying = "NONE";
if (_fly && {(_vehClass isKindOf "Air")}) then {
    _flying = "FLY";
};
if (_flying isEqualTo "FLY") then {
    _pos = ([_pos select 0, _pos select 1, _flyInHeight] vectorAdd [0,0,150]);
};
private _vehicle = createVehicle [_vehClass, _pos,[],0,_flying];
_vehicle setVectorDirAndUp [_vectorDir,_vectorUp];
_vehicle setPosATL _pos;
if (_fly) then {
    _vehicle FlyInHeight _flyInHeight;
    _vehicle setVelocity [((velocity _vehicle) select 0) + (sin (getDir _vehicle) * 80),((velocity _vehicle) select 1) + (cos (getDir _vehicle) * 80),((velocity _vehicle) select 2)];
};
_vehicle setDamage _damage;
_vehicle setFuel _fuel;
_vehicle lock _locked;
{
    _x params [["_class","",[""]],["_path",[],[[]]],["_ammo",0,[0]]];
    _vehicle setMagazineTurretAmmo [_class,_ammo,_path];
} forEach _turretMags;
if !(_vehName isEqualto "") then {
    missionNamespace setVariable [_vehName, _vehicle];
};
if (UO_FW_AutoTrackAsset_Enabled) then {
    private _team = switch (_side) do {
        case west: {EGVAR(Core,TeamName_Blufor)};
        case east: {EGVAR(Core,TeamName_Opfor)};
        case independent: {EGVAR(Core,TeamName_Indfor)};
        case civilian: {EGVAR(Core,TeamName_Civ)};
        default {""};
    };
    if !(_team isEqualto "") then {
        private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
        if (isText(_vehCfg >> "displayName")) then {
            [QEGVAR(Core,TrackAssetEvent),[_vehicle, getText(_vehCfg >> "displayName"), _team]] call CBA_fnc_serverEvent;
        };
    };
};
[_vehicle,_persistent] call EFUNC(AI,setPersistent);
if (_initmode) then {
    _vehicle call _vehInit;
} else {
    _vehicle spawn _vehInit;
};
_vehicle
