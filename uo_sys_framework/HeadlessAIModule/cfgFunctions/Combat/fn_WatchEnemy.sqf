//unit 1, unit 2
params ["_unit","_target"];

_return = true;
_targetpos = getposASL _target;

_assignedtarget = assignedtarget _unit;
_unit reveal [_assignedtarget,0];
_unit dowatch objnull;
_unit reveal [_target,4];
_unit lookat _targetpos;
_unit glanceat _targetpos;
_targetdir = _unit getdir _targetpos;
_unit setformdir _targetdir;
_unit setdir _targetdir;
_unit dowatch _targetpos;

_return