/*	Description: Set a group to surrender when they take casualties.
 * 	Arguments:
 *		GROUP	- Group to Surrender
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params [["_grp",grpNull,[grpNull]]];  
	if(isNull _grp) exitWith {diag_log format["SURRENDER - GROUP NULL | %1",_grp];};
	_grp setVariable["aeGroupCount", (count (units _grp))];
	_grp setVariable["aeSurrenderCount", ((count (units _grp)) * 0.5)];
	{	
		_x addMPEventHandler ["mpkilled", {
			if ( count (units (group (_this select 0))) < ((group (_this select 0)) getVariable["aeSurrenderCount",999]) || !alive (leader (group (_this select 0))) ) then { 
				{ 
					_x action ['surrender',_x]; 
				} forEach (units (group (_this select 0)));
			};			
			(_this select 0) removeMPEventHandler ["mpkilled",_thisEventHandler]; 
		}];
	} forEach units _grp;
	true