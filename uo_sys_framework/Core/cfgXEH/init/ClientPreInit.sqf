#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

INFO("Client Pre Init");

["CBA_loadingScreenDone", {
	UO_FW_LoadedIntoMission = true;
}] call CBA_fnc_addEventHandler;

["UO_FW_EndMission_Event", {
	_this call UO_FW_fnc_dia_endscreen;
}] call CBA_fnc_addEventHandler;
