class UO_FW_RespawnComboAttribute: Combo {
	attributeSave = "\
		_value = (_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100);\
		_value\
		";
	attributeLoad ="\
		[_this,_config,_value] spawn {\
		disableserialization;\
		params ['_ctrl','_config','_value'];\
		private _ctrlCombo = (_ctrl controlsGroupCtrl 100);\
		_ctrlCombo setvariable ['UO_FW_parentcontrolcfg',_config];\
		diag_log format ['attrload1 _config:%1',_config];\
		private _configH = configHierarchy _config;\
		diag_log format ['attrload1 _configH:%1',_configH];\
		private _configHParent = _configH select ((count _configH) - 2);\
		diag_log format ['attrload1 _configHParent:%1',_configHParent];\
		private _cfgAttributes = [_configHParent,1] call BIS_fnc_returnChildren;\
		diag_log format ['attrload1 _cfgAttributes:%1',_cfgAttributes];\
		private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
		private _respawnSystem = _value;\
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
		private _n = 0;\
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
				 private _config = _ctrlCombo getvariable ['UO_FW_parentcontrolcfg',''];\
				 diag_log format ['selchanged _config:%1',_config];\
				 private _configH = configHierarchy _config;\
				 diag_log format ['selchanged _configH:%1',_configH];\
				 private _configHParent = _configH select ((count _configH) - 2);\
				 diag_log format ['selchanged _configHParent:%1',_configHParent];\
				 private _cfgAttributes = [_configHParent,1] call BIS_fnc_returnChildren;\
				 diag_log format ['selchanged _cfgAttributes:%1',_cfgAttributes];\
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
