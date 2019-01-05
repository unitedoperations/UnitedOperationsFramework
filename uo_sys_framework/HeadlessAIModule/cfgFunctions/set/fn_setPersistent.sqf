/*	Description: Set object/unit/group to be persistent. (for use with cleanup scripts)
 * 	Arguments:
 *		BOOL	- Persistent
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_obj",["_persistent",false,[false]]];
	_obj setVariable["persistent",_persistent,true];
	true