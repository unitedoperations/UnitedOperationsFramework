/*	Description: Determines if machine is a HC/Server and sets appropriate global values
 *		for use in condition blocks
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		BOOL
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"

private _hc = false;
UO_FW_var_isHC = false;

if ((!isMultiplayer) || {(isMultiplayer) && (isServer) && (hasinterface)}) then {
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
	LOG("clientID: SERVER");
} else {
	LOG_1("clientID: %1",clientowner);
};
if (!isNil "UO_FW_var_HC_ID") then {
	LOG_1("UO_FW_var_HC_ID: %1",UO_FW_var_HC_ID);
};

_hc
