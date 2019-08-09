#include "defs.hpp"
#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
_ok = createDialog "FiremissionVirtual_DIA_POLARFIREMISSION";

private _id = POFM_DIA_IDC_GUNSELECT;

lbClear _id;

{
	_x params ["_name","_ready","_ammo","_guns","_disp","_reloadTime","_calcTime","_flightTime","_delayTime","_side"];

	if (_ready && side player == _side) then {
		lbAdd [_id,_name];
	};
} forEach GVAR(Batteries);

lbSetCurSel [_id,0];