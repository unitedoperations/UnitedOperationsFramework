#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _caller = _this select 1;
    _unit setVariable [QEGVAR(Firemission,ArtCaller),_caller,true];