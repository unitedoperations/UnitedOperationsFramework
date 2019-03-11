#include "\x\UO_FW\addons\Main\script_mod.hpp"
#ifndef COMPONENT
    #define COMPONENT Main
#endif
#ifndef DEBUG_MODE_NORMAL
    #define DEBUG_MODE_FULL
#endif
#ifndef DEBUG_MODE_MINIMUM
    #define DEBUG_MODE_MINIMUM
#endif
#include "\x\cba\addons\Main\script_macros_common.hpp"

//CBA Error Macro Intercept
#define ERROR(MESSAGE) LOG_SYS_FILELINENUMBERS('ERROR',MESSAGE);\
MESSAGE call EFUNC(Debug,DebugMessage)

#define WARNING(MESSAGE) LOG_SYS_FILELINENUMBERS('WARNING',MESSAGE);\
MESSAGE call EFUNC(Debug,DebugMessage)

#define QN(var1) '##var1##'

#define ELSTRING_VAR(var1,var2,var3) ELSTRING(var1,DOUBLES(var2,var3))

//Debug functions
#define FWDEBUG(basicmsg,detailedmsg)\
[basicmsg,detailedmsg] call EFUNC(Debug,DebugMessageDetailed)

#define MGETMVALUE(var1,var2) getMissionConfigValue [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define GETMVALUE(var1,var2) getMissionConfigValue [ARR_2(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2)]
#define EGETMVALUE(var1,var2,var3) getMissionConfigValue [ARR_2(QUOTE(TRIPLES(PREFIX,var1,var2)),var3)]

//UO_FW_ Vars
#define GETVARM_SYS(var1,var2) getVariable [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define SETVARM_SYS(var1,var2) setVariable [ARR_2(QUOTE(DOUBLES(PREFIX,var1)),var2)]
#define SETPVARM_SYS(var1,var2) setVariable [ARR_3(QUOTE(DOUBLES(PREFIX,var1)),var2,true)]

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2)]
#define EGETVAR_SYS(var1,var2,var3) getVariable [ARR_2(QUOTE(TRIPLES(PREFIX,var1,var2)),var3)]

#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2)]
#define ESETVAR_SYS(var1,var2,var3) setVariable [ARR_2(QUOTE(TRIPLES(PREFIX,var1,var2)),var3)]

#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(TRIPLES(PREFIX,COMPONENT,var1)),var2,true)]
#define ESETPVAR_SYS(var1,var2,var3) setVariable [ARR_3(QUOTE(TRIPLES(PREFIX,var1,var2)),var3,true)]

#define MGETVAR(var1,var2,var3) var1 GETVARM_SYS(var2,var3)
#define MGETPLVAR(var1,var2) player GETVARM_SYS(var1,var2)
#define MGETMVAR(var1,var2) missionNamespace GETVARM_SYS(var1,var2)

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define EGETVAR(var1,var2,var3,var4) var1 EGETVAR_SYS(var2,var3,var4)

#define GETPLVAR(var1,var2) player GETVAR_SYS(var1,var2)
#define EGETPLVAR(var1,var2,var3) player EGETVAR_SYS(var1,var2,var3)

#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define EGETMVAR(var1,var2,var3) missionNamespace EGETVAR_SYS(var1,var2,var3)

#define MSETVAR(var1,var2,var3) var1 SETVARM_SYS(var2,var3)
#define MSETMVAR(var1,var2) missionNamespace SETVARM_SYS(var1,var2)
#define MSETMPVAR(var1,var2) missionNamespace SETPVARM_SYS(var1,var2)
#define MSETPVAR(var1,var2,var3) var1 SETPVARM_SYS(var2,var3)
#define MSETPLPVAR(var1,var2) player SETPVARM_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define ESETVAR(var1,var2,var3,var4) var1 ESETVAR_SYS(var2,var3,var4)

#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define ESETPVAR(var1,var2,var3,var4) var1 ESETPVAR_SYS(var2,var3,var4)

#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define ESETMVAR(var1,var2,var3) missionNamespace ESETVAR_SYS(var1,var2,var3)

#define SETMPVAR(var1,var2) missionNamespace SETPVAR_SYS(var1,var2)
#define ESETMPVAR(var1,var2,var3) missionNamespace ESETPVAR_SYS(var1,var2,var3)

#define SETPLVAR(var1,var2) player SETVAR_SYS(var1,var2)
#define ESETPLVAR(var1,var2,var3) player ESETVAR_SYS(var1,var2,var3)
#define SETPLPVAR(var1,var2) player SETPVAR_SYS(var1,var2)
#define ESETPLPVAR(var1,var2,var3) player ESETPVAR_SYS(var1,var2,var3)

#define MGVAR(var1) DOUBLES(PREFIX,var1)
#define QMGVAR(var1) QUOTE(MGVAR(var1))
#define GVAR(var1) TRIPLES(PREFIX,COMPONENT,var1)
#define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQGVAR(var1) QUOTE(QGVAR(var1))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

//UO_FW_Component_fnc_functionName
#define MFUNC(var1) TRIPLES(PREFIX,fnc,var1)
#define QMFUNC(var1) QUOTE(MFUNC(var1))
#define FUNC(var1) TRIPLES(PREFIX,fnc,DOUBLES(COMPONENT,var1))
#define QFUNC(var1) QUOTE(FUNC(var1))
#define EFUNC(var1,var2) TRIPLES(PREFIX,fnc,DOUBLES(var1,var2))
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))

#define CSTRING_2(var1,var2) QUOTE(DOUBLES($STR_UO_FW,DOUBLES(var1,var2)))

//Script control
#define EXEC_CHECK(ARG)\
_argUpper = toUpper(#ARG);\
if (isNil QEGVAR(Core,Enabled)) then {\
    EGVAR(Core,Enabled) = EGETMVALUE(Core,Enabled,false);\
};\
if ((_argUpper isEqualto "SERVER") && {(((!isServer) && isMultiplayer) || (!(EGVAR(Core,Enabled))))}) exitWith {}; \
if ((_argUpper isEqualto "CLIENT") && {((!hasinterface) || (!(EGVAR(Core,Enabled))))}) exitWith {};\
if ((_argUpper isEqualto "HC") && {(((hasinterface || isServer) && isMultiplayer) || (!(EGVAR(Core,Enabled))))}) exitWith {};\
if ((_argUpper isEqualto "CLIENTHC") && {(((isDedicated) && isMultiplayer) || (!(EGVAR(Core,Enabled))))}) exitWith {};\
if ((_argUpper isEqualto "SERVERHC") && {(((hasinterface) && isMultiplayer) || (!(EGVAR(Core,Enabled))))}) exitWith {};\
if ((_argUpper isEqualto "ALL") && {(!(EGVAR(Core,Enabled)))}) exitWith {};\
if (!(EGVAR(Core,Enabled))) exitWith {};\
if (!(MGVAR(Server_Framework_Allowed))) exitWith {}

#define EDEN_CHECK if !(is3DEN) exitwith {};

#define VERSIONNUMBER (MGETMVAR(Version_UpdatedNumber,102))
#define VERSION_CHECK(var1) if (var1 < VERSIONNUMBER) exitwith {};
