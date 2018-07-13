#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
private _unit = _this;
private _rounds = _unit call UO_FW_FNC_GetArtyFiremissionRoundsRequired;
private _callerName = _unit call UO_FW_FNC_GetArtyCallerText;
private _fireMissionText =_unit getVariable [VAR_SART_ARTFMTEXT,"Error"];
private _ret = _fireMissionText +"Rounds fired: " + (str (_rounds select 0)) + "/" + (str (_rounds select 1)) + "\nRequested by: " + (_unit call UO_FW_FNC_GetArtyCallerText);
_ret;
