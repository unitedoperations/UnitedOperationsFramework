#include "\x\UO_FW\addons\Main\script_mod.hpp"
#ifndef COMPONENT
    #define COMPONENT Main
#endif
#ifndef DEBUG_MODE_MINIMUM
    #define DEBUG_MODE_MINIMUM
#endif
#define DEBUG_MODE_FULL
#include "\x\cba\addons\Main\script_macros_common.hpp"

//CBA Error Macro Intercept
#define ERROR(MESSAGE) LOG_SYS_FILELINENUMBERS('ERROR',MESSAGE);\
MESSAGE call UO_FW_fnc_DebugMessage

#define WARNING(MESSAGE) LOG_SYS_FILELINENUMBERS('WARNING',MESSAGE);\
MESSAGE call UO_FW_fnc_DebugMessage

//Debug functions
#define UO_FW_DEBUG(basicmsg,detailedmsg)\
[basicmsg,detailedmsg] call UO_FW_fnc_DebugMessageDetailed

#define GETMVALUE(var1,var2) getMissionConfigValue [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]

//UO_FW_ Vars
#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(DOUBLES(PREFIX,var1)),var2,true)]

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETPLVAR(var1,var2) player GETVAR_SYS(var1,var2)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPLVAR(var1,var2) player SETVAR_SYS(var1,var2)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETMPVAR(var1,var2) missionNamespace SETPVAR_SYS(var1,var2)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETPLPVAR(var1,var2) player SETPVAR_SYS(var1,var2)

//UO_FW_Component_fnc_functionName
#define FUNC(var1) TRIPLES(PREFIX,fnc,var1)

#define CSTRING_2(var1,var2) QUOTE(DOUBLES($STR_UO_FW,DOUBLES(var1,var2)))

//Script control
#define UO_FW_EXEC_CHECK(ARG)\
_argUpper = toUpper(#ARG);\
if (isNil "UO_FW_Enabled") then {\
    UO_FW_Enabled = GETMVALUE(Enabled,false);\
};\
if ((_argUpper isEqualto "SERVER") && {(((!isServer) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {}; \
if ((_argUpper isEqualto "CLIENT") && {((!hasinterface) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper isEqualto "HC") && {(((hasinterface || isServer) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper isEqualto "CLIENTHC") && {(((isDedicated) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper isEqualto "SERVERHC") && {(((hasinterface) && isMultiplayer) || (!UO_FW_Enabled))}) exitWith {};\
if ((_argUpper isEqualto "ALL") && {(!UO_FW_Enabled)}) exitWith {};\
if (!UO_FW_Enabled) exitWith {};\
if (!UO_FW_Server_Framework_Allowed) exitWith {}

#define UO_FW_3DEN_CHECK if !(is3DEN) exitwith {};

#define UO_FW_VERSIONNUMBER (GETMVAR(Version_UpdatedNumber,102))
#define UO_FW_VERSION_CHECK(VERSIONNUM) if (VERSIONNUM < UO_FW_VERSIONNUMBER) exitwith {};
