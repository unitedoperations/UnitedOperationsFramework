if(!hasInterface) exitWith {};
params[
	["_loc",[],[[]]],
	["_size",0,[0]],
	["_fragments",150,[0]]	
];
	[_loc] spawn UO_AI_fnc_iedBlastShockwave;
	[_loc,_fragments] spawn UO_AI_fnc_iedBlastFragments;
	[_loc] spawn UO_AI_fnc_iedBlastRocks;
	switch (_size) do {
		case 0: {
			[_loc] spawn UO_AI_fnc_iedBlastSmall;
		};
		case 1: {
			[_loc] spawn UO_AI_fnc_iedBlastMedium;
		};
		case 2: {
			[_loc] spawn UO_AI_fnc_iedBlastLarge;
		};
		case 3;
		case 6: {
			[_loc] spawn UO_AI_fnc_iedBlastLarge;
		};
		default {};
	};
	[_loc,_size] spawn UO_AI_fnc_iedBlastAudioVisual;
	true