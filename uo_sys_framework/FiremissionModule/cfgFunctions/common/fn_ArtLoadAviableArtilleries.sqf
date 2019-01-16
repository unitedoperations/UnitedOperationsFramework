#include "..\..\Global\defs.hpp"
private _id = _this select 0;
private _shellSelect = _this select 1;
private _guns = player getVariable [VAR_SART_OBSGUNS,[]];
private _usableGuns = [];
{
	if (_x call UO_FW_FNC_IsArtyAviable) then {
		_usableGuns pushBack _x;
	};
}forEach _guns;


lbClear _id;
{
	lbAdd [_id,_x call UO_FW_FNC_GetArtyDisplayName];

}forEach _usableGuns;
lbSetCurSel [_id,0];