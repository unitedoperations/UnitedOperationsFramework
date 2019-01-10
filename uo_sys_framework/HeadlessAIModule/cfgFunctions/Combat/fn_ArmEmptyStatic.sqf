if (UO_FW_AI_STATICGARRISON isEqualTo 0) exitWith {};
private _Unit = _this;
private _Position = getPosATL _Unit;

private _weapon = nearestObject [_Position,"StaticWeapon"];
if (isNull _weapon || {(_weapon distance _Unit) > 100}) exitWith {};

private _AssignedGunner = assignedGunner _weapon;
if (isNull _AssignedGunner) then
{
  _Unit doMove (getposATL _weapon);
  _Unit assignAsGunner _weapon;
  [_Unit] orderGetIn true;
  _Waiting = 0;
  while {_Waiting isEqualTo 0} do
  {
  sleep 1;
    if ((_Unit distance _Weapon) < 3) then {_Waiting = 1};
  };
  _Unit moveInGunner _weapon;
};
