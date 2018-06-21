/*	Description: Checks for duplicate config type entries in all3DENentities and deletes placed entity if duplicate found
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */
 
params ["_logic"];

diag_log format ["_logic:%1 class:%2",_logic,typeof _logic];
{
	diag_log format ["_object:%1 class:%2",_x,typeof _x];
	if (!(_logic isEqualto _x)) then {
		if ((typeof _x) isEqualto (typeof _logic)) exitwith {
			diag_log format ["MATCH DUPLICATE! _object class:%1 _logic class:%2",typeof _x,typeof _logic];
			_printname = getText (configFile >> "cfgVehicles" >> typeof _logic >> "displayName");
			["You can only have one %1 module. Duplicate module deleted.",_printname] call BIS_fnc_error;
			delete3DENEntities [_logic];
		};
	};
} foreach (all3DENentities select 3);