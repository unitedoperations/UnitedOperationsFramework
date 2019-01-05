/*	Description: Set the building or buildings for the group to occupy.
 * 	Arguments:
 * 		NUMBER	- Occupy Option
 * 		NUMBER	- Count
 * 		ARRAY	- Radius to get buildings from.
 * 		ARRAY	- Occupy Option 
 * 	Return Value:
 * 		ARRAY 	- POSITION, BUILDING
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_occupyOption","_i",["_bld",[],[[]]],["_bldPos",[],[[]]],["_pos",[],[[]]],["_return",[],[[]]]];	
	switch (_occupyOption) do {
		case 2;
		case 3: {
			_pos = _bldPos select (_i % (count _bldPos));
			_uBld = _bld select 0;
		};
		case 4;
		case 5;
		case 6;
		case 7: {
			_uBld = _bld select (_i % (count _bld));
			_bldPos = _uBld buildingPos -1; 
			_pos = _bldPos select (_i % (count _bldPos));
		};
		default {
			_uBld = _bld select (_i % (count _bld));
			_bldPos = _uBld buildingPos -1; 
			_pos = _bldPos select (_i % (count _bldPos));
		};
	};
	_return = [_pos,_uBld];
	_return