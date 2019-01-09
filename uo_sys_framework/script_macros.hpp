#include "\x\UO_FW\addons\main\script_mod.hpp"
#ifndef COMPONENT
#define COMPONENT Main
#endif
#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros_common.hpp"

//Script control
#define UO_FW_EXEC_CHECK(ARG)\
_argUpper = toUpper(#ARG);\
if (isNil "UO_FW_Enabled") then {\
	UO_FW_Enabled = (getMissionConfigValue ["UO_FW_Enabled",false]);\
};\
if ((_argUpper == "SERVER") && {(((!isServer) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {}; \
if ((_argUpper == "CLIENT") && {((!hasinterface) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper == "HC") && {(((hasinterface || isServer) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper == "CLIENTHC") && {(((isDedicated) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper == "SERVERHC") && {(((hasinterface) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper == "ALL") && {(!UO_FW_Enabled)}) exitWith {};\
if (!UO_FW_Enabled) exitWith {};\
if (!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith {}

//Debug functions
#define UO_FW_DEBUG(basicmsg,detailedmsg)\
[basicmsg,detailedmsg] call UO_FW_fnc_DebugMessageDetailed

#define UO_FW_GET_VAR(NAME,DEFAULT)\
missionNamespace getVariable [#NAME,DEFAULT]
