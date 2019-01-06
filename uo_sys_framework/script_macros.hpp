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

#define UO_FW_DEBUG_1(basicmsg,detailedmsg,arg1)\
diag_log "called debug macro";\
if (detailedmsg isEqualto "") then {\
	basicmsg call UO_FW_fnc_DebugMessage;\
} else {\
	private _dmsgstring = detailedmsg;\
	if (((_dmsgstring find "%1") isEqualto -1) && !(#arg1 isEqualto "")) then {\
		_arg1string = format ["%1",arg1];\
		_dmsgstring = [_dmsgstring, "%1", _arg1string] call CBA_fnc_replace;\
	};\
	diag_log format ["basicmsg: %1 \n _dmsgstring: %2",basicmsg,_dmsgstring];\
	[basicmsg,_dmsgstring] call UO_FW_fnc_DebugMessageDetailed;\
}

#define UO_FW_DEBUG_2(basicmsg,detailedmsg,arg1,arg2)\
diag_log "called debug macro";\
if (detailedmsg isEqualto "") then {\
	basicmsg call UO_FW_fnc_DebugMessage;\
} else {\
	private _dmsgstring = detailedmsg;\
	if (((_dmsgstring find "%1") isEqualto -1) && !(#arg1 isEqualto "")) then {\
		_arg1string = format ["%1",arg1];\
		_dmsgstring = [_dmsgstring, "%1", _arg1string] call CBA_fnc_replace;\
	};\
	if (((_dmsgstring find "%2") isEqualto -1) && !(#arg2 isEqualto "")) then {\
		_arg2string = format ["%1",arg2];\
		_dmsgstring = [_dmsgstring, "%2", _arg2string] call CBA_fnc_replace;\
	};\
	diag_log format ["basicmsg: %1 \n _dmsgstring: %2",basicmsg,_dmsgstring];\
	[basicmsg,_dmsgstring] call UO_FW_fnc_DebugMessageDetailed;\
}

#define UO_FW_DEBUG_3(basicmsg,detailedmsg,arg1,arg2,arg3)\
diag_log "called debug macro";\
if (detailedmsg isEqualto "") then {\
	basicmsg call UO_FW_fnc_DebugMessage;\
} else {\
	private _dmsgstring = detailedmsg;\
	if (((_dmsgstring find "%1") isEqualto -1) && !(#arg1 isEqualto "")) then {\
		_arg1string = format ["%1",arg1];\
		_dmsgstring = [_dmsgstring, "%1", _arg1string] call CBA_fnc_replace;\
	};\
	if (((_dmsgstring find "%2") isEqualto -1) && !(#arg2 isEqualto "")) then {\
		_arg2string = format ["%1",arg2];\
		_dmsgstring = [_dmsgstring, "%2", _arg2string] call CBA_fnc_replace;\
	};\
	if (((_dmsgstring find "%3") isEqualto -1) && !(#arg3 isEqualto "")) then {\
		_arg3string = format ["%1",arg3];\
		_dmsgstring = [_dmsgstring, "%3", _arg3string] call CBA_fnc_replace;\
	};\
	diag_log format ["basicmsg: %1 \n _dmsgstring: %2",basicmsg,_dmsgstring];\
	[basicmsg,_dmsgstring] call UO_FW_fnc_DebugMessageDetailed;\
}

#define UO_FW_DEBUG_4(basicmsg,detailedmsg,arg1,arg2,arg3,arg4)\
diag_log "called debug macro";\
if (detailedmsg isEqualto "") then {\
	basicmsg call UO_FW_fnc_DebugMessage;\
} else {\
	private _dmsgstring = detailedmsg;\
	if (((_dmsgstring find "%1") isEqualto -1) && !(#arg1 isEqualto "")) then {\
		_arg1string = format ["%1",arg1];\
		_dmsgstring = [_dmsgstring, "%1", _arg1string] call CBA_fnc_replace;\
	};\
	if (((_dmsgstring find "%2") isEqualto -1) && !(#arg2 isEqualto "")) then {\
		_arg2string = format ["%1",arg2];\
		_dmsgstring = [_dmsgstring, "%2", _arg2string] call CBA_fnc_replace;\
	};\
	if (((_dmsgstring find "%3") isEqualto -1) && !(#arg3 isEqualto "")) then {\
		_arg3string = format ["%1",arg3];\
		_dmsgstring = [_dmsgstring, "%3", _arg3string] call CBA_fnc_replace;\
	};\
	if (((_dmsgstring find "%4") isEqualto -1) && !(#arg4 isEqualto "")) then {\
		_arg4string = format ["%1",arg4];\
		_dmsgstring = [_dmsgstring, "%4", _arg4string] call CBA_fnc_replace;\
	};\
	diag_log format ["basicmsg: %1 \n _dmsgstring: %2",basicmsg,_dmsgstring];\
	[basicmsg,_dmsgstring] call UO_FW_fnc_DebugMessageDetailed;\
}

#define UO_FW_GET_VAR(NAME,DEFAULT)\
missionNamespace getVariable [#NAME,DEFAULT]

#define UO_FW_ServerTimeVerify(VAR1)\
if (isMultiplayer) then {\
	if (abs (UO_FW_ServerStartTime - serverTime) > 100000) then {\
		_startTime = serverTime;\
		UO_FW_ServerStartTime = serverTime;\
		publicVariable "UO_FW_ServerStartTime";\
		UO_FW_DEBUG("","Detected desynchronized server and client clock, using client's time instead.");\
	};\
}
