#include "\x\cba\addons\main\script_macros_common.hpp"

// Expanding on CBA macros
#define PATHTO_FOLDER(var1) PATHTO_FOLDER_SYS(PREFIX,COMPONENT,var1)
#define QPATHTO_FOLDER(var1) QUOTE(PATHTO_FOLDER_SYS(PREFIX,COMPONENT,var1))

#define UO_FW_EXEC_CHECK(arg)\
_argUpper = (toUpper #arg);\
switch (_argUpper) do {\
	case "SERVER": {if ((!isServer) || !(UO_FW_Enabled)) exitwith {};};\
	case "CLIENT": {if ((!hasinterface) || !(UO_FW_Enabled)) exitwith {};};\
	case "HC": {if ((hasinterface || isServer) || !(UO_FW_Enabled)) exitwith {};};\
	case "CLIENTHC": {if ((isDedicated) || !(UO_FW_Enabled)) exitwith {};};\
	case "SERVERHC": {if ((hasinterface) || !(UO_FW_Enabled)) exitwith {};};\
	case "ALL": {if (!UO_FW_Enabled) exitwith {};};\
	default {if (!UO_FW_Enabled) exitwith {};};\
};

#define UO_FW_DEBUG(basicmsg,detailedmsg)\
_basicmsg = basicmsg; _detailedmsg = detailedmsg;\
if ((UO_FW_Debug_Enabled) && !(UO_FW_Debug_Detailed_Enabled)) then {\
	if (!((typename _basicmsg) isEqualto "STRING") && !(_basicmsg isEqualto "")) then {_basicmsg = format ["%1",_basicmsg];};\
	_basicmsg call UO_FW_fnc_DebugMessage;\
};\
if (UO_FW_Debug_Detailed_Enabled) then {\
	if (!((typename _detailedmsg) isEqualto "STRING") && !(_basicmsg isEqualto "")) then {_detailedmsg = format ["%1",_detailedmsg];};\
	_detailedmsg call UO_FW_fnc_DebugMessage;\
	diag_log _detailedmsg;\
};

#define UO_FW_ADDTEAM(SIDE,NAME,TYPE)\
[SIDE, NAME, TYPE] call UO_FW_fnc_AddTeam;