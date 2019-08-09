#include "..\..\Global\defs.hpp"
    private _unit = _this select 0;
    private _roundsFired = _this select 1;
    private _roundsRequired = _this select 2;
    _unit setVariable [QEGVAR(Firemission,ArtRoundsFired),[_roundsFired,_roundsRequired],true];