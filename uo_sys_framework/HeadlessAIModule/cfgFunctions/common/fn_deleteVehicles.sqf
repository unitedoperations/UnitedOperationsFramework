#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params["_arr","_v","_a"];
{
	_v = _x;
	if (!(_v isKindOf "Logic") && !isNull _v) then {
		{
			_a = _x;
			detach _a;
			deleteVehicle _a;
		} foreach attachedObjects _v;
		deleteVehicle _v;
		deleteGroup (group _v);
	};
} forEach _arr;
