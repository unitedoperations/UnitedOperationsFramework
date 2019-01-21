#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

//_thisID _thisArgs
_this params ["_unit", "_corpse"];

UO_FW_SETPLPVAR(UO_FW_Body,_corpse);

//handle respawn delays, Rsc, gear & module settings, location, etc
