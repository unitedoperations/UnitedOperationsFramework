#include "..\..\Global\defs.hpp"
private _id = _this select 0;
private _shellSelect = _this select 1;
private _guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];


lbClear _id;
_i = 0;
private _usableGuns = [];
{
    if (_x call EFUNC(Firemission,isArtyAviable)) then {
       lbAdd [_id,_x call EFUNC(Firemission,GetArtyDisplayName)];
       lbSetValue [_id,_i,_forEachIndex];
       lbSetData [_id,_forEachIndex,_x];
       _i = _i + 1;
    };
} forEach _guns;
lbSetCurSel [_id,0];