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
MESSAGE call EFUNC(Core,DebugMessage)

#define WARNING(MESSAGE) LOG_SYS_FILELINENUMBERS('WARNING',MESSAGE);\
MESSAGE call EFUNC(Core,DebugMessage)

//Debug functions
#define UO_FW_DEBUG(basicmsg,detailedmsg)\
[basicmsg,detailedmsg] call EFUNC(Core,DebugMessageDetailed)

#define GETMVALUEUO(var1,var2) getMissionConfigValue [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define GETMVALUE(var1,var2) getMissionConfigValue [ARR_2(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2)]
#define EGETMVALUE(var1,var2,var3) getMissionConfigValue [ARR_2(QUOTE(TRIPLES(PREFIX,var1,var2)),var3)]

//UO_FW_ Vars
#define GETVARUO_SYS(var1,var2) getVariable [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define SETVARUO_SYS(var1,var2) setVariable [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define SETPVARUO_SYS(var1,var2) setVariable [ARR_3(QUOTE(DOUBLES(PREFIX,var1)),var2,true)]

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2)]
#define EGETVAR_SYS(var1,var2,var3) getVariable [ARR_2(QUOTE(TRIPLES(PREFIX,var1,var2)),var3)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2)]
#define ESETVAR_SYS(var1,var2,var3) setVariable [ARR_2(QUOTE(TRIPLES(PREFIX,var1,var2)),var3)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2,true)]
#define ESETPVAR_SYS(var1,var2,var3) setVariable [ARR_3(QUOTE(TRIPLES(PREFIX,var1,var2)),var3,true)]

#define GETVARUO(var1,var2,var3) var1 GETVARUO_SYS(var2,var3)
#define GETPLVARUO(var1,var2) player GETVARUO_SYS(var1,var2)
#define GETMVARUO(var1,var2) missionNamespace GETVARUO_SYS(var1,var2)

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define EGETVAR(var1,var2,var3,var4) var1 EGETVAR_SYS(var2,var3,var4)
#define GETPLVAR(var1,var2) player GETVAR_SYS(var1,var2)
#define EGETPLVAR(var1,var2,var3) player EGETVAR_SYS(var1,var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define EGETMVAR(var1,var2,var3) missionNamespace EGETVAR_SYS(var1,var2,var3)

#define SETVARUO(var1,var2,var3) var1 SETVARUO_SYS(var2,var3)
#define SETMVARUO(var1,var2) missionNamespace SETVARUO_SYS(var1,var2)
#define SETMPVARUO(var1,var2) missionNamespace SETPVARUO_SYS(var1,var2)
#define SETPVARUO(var1,var2,var3) var1 SETPVARUO_SYS(var2,var3)
#define SETPLPVARUO(var1,var2) player SETPVARUO_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define ESETVAR(var1,var2,var3,var4) var1 ESETVAR_SYS(var2,var3,var4)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define ESETMVAR(var1,var2,var3) missionNamespace ESETVAR_SYS(var2,var3,var4)
#define SETMPVAR(var1,var2) missionNamespace SETPVAR_SYS(var1,var2)
#define ESETMPVAR(var1,var2,var3) missionNamespace ESETPVAR_SYS(var2,var3,var4)
#define SETPVAR(var1,var2,var3y) var1 SETPVAR_SYS(var2,var3)
#define ESETPVAR(var1,var2,var3,var4) var1 ESETPVAR_SYS(var2,var3,var4)
#define SETPLPVAR(var1,var2) player SETPVAR_SYS(var1,var2)
#define ESETPLPVAR(var1,var2,var3) player ESETPVAR_SYS(var1,var2,var3)

#define GVAR(var1) TRIPLES(PREFIX,COMPONENT,var1)
#define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQGVAR(var1) QUOTE(QGVAR(var1))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

//UO_FW_Component_fnc_functionName
#define FUNCUO(var1) TRIPLES(PREFIX,fnc,var1)
#define FUNC(var1) TRIPLES(PREFIX,fnc,DOUBLES(COMPONENT,var2))
#define QFUNC(var1) QUOTE(FUNC(var1))
#define EFUNC(var1,var2) TRIPLES(PREFIX,fnc,DOUBLES(var1,var2))
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))

#define CSTRING_2(var1,var2) QUOTE(DOUBLES($STR_UO_FW,DOUBLES(var1,var2)))

//Script control
#define UO_FW_EXEC_CHECK(ARG)\
_argUpper = toUpper(#ARG);\
if (isNil "UO_FW_Enabled") then {\
    UO_FW_Enabled = GETMVALUEUO(Enabled,false);\
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

#define UO_FW_VERSIONNUMBER (GETMVARUO(Version_UpdatedNumber,102))
#define UO_FW_VERSION_CHECK(VERSIONNUM) if (VERSIONNUM < UO_FW_VERSIONNUMBER) exitwith {};
