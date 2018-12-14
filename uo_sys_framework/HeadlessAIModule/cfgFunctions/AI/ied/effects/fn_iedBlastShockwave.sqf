params[
	["_loc",[],[[]]],
	["_smokeArray",[],[[]]],
	["_volume",[[0, 0, 0, 1],[.78, .76, .71, 1],[.55, .47, .37, 1],[.1, .1, .1, 1]],[[]]]
];
	private _aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];
	for[{_i = 0}, {_i < count _volume}, {_i = _i + 1}] do { 
		private _smoke = "#particlesource" createVehicleLocal _aslLoc;
		_smoke setPosASL _aslLoc;
		_smoke setParticleCircle [0, [0, 0, 0]];
		_smoke setParticleRandom [0, [8, 8, 2], [300, 300, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [_volume select _i, [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _aslLoc];
		_smoke setDropInterval .0004;
		_smokeArray pushBack _smoke;
	};

	sleep .125;
	
	{
		deletevehicle _x;
	} foreach _smokeArray;
	true