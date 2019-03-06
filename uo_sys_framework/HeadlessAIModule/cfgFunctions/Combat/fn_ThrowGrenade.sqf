private ["_RandomChance", "_myNearestEnemy", "_CheckDistance", "_DirectionSet", "_Directionset"];
params ["_Unit","_GRENADETHROWN"];

if ((isNull _Unit) || {!(alive _Unit)}) exitWith {};

_RandomChance = (round (random 100));

if (_RandomChance < UO_FW_AI_GRENADECHANCE) then {

    _myNearestEnemy = _Unit call EFUNC(AI,ClosestEnemy);
    if (isNil "_myNearestEnemy") exitWith {};
    if (typeName _myNearestEnemy isEqualTo "ARRAY") exitWith {};

    if !(_GRENADETHROWN) then {
        _CheckDistance = (_Unit distance _myNearestEnemy);
        private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _myNearestEnemy];
        if (_cansee > 0.5) then {
            if (_CheckDistance < 60 && {_CheckDistance > 6}) then {
                _DirectionSet = [_Unit,_myNearestEnemy] call BIS_fnc_dirTo;
                _Unit setDir _Directionset;
                _Unit forceWeaponFire ["HandGrenadeMuzzle","HandGrenadeMuzzle"];
                _Unit forceWeaponFire ["MiniGrenadeMuzzle","MiniGrenadeMuzzle"];
            };
        };

        if (_CheckDistance < 5000) then {
                if (UO_FW_AI_USESMOKE) then {
                    _DirectionSet = [_Unit, _myNearestEnemy] call BIS_fnc_dirTo;
                    _Unit setDir _Directionset;
                    _Unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
                };
        };

    };

};
