class UO_FW_RespawnComboAttribute: Combo {
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLoad="\
				params ['_control','_config'];\
				_respawnTypeArray = ['1 Life','Unlimited','IndTickets','TeamTickets','Wave','Triggered'];\
				{\
					_x params ['_name','_colour'];\
					private _index = _control lbadd _name;\
					_control lbsetdata [_index,_name];\
				} foreach _respawnTypeArray; ";
			onLBSelChanged="";
		};
	};
};
