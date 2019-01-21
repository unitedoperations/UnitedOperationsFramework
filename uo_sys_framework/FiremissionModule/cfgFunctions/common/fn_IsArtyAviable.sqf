#include "..\..\Global\defs.hpp"
private _unit = _this;
private _ret = (alive (_unit) && !((_unit) getVariable [VAR_SART_ARTINFIREMission,false]) && ((_unit) getVariable [VAR_SART_IsAviable,true]));
_ret;
