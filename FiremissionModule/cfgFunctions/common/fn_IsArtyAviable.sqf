#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
private _unit = _this;
private _ret = (alive (_unit) && !((_unit) getVariable [VAR_SART_ARTINFIREMISSION,false]) && ((_unit) getVariable [VAR_SART_IsAviable,true]));
_ret;
