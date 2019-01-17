/*	Description: Compares unit stance and group stance applies any stance that is not 'auto'.
 * 	Arguments:
 *		OBJECT 	- Unit
 * 		STRING	- Group Stance
 *	Optional:
 * 		STRING	- Unit Stance
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params [["_u",objNull,[objNull]],["_groupStance","auto",[""]],["_unitStance","auto",[""]]];
	if (_groupStance != _unitStance) then {
		if (_groupStance != 'auto') then {
			_u setUnitPos _groupStance;
		};
		if (_unitStance != _groupStance) then {
			_u setUnitPos _unitStance;
		};
	};
	true