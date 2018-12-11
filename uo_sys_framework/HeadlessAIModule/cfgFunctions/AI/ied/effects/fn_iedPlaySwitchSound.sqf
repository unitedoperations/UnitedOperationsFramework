	_distance = (getpos player) distance _this;
	if(_distance < 10) then {
		_volume = linearConversion [0,10,12-_distance, 0, 3, true];
		playSound3d["ASOR\asor_edit\data\sounds\aeIEDSwitch.wss", player, false, getPos player, _volume];
	};
	true