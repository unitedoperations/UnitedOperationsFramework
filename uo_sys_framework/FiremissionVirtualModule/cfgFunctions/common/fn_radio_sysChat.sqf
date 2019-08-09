#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
_pre = param [0,1];
_msg = param [1,""];

if ([_pre] call FUNC(radio_checkFreq)) then {systemChat _msg};