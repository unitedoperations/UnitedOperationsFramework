class UO_FW_RespawnComboAttribute: Combo {
	attributeSave = "(_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100)";
	attributeLoad ="\
		[_this,_value] spawn {\
		disableserialization;\
		params ['_config','_value'];\
		private _ctrlCombo = (_config controlsGroupCtrl 100);\
		private _n = 0;\
		private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
		_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
		{\
			_x params ['_name','_string'];\
			private _index = _ctrlCombo lbadd _name;\
			_ctrlCombo lbsetdata [_index,_string];\
			_ctrlCombo lbsetValue [_index,_forEachIndex];\
			if (_value isEqualto (_ctrlCombo lbData _index)) then {\
				_ctrlCombo lbSetCurSel _index;\
			};\
		} foreach _respawnTypeArray;\
		private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Gear' >> 'Attributes',0] call BIS_fnc_returnChildren;\
		{\
			 if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				private _cfg = _cfgAttributes select _n;\
				_n = _n + 1;\
				private _state = true;\
				if (isArray(_cfg >> 'GearSystems')) then {\
					private _GearSystems = getarray (_cfg >> 'GearSystems');\
					if !(_value in _GearSystems) then {\
						_state = _state && false;\
					};\
				};\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrlCombo;\
			};\
		} foreach (allcontrols (ctrlparent _ctrlCombo));\
	 };";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLBSelChanged="\
			_ctrlCombo = _this select 0;\
		  _cursel = _this select 1;\
		  _respawnSystem = _ctrlCombo lbData _cursel;\
		  [_ctrlCombo,_cursel,_respawnSystem] spawn {\
			 	 disableserialization;\
				 _this params ['_ctrlCombo','_cursel','_respawnSystem'];\
				 private _n = 0;\
			 	 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
			 	 private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Mission' >> 'AttributeCategories' >> 'UO_FW_Respawn_Settings' >> 'Attributes',0] call BIS_fnc_returnChildren;\
				 {\
			 		 if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
			 			private _cfg = _cfgAttributes select _n;\
			 			_n = _n + 1;\
						private _state = true;\
			 			if (isArray(_cfg >> 'respawnSystems')) then {\
							private _respawnSystems = getarray (_cfg >> 'respawnSystems');\
							if !(_respawnSystem in _respawnSystems) then {\
								_state = _state && false;\
							};\
			 			};\
						_fade = [0.75,0] select _state;\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
						ctrlsetfocus _x;\
						ctrlsetfocus _ctrlCombo;\
			 		};\
			 	} foreach (allcontrols (ctrlparent _ctrlCombo));\
		 };";
	 };
	};
};
