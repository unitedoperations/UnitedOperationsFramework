

#define ANY sideLogic

// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [1,true,[true]];
if(!(_activated)) exitWith{};
if (!isDedicated) then
{
	["AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Olsen"] call UO_FW_FNC_RegisterModule;
	_markers = [];
	_west = _logic getVariable ["BluforMarkerAttribute",[]];
	_east = _logic getVariable ["OpforMarkerAttribute",[]];
	_ind = _logic getVariable ["IndependentMarkerAttribute",[]];
	_civ = _logic getVariable ["CivilianMarkerAttribute",[]];
	{
		_markers pushBack [west, _x];
	}forEach _west;
	{
		_markers pushBack [east, _x];
	}forEach _east;
	{
		_markers pushBack [independent, _x];
	}forEach _ind;
	{
		_markers pushBack [civilian, _x];
	}forEach _civ;


	_markers call UO_FW_FNC_ExecuteAOLimits;

};
