#include "..\..\Global\defs.hpp"
private _unit = _this;
private _rounds = _unit call EFUNC(Firemission,GetArtyFiremissionRoundsRequired);
private _callerName = _unit call EFUNC(Firemission,GetArtyCallerText);
private _fireMissionText =_unit getVariable [QEGVAR(Firemission,ArtFMText),"Error"];
private _ret = _fireMissionText +"Rounds fired: " + (str (_rounds select 0)) + "/" + (str (_rounds select 1)) + "\nRequested by: " + (_unit call EFUNC(Firemission,GetArtyCallerText));
_ret;
