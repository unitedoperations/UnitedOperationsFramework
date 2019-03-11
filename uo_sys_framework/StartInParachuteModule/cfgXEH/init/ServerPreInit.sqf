#define COMPONENT StartInParachute
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);
if (!UO_FW_Server_StartInParachuteModule_Allowed) exitWith {};
if !(GETMVAR(Enabled,false)) exitwith {};
