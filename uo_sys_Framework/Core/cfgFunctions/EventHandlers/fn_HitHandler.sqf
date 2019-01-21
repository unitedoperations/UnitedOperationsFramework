//IGNORE_PRIVATE_WARNING ["_thisType", "_thisID"];

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

_this params ["_unit", "_source", "_damage", "_instigator"];

LOG("HIT EH");
if ((vehicle _instigator != vehicle player) && {_instigator != objNull}) then {
    LOG("HIT EH VALID");
    //we store this information in case it's needed if killed EH doesn't fire
    UO_FW_Killcam_LastHit = [_instigator, time, ASLtoAGL eyePos _unit, ASLtoAGL eyePos _instigator];
    UO_FW_Killcam_LastHitDamage = _damage;
};
if (_damage > 1) then {_damage = 1};
