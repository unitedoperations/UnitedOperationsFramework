#include "..\..\Global\defs.hpp"
private _unit = _this;
private _ret = (alive (_unit) && !((_unit) getVariable [QEGVAR(Firemission,ArtIsFiring),false]) && ((_unit) getVariable [QEGVAR(Firemission,ArtReady),true]));
_ret;
