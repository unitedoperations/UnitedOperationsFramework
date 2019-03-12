#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

{
    _x call FUNC(GearHandleEH);
} foreach (all3DENEntities select 0);
