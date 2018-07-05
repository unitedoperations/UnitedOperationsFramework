params[
	["_loc",[],[[]]],
	["_smokeArray",[],[[]]],
	["_volume",[[0, 0, 0, 1],[.78, .76, .71, 1],[.55, .47, .37, 1],[.1, .1, .1, 1]],[[]]]
];
	_aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];
	for[{_i = 0}, {_i < count _volume}, {_i = _i + 1}] do { 
		_smoke = "#particlesource" createVehicleLocal _aslLoc;
		_smoke setPosASL _aslLoc;
		_smoke setParticleCircle [0, [0, 0, 0]];
		_smoke setParticleRandom [0, [1.5 + random 3, 1.5 + random 3, 8], [4+random 5, 4+random 5, 15], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [_volume select _i, [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke setDropInterval .005;
		_smokeArray pushBack _smoke;
	};
	
	sleep 1;
	
	for[{_j = 0}, {_j < count _smokeArray}, {_j = _j + 1}] do { 
		private _smoke = _smokeArray select _j;
		_smoke setParticleRandom [0, [3 + random 4, 3 + random 4, 5], [4+random 5, 4+random 5, 10], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 9, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke setDropInterval .03;
	};
	
	sleep 1;
	
	for[{_k = 0}, {_k < count _smokeArray}, {_k = _k + 1}] do { 
		private _smoke = _smokeArray select _k;
		_smoke setParticleRandom [0, [5 + random 5, 5 + random 5, 5], [7+random 5, 7+random 5, 3], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke setDropInterval .02;
	};
	
	sleep 1;
	
	for[{_l = 0}, {_l < count _smokeArray}, {_l = _l + 1}] do { 
		private _smoke = _smokeArray select _l;
		_smoke setParticleRandom [0, [5 + random 5, 5 + random 5, 5], [3.5, 3.5, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 25, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke setDropInterval .02;
	};
	
	sleep 1;
	
	for[{_l = 0}, {_l < count _smokeArray}, {_l = _l + 1}] do { 
		private _smoke = _smokeArray select _l;
		_smoke setParticleRandom [0, [5 + random 5, 5 + random 5, 5], [2, 2, 1], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 25, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke setDropInterval .02;
	};	
	
	sleep 1;
	
	{
		deletevehicle _x;
	} foreach _smokeArray;
	true