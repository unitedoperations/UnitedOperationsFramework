//If units are spawned, this should be run on them: ["aCount_event_addEH", UNIT] call CBA_fnc_serverEvent;
_obj = param [0];

_obj setVariable ["aCount_originalSide",side _obj,false];

if (_obj isKindOf "Man") then
{
	_obj addEventHandler ["fired", {[side ( _this select 0),(_this select 5) call aCount_getDisplayName] call UO_FNC_ShotCountShotCount;}];
	_obj setVariable ["aCount_firedEh", true, false];
};

if (((_obj isKindOf "Land") && !(_obj isKindOf "Man")) || (_obj isKindOf "Air") || (_obj isKindOf "Ship")) then
{
	if (count crew _obj > 0) then
		{
		{
			_x setVariable ["aCount_firedEh", true, false];
			_x setVariable ["aCount_originalSide",side _obj,false];
		} forEach crew _obj;
	};

	_obj addEventHandler ["fired", {[side ( _this select 0),(_this select 5) call aCount_getDisplayName] call UO_FNC_ShotCountShotCount;}];
	_obj setVariable ["aCount_firedEh", true, false];
};
