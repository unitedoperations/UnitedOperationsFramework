params ["_unit","_target",["_rounds",1,[0]],["_fireMode","close",[""]]];
_unit doWatch _target;
/*waitUntil {
	sleep 0.2;
	if ((direction _unit) == ([_unit,_target] call BIS_fnc_relativeDirTo)) exitWith {
		  for [{_r=0},{_r < _rounds},{_r=_r+1}] do {
			_unit forceWeaponFire [ currentWeapon _unit, _fireMode];
		  };
  	};
	false
};
*/