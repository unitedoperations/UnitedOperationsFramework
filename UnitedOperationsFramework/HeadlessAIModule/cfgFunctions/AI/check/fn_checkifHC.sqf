/*	Description: Determines if machine is a HC/Server and sets appropriate global values 
 *		for use in condition blocks
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		BOOL 	
 *	Author
 *		PiZZADOX
 */

_hc = false;

UO_FW_var_isHC = false;
UO_FW_var_isHCorServer = false;

if (isNil "UO_FW_var_HCs") then {
	UO_FW_var_HCs = []; 
	publicVariable "UO_FW_var_HCs";
};

if (!hasInterface && !isServer) then {
	_hc = true;
	UO_FW_var_isHC = true;
	HC_ID = clientowner;
	publicvariable "HC_ID"; 
	if !(player in UO_FW_var_HCs) then {
		UO_FW_var_HCs pushback (player);
		publicVariable "UO_FW_var_HCs";
	};
};

if (!hasInterface || isServer) then {
	UO_FW_var_isHCorServer = true;
};

if (!isMultiplayer) then {
	_hc = true;
	UO_FW_var_isHC = true;
	HC_ID = clientowner;
	publicvariable "HC_ID"; 
	if !(player in UO_FW_var_HCs) then {
		UO_FW_var_HCs pushback (player);
		publicVariable "UO_FW_var_HCs";
	};
};

_hc