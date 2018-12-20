/*	Description: Updates radial around groups.
 *	Arguments:
 * 		NUMBER	- Radial Radius
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params["_value"];
	_leader = leader ((get3DENSelected 'Group') select 0); 
	set3DENAttributes [[[_leader],'size2',[_value,_value]]]; 
	true