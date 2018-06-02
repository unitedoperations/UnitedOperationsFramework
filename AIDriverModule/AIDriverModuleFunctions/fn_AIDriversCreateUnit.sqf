params ["_target", "_caller"];

if (!isNull driver _target) exitWith {};
private _turret = (assignedVehicleRole _player) select 1;
_caller moveInDriver _target;
_caller moveInTurret [_target, _turret];

private _class = "B_Soldier_F";
if (side _caller == EAST) then {
    _class = "O_Soldier_F";
};
if (side _caller == INDEPENDENT) then {
    _class = "I_Soldier_F";
};

_unit = createAgent [_class, [0,0,0], [], 0, "CAN_COLLIDE"];

removeAllWeapons _unit;
removeUniform _unit;
removeVest _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform uniform _caller;
_unit addVest vest _caller;
_unit addHeadGear headGear _caller;

_target setVariable ["aidrivers_driver", _unit, true];

_unit moveInDriver _target;
_unit setBehaviour "COMBAT";

doStop _unit;

[{vehicle (_this select 0) != _this select 0}, { //waiting for spawned unit to get into vehicle
    private _pfhID = [{
        _this select 0 params ["_unit", "_target", "_caller"];

        private _handle = _this select 1;
        if (vehicle _caller != _target) then {
            _unit disableAI "PATH";
            doStop _unit;
        } else {
            _unit enableAI "PATH";
        };
        if (!alive _target || !alive _caller || !alive _unit || (vehicle _unit) != _target || (driver _target) != _unit) then {
            [_target, _caller] call UO_fnc_AIDriversRemoveUnit;
        };
    }, 1, _this] call CBA_fnc_addPerFrameHandler;
    (_this select 1) setVariable ["aidrivers_pfhID", [(_this select 2), _pfhID], true];
}, [_unit, _target, _caller]] call CBA_fnc_WaitUntilAndExecute;

hint "Driver added";
