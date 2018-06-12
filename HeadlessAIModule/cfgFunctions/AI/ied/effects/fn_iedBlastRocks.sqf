params[
	["_loc",[],[[]]],
	["_rockArray",[],[[]]],
	["_rockSize",0.45,[0]]
];
	private _aslLoc = [_loc select 0, _loc select 1, getTerrainHeightASL [_loc select 0, _loc select 1]];	
	for[{_i = 0}, {_i < 4}, {_i = _i + 1}] do { 
		private _rocks = "#particlesource" createVehicleLocal _aslLoc;
		_rocks setPosASL _aslLoc;
		_rocks setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 15], 5, 100, 7.9, 1, [_rockSize, _rockSize], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _aslLoc,0,false,0.3];
		_rocks setParticleRandom [0, [1, 1, 0], [20, 20, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
		_rocks setDropInterval 0.01;
		_rocks setParticleCircle [0, [0, 0, 0]];
		_rockArray pushBack _rocks;		
		_rockSize = _rockSize - 5;
	};

	sleep .125;
	
	{
		deletevehicle _x;
	} foreach _rockArray;
	true