#include "\x\cba\addons\main\script_macros_common.hpp"

//Expanding on CBA macros
#define PATHTO_FOLDER(var1) PATHTO_FOLDER_SYS(PREFIX,COMPONENT,var1)
#define QPATHTO_FOLDER(var1) QUOTE(PATHTO_FOLDER_SYS(PREFIX,COMPONENT,var1))

//Script control

#define UO_FW_EXEC_CHECK(ARG)\
_argUpper = toUpper(#ARG);\
if (isNil "UO_FW_Enabled") then {\
	UO_FW_Enabled = (getMissionConfigValue  ["UO_FW_Enabled",false]);\
};\
if(_argUpper == "SERVER" && (((!isServer) && isMultiplayer) || (!UO_FW_Enabled))) exitWith {}; \
if(_argUpper == "CLIENT" && ((!hasinterface) || (!UO_FW_Enabled))) exitWith {};\
if(_argUpper == "HC" && (((hasinterface || isServer) && isMultiplayer) || (!UO_FW_Enabled))) exitWith {};\
if(_argUpper == "CLIENTHC" && (((isDedicated) && isMultiplayer) || (!UO_FW_Enabled))) exitWith {};\
if(_argUpper == "SERVERHC" && (((hasinterface) && isMultiplayer) || (!UO_FW_Enabled))) exitWith {};\
if(_argUpper == "ALL" && (!UO_FW_Enabled)) exitWith {};\
if (!UO_FW_Enabled) exitWith {};

//Debug function call
#define UO_FW_DEBUG(basicmsg,detailedmsg)\
[basicmsg,detailedmsg] call UO_FW_fnc_DebugMessageDetailed;

#define UO_FW_VAR(NAME,DEFAULT)\
missionNamespace getVariable [#NAME,#DEFAULT];
