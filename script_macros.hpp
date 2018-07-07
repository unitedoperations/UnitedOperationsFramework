#include "\x\cba\addons\main\script_macros_common.hpp"

//Expanding on CBA macros
#define PATHTO_FOLDER(var1) PATHTO_FOLDER_SYS(PREFIX,COMPONENT,var1)
#define QPATHTO_FOLDER(var1) QUOTE(PATHTO_FOLDER_SYS(PREFIX,COMPONENT,var1))

//Script control

#define UO_FW_EXEC_CHECK(ARG)\
_argUpper = (toUpper #ARG);\
scopeName "ExecCheck";\
if (isNil "UO_FW_Enabled") then {\
	UO_FW_Enabled = (getMissionConfigValue ["UO_FW_Enabled",false]);\
};\
switch (_argUpper) do {\
	case "SERVER": {breakTo "ExecCheck"; if (((!isServer) && isMultiplayer) || (!UO_FW_Enabled)) exitwith {};};\
	case "CLIENT": {breakTo "ExecCheck"; if ((!hasinterface) || (!UO_FW_Enabled)) exitwith {};};\
	case "HC": {breakTo "ExecCheck"; if (((hasinterface || isServer) && isMultiplayer) || (!UO_FW_Enabled)) exitwith {};};\
	case "CLIENTHC": {breakTo "ExecCheck"; if (((isDedicated) && isMultiplayer) || (!UO_FW_Enabled)) exitwith {};};\
	case "SERVERHC": {breakTo "ExecCheck"; if (((hasinterface) && isMultiplayer) || (!UO_FW_Enabled)) exitwith {};};\
	case "ALL": {breakTo "ExecCheck"; if (!UO_FW_Enabled) exitwith {};};\
	default {breakTo "ExecCheck"; if (!UO_FW_Enabled) exitwith {};};\
};

//Debug function call

#define UO_FW_DEBUG(basicmsg,detailedmsg)\
[basicmsg,detailedmsg] call UO_FW_fnc_DebugMessageMacro;

//Gear/Groups

#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {

#define END_GROUP };', _temp]

#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]