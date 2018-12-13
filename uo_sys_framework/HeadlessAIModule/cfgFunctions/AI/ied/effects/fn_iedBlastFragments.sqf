params[
	["_loc",[],[[]]],
	["_fragments",150,[0]]
];
	for[{_i = 0}, {_i < _fragments - 1}, {_i = _i + 1}] do { 
		_loc set[2,.1 + random 2]; 
		_bullet = "B_408_Ball" createVehicle _loc;
		_angle = random 360;
		_speed = 450 + random 100;
		_bullet setVelocity [_speed*cos(_angle), _speed*sin(_angle), -1*(random 4)];
	};
	true