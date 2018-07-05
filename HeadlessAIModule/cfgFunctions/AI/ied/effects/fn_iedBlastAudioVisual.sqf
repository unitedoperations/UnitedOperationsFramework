params[
	["_loc",[],[[]]],
	["_size",0,[0]],
	["_audioRange",50,[0]],
	["_visualRange",25,[0]],
	["_visualEffect",6,[0]]	
];
	sleep 0.25;
	if(alive player) then {
		_distance = (getpos player) distance _loc;
		
		switch(_size) do {
			case 0: { /*Small - No Change*/	};
			case 1: { //Medium 
				_audioRange = 70;
				_visualRange = 30;
				_visualEffect = 7;
			};
			case 2: { //Large 
				_audioRange = 80;
				_visualRange = 40;
				_visualEffect = 8;
			};
			case 3;
			case 6: { //Huge
				_audioRange = 90;
				_visualRange = 50;
				_visualEffect = 10;
			};
			default {/*Decoy & Practice - Nothing*/};
		};
		if(_distance < _audioRange) then {
			_volume = linearConversion [0,60,75-_distance, 0.1, 1, true];
			playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", player, false, getPos player, _volume];
		};
		if(_distance < _visualRange) then {
			[_visualEffect] spawn {	
				params[
					["_visualEffect",3,[0]],
					["_blur",[],[[]]]
				];
				_blur = ppEffectCreate ["DynamicBlur", 474];
				_blur ppEffectEnable true;
				_blur ppEffectAdjust [0];
				_blur ppEffectCommit 0;
				
				waitUntil {ppEffectCommitted _blur};
				
				_blur ppEffectAdjust [_visualEffect];
				_blur ppEffectCommit 0;				
				_blur ppEffectAdjust [0];
				_blur ppEffectCommit (_visualEffect * 0.5);
				
				waitUntil {ppEffectCommitted _blur};
				
				_blur ppEffectEnable false;
				ppEffectDestroy _blur;
			};
			[] spawn UO_AI_fnc_iedBlastKnockdown;
		};
	};
	true