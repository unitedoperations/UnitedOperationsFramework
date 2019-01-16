params ["","","_id","_target"];

if (!((_target call UO_FW_fnc_Alive) && (!(_target call UO_FW_fnc_InVehicle) || ((vehicle _target) call UO_FW_fnc_HasEmptyPositions)))) then {

	_rank = -1;
	_count = 0;

	{
		if (_x call UO_FW_fnc_Alive) then {

			_count = _count + 1;

			if ((rankId _x > _rank) && (!(_x call UO_FW_fnc_InVehicle) || ((vehicle _x) call UO_FW_fnc_HasEmptyPositions))) then {

				_rank = rankId _x;
				_target = _x;

			};
		};

	} forEach ((units group player) - [player]);

	if (_rank == -1) then {

		_target = objNull;

		if (_count == 0) then {

			player removeAction _id;
			cutText ["No one left in the squad", 'PLAIN DOWN'];

		} else {

			cutText ["Not possible to JIP teleport to anyone, please try again later", 'PLAIN DOWN'];

		};
	};
};

if (!isNull(_target)) then {

	if (_target call UO_FW_fnc_InVehicle) then {

		player moveInAny (vehicle _target);
		player removeAction _id;

		(format ["%1 joined the mission and teleported into the vehicle.", name player]) remoteExec ["hint", _target];

	} else {

		_stance = stance _target;
		switch (_stance) do {
			default {};
			case "CROUCH": {
				player playActionNow "PlayerCrouch";
			};
			case "PRONE": {
				player playActionNow "PlayerProne";
			};
			case "STAND": {
				player playActionNow "PlayerStand";
			};
		};
		_pos = [getpos _target, 1, 10, 1, 0, 25, 0] call BIS_fnc_findSafePos;
		if (_pos distance _target <= 10) then {
			_enemy = false;
			if (UO_FW_JIP_EnemyDISTANCE > 0) then {
				_nearestentitiesArray = _target nearEntities [["Car", "Motorcycle", "Tank", "Man"], UO_FW_JIP_EnemyDISTANCE];
				{
					if ([side _x, side player] call BIS_fnc_sideIsEnemy) exitwith {_enemy = true;};
				} foreach _nearestentitiesArray;
			};
			if (!_enemy) then {
				player setPos (_pos);
				player removeAction _id;
				(format ["%1 joined the mission and teleported to you.", name player]) remoteExec ["hint", _target];
				[] spawn {
					_eventhandlerdamage = player addEventHandler ["HandleDamage",{
						params ["_unit","","_damage","_shooter"];
						if (side _shooter == side _unit) then { _damage = 0};
						_damage
					}];
					sleep 3;
					player removeEventHandler ["HandleDamage", _eventhandlerdamage]
				};
			} else {
				cutText ["Enemies too close to group leader, please try again later", 'PLAIN DOWN'];
			};
		} else {
			cutText ["Not possible to JIP teleport to group leader, please try again later", 'PLAIN DOWN'];
		};
	};

} else {

	cutText ["Something went wrong, target doesn't exist.", 'PLAIN DOWN'];

};
