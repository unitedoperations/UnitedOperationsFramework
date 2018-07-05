

#define ANY sideLogic

// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [1,true,[true]];
if(!(_activated)) exitWith{};
if (!isDedicated) then
{
	
	_side = _logic getVariable ["UO_FW_StartInParachute_SideSelect",4];
	_sides = [west,east,independent,civilian,sideLogic];
	_altitude = _logic getVariable ["UO_FW_StartInParachute_Altitude",300];
	_altitudeRandom = _logic getVariable ["UO_FW_StartInParachute_AltitudeRandom",100];
	_steer = _logic getVariable ["UO_FW_StartInParachute_Steerable",false];
	_location = [_logic, _logic getVariable ["UO_FW_StartInParachute_SizeX",100],logic getVariable ["UO_FW_StartInParachute_SizeY",100],getDir _logic,false];
	[_location,(_sides select _side),_altitude,_altitudeRandom,_steer] call UO_FW_ExecuteStartInParachute;

};
