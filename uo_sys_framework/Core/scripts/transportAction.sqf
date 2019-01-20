_id = _this select 2;
_targets = [];

{

    if ((side player) == (side _x) && (leader _x == _x)) then {

        _targets set [count _targets, _x];

    };

} forEach playableUnits;

(format ["%1 joined the mission and is requesting transport.", name player]) remoteExec ["hint", _targets];

player removeAction _id;
