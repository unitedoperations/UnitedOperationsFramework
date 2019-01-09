class UO_FW_AOModeAttribute: Combo {
	attributeSave = "\
	(_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100)\
	";
	attributeLoad ="\
		private _logic = ((get3denselected 'logic') select 0);\
		_logic setvariable ['AOType_value',_AOType];\
		[_this,_config,_value,_logic] spawn {\
			disableserialization;\
			params ['_ctrl','_config','_value','_logic'];\
			private _ctrlCombo = (_ctrl controlsGroupCtrl 100);\
			private _n = 0;\
			private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
			_AOSystemTypes = [['Hard','HARD'],['Soft','SOFT']];\
			{\
				_x params ['_name','_string'];\
				private _index = _ctrlCombo lbadd _name;\
				_ctrlCombo lbsetdata [_index,_string];\
				_ctrlCombo lbsetValue [_index,_forEachIndex];\
				if (_value isEqualto (_ctrlCombo lbData _index)) then {\
					_ctrlCombo lbSetCurSel _index;\
				};\
			} foreach _AOSystemTypes;\
			_logicType = typeOf _logic;\
			private _cfgAttributes = [configFile >> 'CfgVehicles' >> _logicType >> 'Attributes',0] call BIS_fnc_returnChildren;\
			{\
				 if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
					private _cfg = _cfgAttributes select _n;\
					_n = _n + 1;\
					private _state = true;\
					if (isArray(_cfg >> 'AOTypes')) then {\
		 				 	_AOTypes = getarray (_cfg >> 'AOTypes');\
							if (_AOType in _AOTypes) then {\
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
		};\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLBSelChanged="\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
			  _GearSystem = _ctrlCombo lbData _cursel;\
				private _logic = ((get3denselected 'logic') select 0);\
			  [_ctrlCombo,_cursel,_GearSystem,_logic] spawn {\
				 	 disableserialization;\
					 _this params ['_ctrlCombo','_cursel','_GearSystem','_logic'];\
					 _logic setvariable ['AOType_value',_AOType];\
					 private _n = 0;\
				 	 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				 	 _logicType = typeOf _logic;\
					 private _cfgAttributes = [configFile >> 'CfgVehicles' >> _logicType >> 'Attributes',0] call BIS_fnc_returnChildren;\
					 {\
				 		if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				 			private _cfg = _cfgAttributes select _n;\
				 			_n = _n + 1;\
							private _state = true;\
				 			if (isArray(_cfg >> 'AOTypes')) then {\
				 				 	_AOTypes = getarray (_cfg >> 'AOTypes');\
									if (_AOType in _AOTypes) then {\
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
		 		};\
			";
		};
	};
};
