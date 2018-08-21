// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [1,true,[true]];
if(!(_activated)) exitWith{};
if (!isDedicated) then
{
	_markerName = _logic getVariable ["UO_FW_Capturezone_Markername",""];
	_bluforWin = _logic getVariable ["UO_FW_Capturezone_BluforWin",0];
	_opforWin = _logic getVariable ["UO_FW_Capturezone_OpforWin",0];
	_independentWin = _logic getVariable ["UO_FW_Capturezone_IndependentWin",0];
	_civilianWin = _logic getVariable ["UO_FW_Capturezone_OpforWin",0];
	_messages = [];
	_messages pushBack (_logic getVariable ["UO_FW_Capturezone_BluforMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_Capturezone_OpforMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_Capturezone_IndependentMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_Capturezone_CivilianMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_Capturezone_ContestedMessage",""]);
	_messages pushBack (_logic getVariable ["UO_FW_Capturezone_UncontestedMessage",""]);
	_variable = _logic getVariable ["UO_FW_Capturezone_VariableName",""];
	_sides = [];
	if(_bluforWin > 0) then 
	{
		_sides pushBack [west,_bluforWin];
	};
	if(_opforWin > 0) then 
	{
		_sides pushBack [east,_opforWin];
	};
	if(_independentWin > 0) then 
	{
		_sides pushBack [independent,_independentWin];
	};
	if(_civilianWin > 0) then 
	{
		_sides pushBack [civilian,_civilianWin];
	};
	_colors = ["ColorBlue","ColorRed","ColorGreen","ColorYellow","ColorWhite","ColorKhaki"];
	_intervall = _logic getVariable ["UO_FW_Capturezone_SleepIntervall",15];
	[_markerName,_sides,_colors,_intervall,_messages,_variable] call UO_FW_FNC_ExecuteCapturezone;
};
