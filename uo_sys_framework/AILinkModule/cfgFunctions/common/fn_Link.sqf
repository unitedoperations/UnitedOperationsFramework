#define COMPONENT AILink
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

private ["_groups","_thisGroup","_thatGroup","_thisLR","_thisSR","_thatLR","_thatSR","_range"];

if (isNil QGVAR(debug)) then {GVAR(debug) = false};
if (GVAR(transDelay) > GVAR(shareDelay)) then {
    GVAR(transDelay) = GVAR(shareDelay)
};

private _allLinkGroups = [];
{    //Remove player controlled groups
    if !(isPlayer (leader _x)) then {
        _allLinkGroups set [count _allLinkGroups,_x];
    };
} forEach allGroups;

if (GVAR(debug)) then {
    LOG_1("Link Groups: %1",_allLinkGroups);
};

{    //Share that sweet, sweet info
    _thisGroup = _x;
    _groups = _groups - [_thisGroup];
    {
        _thatGroup = _x;
        if (side _thisGroup == side _thatGroup) then {
            if (GVAR(needRadio)) then {
                private _thisArray = [_thisGroup] call FUNC(EvalRadio);
                private _thatArray = [_thatGroup] call FUNC(EvalRadio);

                _thisLR = _thisArray select 0;
                _thisSR = _thisArray select 1;
                _thatLR = _thatArray select 0;
                _thatSR = _thatArray select 1;
            } else {
                _thisLR = true;
                _thisSR = true;
                _thatLR = true;
                _thatSR = true;
            };

            _range = 25;
            if (_thisLR && _thatLR) then {
                _range = GVAR(longRange);
            } else {
                if (_thisSR && _thatSR) then {
                    _range = GVAR(shortRange);
                };
            };

            private _checkUnits = allUnits;
            if (isMultiplayer) then {_checkUnits = playableUnits};
            {
                if ((_thisGroup knowsAbout _x > _thatGroup knowsAbout _x) && {_thisGroup knowsAbout _x > 1} && {_thatGroup knowsAbout _x < 1.5} && {(leader _thisGroup distance2D _x) <= _range}) then {
                    private _waitTime = random(GVAR(transDelay));
                    [{
                        params ["_thatGroup","_thisGroup","_targUnit"];
                        private _revAmt = _thisGroup knowsAbout _targUnit;
                        if (_revAmt > GVAR(maxKnows)) then {_revAmt = GVAR(maxKnows)};
                        if (_revAmt > _thatGroup knowsAbout _targUnit) then {_thatGroup reveal [_targUnit,_revAmt];};

                        if (GVAR(debug)) then {diag_log format["Update || This: %1 | That: %2 | Targ: %3 | Knows:%4",_thisGroup,_thatGroup,_targUnit,_revAmt];};
                    }, [_thatGroup,_thisGroup,_x],_waitTime] call CBA_fnc_waitAndExecute;
                    if (GVAR(debug)) then {diag_log format["Pre-update || This: %1 | That: %2 | Targ: %3",_thisGroup,_thatGroup,_x];};
                };
                if (GVAR(debug)) then {diag_log format["Check || This: %1 | That: %2 | Targ: %3",_thisGroup knowsAbout _x,_thatGroup knowsAbout _x,_x];};
            } forEach _checkUnits;

            if (GVAR(debug)) then {diag_log format["Rem Groups: %1 | This: %2 | That:%3 | ThisLR:%4 | ThatLR:%5 | Range:%6",_groups,_thisGroup,_thatGroup,_thisLR,_thatLR,_range];};
        };
    } forEach _groups;
    _groups = _allLinkGroups;
} forEach _allLinkGroups;

[{call FUNC(Link)},[],GVAR(shareDelay)] call CBA_fnc_waitAndExecute;
