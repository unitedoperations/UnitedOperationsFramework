#include "..\..\Global\defs.hpp"
#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"

if (!((_this) getVariable [QEGVAR(Firemission,ArtHasEH),false])) then {
        (_this) addeventhandler ["firedMan", {(_this select 0) setvehicleammo 1}];
        (_this) setVariable [QEGVAR(Firemission,ArtHasEH),true];
};
