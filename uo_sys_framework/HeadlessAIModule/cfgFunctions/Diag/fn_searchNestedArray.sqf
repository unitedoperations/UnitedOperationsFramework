#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

private ["_index", "_nestedArray"];

params ["_givenSearchArray","_givenSearchValue","_desiredIndex"];

scopeName "Main";
_index = -1;

{
    private _currentIndex = _forEachIndex;
    if (_desiredIndex != -1) then {
        if ((_x select _desiredIndex) isEqualTo _givenSearchValue) exitWith {
            _index = _currentIndex;
        };
    } else {
        _nestedArray = _x;
        {
            if (_x isEqualTo _givenSearchValue) then {
                _index = _currentIndex;
                breakTo "Main";
            };
        } forEach _nestedArray;
    };
} forEach _givenSearchArray;

(_index)
