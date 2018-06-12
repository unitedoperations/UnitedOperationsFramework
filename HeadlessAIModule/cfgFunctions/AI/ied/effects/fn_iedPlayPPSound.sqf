	_distance = (getpos player) distance _this;
	if(_distance < 10) then {
		_volume = linearConversion [0,10,12-_distance, 0, 1, true];
		playSound3d["ASOR\asor_edit\data\sounds\aePressurePlate.wss", player, false, getPos player, _volume];
	};
	true