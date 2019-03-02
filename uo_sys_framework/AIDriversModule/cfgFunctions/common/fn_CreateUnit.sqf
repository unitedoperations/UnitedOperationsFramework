/*    Description: Creates AI Driver
 *    Arguments:
 *         OBJECT - vehicle
 *         OBJECT - player
 *    Return Value:
 *         ARRAY
 *    Author
 *        BlackHawk & PiZZADOX
 */

#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_target", "_caller"];

if (!isNull driver _target) exitWith {};
private _turret = (assignedVehicleRole _caller) select 1;
_caller moveInDriver _target;
_caller moveInTurret [_target, _turret];

private _class = "B_Soldier_F";
if (side _caller == EAST) then {
    _class = "O_Soldier_F";
};
if (side _caller == INDEPENDENT) then {
    _class = "I_Soldier_F";
};

private _unit = createAgent [_class, [0,0,0], [], 0, "CAN_COLLIDE"];

removeAllWeapons _unit;
removeUniform _unit;
removeVest _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform uniform _caller;
_unit addVest vest _caller;
_unit addHeadGear headGear _caller;

SETPVAR(_target,driver,_unit);

_unit moveInDriver _target;
_unit setBehaviour "COMBAT";

doStop _unit;

GVAR(LastTimeIn) = time;

[{vehicle (_this select 0) != _this select 0}, { //waiting for spawned unit to get into vehicle
    private _pfhHandle = [{
        params ["_args","_pfhID"];
        _args params ["_unit", "_target", "_caller"];

        if (vehicle _caller != _target) then {
            [false] call FUNC(toggleDriverCam);
            _unit disableAI "Path";
            doStop _unit;
        } else {
            _unit enableAI "Path";
            GVAR(LastTimeIn) = time;
        };
        if ((CBA_missionTime > 120 + (GVAR(LastTimeIn)))
            || !alive _target
            || !alive _caller
            || !alive _unit
            || (vehicle _unit != _target)
            || (vehicle _unit != vehicle _caller)
            || (driver _target != _unit)
        ) then {
            [_target, _caller] call FUNC(removeUnit);
        };
    }, 1, _this] call CBA_fnc_addPerFrameHandler;
    SETPVAR((_this select 1),pfhID,[(_this select 2), _pfhHandle]);
}, [_unit, _target, _caller]] call CBA_fnc_WaitUntilAndExecute;

GVAR(Vehicle) = _target;
hint "Driver added";
