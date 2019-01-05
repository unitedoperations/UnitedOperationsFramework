/*	Description: Determines if machine is a HC/Server and sets appropriate global values
 *		for use in condition blocks
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		BOOL
 *	Author
 *		PiZZADOX
 */

private _hc = false;

UO_FW_var_isHC = false;

if (!isMultiplayer) then {
	_hc = true;
	UO_FW_var_isHC = true;
	UO_FW_var_HC_ID = clientowner;
	publicvariable "UO_FW_var_HC_ID";
};

if (!hasInterface && !isDedicated) then {
	_hc = true;
	UO_FW_var_isHC = true;
	UO_FW_var_HC_ID = clientowner;
	publicvariable "UO_FW_var_HC_ID";
};

if (isServer) then {
	diag_log "clientID: SERVER";
} else {
	diag_log format ["clientID: %1",clientowner];
};
if (!isNil "UO_FW_var_HC_ID") then {
	diag_log format ["UO_FW_var_HC_ID: %1",UO_FW_var_HC_ID];
};

_hc
