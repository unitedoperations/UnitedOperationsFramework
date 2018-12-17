params ["_GroupUnits","_Group"];

{
	[_x] joinSilent _group;
	_x setVariable ["UO_FW_AI_LOITERING",false];
	if (_x isEqualTo (leader _x)) then
	{
		_x setVariable ["UO_FW_AI_FLANKING",false,false];
	};
	_x setVariable ["UO_FW_AI_MovedRecently",false,false];	
} foreach _GroupUnits;

_Group setVariable ["UO_FW_AI_Mission","DEFEND"];