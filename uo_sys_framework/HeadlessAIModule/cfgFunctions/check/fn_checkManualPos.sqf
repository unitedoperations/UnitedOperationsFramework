/*	Validates a Manual Position.
 * 	Arguments:
 *   	ARRAY	- Position
 * 	Return Value:
 *   	BOOL 	- Valid Position or NOT.
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);


params [["_pos",[],[[]]],["_return",false,[false]]];
if ( ((typename _pos) == "ARRAY") && { ((count _pos) == 3) && { ((typename (_pos select 0)) == "SCALAR") && ((typename (_pos select 1)) == "SCALAR") && ((typename (_pos select 2)) == "SCALAR")} } ) then {
	_return = true;
};
_return
