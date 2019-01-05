#include "\x\UO_FW\addons\main\script_macros.hpp"

//Script control
#define UO_FW_AI_EXEC_CHECK(ARG)\
_argUpper = toUpper(#ARG);\
if (!UO_FW_SERVER_HCMODULE_ALLOWED) exitWith {};\
if !(getMissionConfigValue ["UO_FW_AI_Enabled",false]) exitwith {};\
UO_FW_EXEC_CHECK(_argUpper)

// Locality Check and Redirect
#define UO_FW_AI_LOC_CHECK(ARG1)\
_argUpper = toUpper(#ARG1);\
if (isNil "UO_FW_var_HC_ID") then {_nul = [] call UO_FW_AI_fnc_checkifHC;};\
if ((_argUpper isEqualto "HCONLY") && (!isMultiplayer)) exitWith {\
	diag_log format ["script:%1 couldn't run, set to HC ONLY and in Singleplayer!",_fnc_scriptName];\
};\
if ((_argUpper isEqualto "HCONLY") && (hasInterface || isDedicated)) exitwith {\
	if (!isNil "UO_FW_var_HC_ID") then {\
		if (!(UO_FW_var_HC_ID isEqualto clientowner)) then {\
			_this remoteExec [_fnc_scriptName,UO_FW_var_HC_ID];\
		} else {\
			diag_log format ["script:%1 couldn't run, set to HC ONLY and no HC detected!",_fnc_scriptName];\
		};\
	};\
};\
if ((_argUpper isEqualto "AUTO") && (!isNil "UO_FW_var_HC_ID")) then {\
	if (isMultiplayer) exitwith {\
		if (!(UO_FW_var_HC_ID isEqualto clientowner)) then {\
			_this remoteExec [_fnc_scriptName,UO_FW_var_HC_ID];\
		};\
	};\
}
