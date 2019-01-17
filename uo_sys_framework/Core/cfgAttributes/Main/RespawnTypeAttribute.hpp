class UO_FW_Respawn_Combo_Blufor: Combo {
	attributeLoad = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Blufor',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Blufor',_config];\
		private _respawnSystemTypeArray = [['None',0],['Unlimited',1],['Individual Tickets',2],['Team Tickets',3],['Wave',4],['Triggered',5]];\
		{\
			_x params ['_name','_number'];\
			private _index = _ctrlCombo lbadd _name;\
			_ctrlCombo lbsetdata [_index,_name];\
			_ctrlCombo lbsetValue [_index,_number];\
			if (_value isEqualto (_ctrlCombo lbValue _index)) then {\
				_ctrlCombo lbSetCurSel _index;\
			};\
		} foreach _respawnSystemTypeArray;\
	";
	attributeSave = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Blufor',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Blufor',_config];\
		_value\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLoad = "\
			params ['_ctrlCombo'];\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Blufor','']) isEqualto '')},{\
				params ['_ctrlCombo'];\
				private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Blufor',''];\
				private _configH = configHierarchy _configstr;\
				private _configHParent = _configH select ((count _configH) - 2);\
				private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
				private _respawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Blufor',0];\
				private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				_n = 0;\
				{\
					if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
						_cfg = _cfgAttributes select _n;\
						_respawnTypes = getarray (_cfg >> 'respawnTypes');\
						_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
						_fade = [0.75,0] select _state;\
						_n = _n + 1;\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
						ctrlsetfocus _x;\
						ctrlsetfocus _ctrlCombo;\
					};\
				} foreach (allcontrols (ctrlparent _ctrlCombo));\
			}, [_ctrlCombo]] call CBA_fnc_waitUntilAndExecute;\
			";
			onLBSelChanged = "\
				params ['_ctrlCombo','_cursel'];\
				[_ctrlCombo,_cursel] spawn {\
					params ['_ctrlCombo','_cursel'];\
					_respawnType = _ctrlCombo lbValue _cursel;\
					private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Blufor',''];\
					private _configH = configHierarchy _configstr;\
					private _configHParent = _configH select ((count _configH) - 2);\
					private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
					missionNamespace setvariable ['UO_FW_Respawn_Value_Blufor',_respawnType];\
					private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
					_n = 0;\
					{\
						if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
							_cfg = _cfgAttributes select _n;\
							_respawnTypes = getarray (_cfg >> 'respawnTypes');\
							_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
							_fade = [0.75,0] select _state;\
							_n = _n + 1;\
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

class UO_FW_RespawnTemplates_Blufor: Title {
	attributeLoad = "\
		private _selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Blufor',0];\
		private _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
		private _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
		private _defaultTemplates = [\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesNone'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesUnlimited'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesIndTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTeamTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesWave'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTriggered')\
		];\
		private _isDefault = _value isequalto [''];\
		{\
			private _cfgTemplate = _x;\
			private _scope = if (isnumber (_cfgTemplate >> 'scope')) then {getnumber (_cfgTemplate >> 'scope')} else {2};\
			private _respawnTypes = getarray (_cfgTemplate >> 'respawnTypes');\
			{\
				private _respawnType = _x;\
				private _ctrlListbox = _this controlsGroupCtrl (100 + _respawnType);\
				private _selected = if ((_respawnType == _selectedRespawnType) && {!_isDefault}) then {\
					_value\
				} else {\
					_defaultTemplates select _respawnType\
				};\
				if ((_scope > 1) && {(count _respawnTypes == 0) || _respawnType in _respawnTypes}) then {\
					private _data = configname _cfgTemplate;\
					private _name = gettext (_cfgTemplate >> 'displayName');\
					if (_name == '') then {_name = _data};\
					private _lbAdd = _ctrlListbox lbadd _name;\
					_ctrlListbox lbsetdata [_lbAdd,_data];\
					private _active = _data in _selected;\
					_ctrlListbox lbsetvalue [_lbAdd,[0,1] select _active];\
					_ctrlListbox lbsetpicture [_lbAdd,[_pictureUnchecked,_pictureChecked] select _active];\
				};\
			} foreach [0,1,2,3,4,5];\
		} foreach configproperties [configfile >> 'UO_FW_RespawnTemplates','isclass _x'];\
		{\
			private _ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
			lbsort _ctrlListbox;\
		} foreach [0,1,2,3,4,5];\
	";
	attributeSave = "\
		_value = [];\
		{\
			_ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			if (ctrlshown _ctrlListbox) exitwith {\
				for '_i' from 0 to (lbsize _ctrlListbox - 1) do {\
					if (_ctrlListbox lbvalue _i > 0) then {_value pushback (_ctrlListbox lbdata _i);};\
				};\
			};\
		} foreach [0,1,2,3,4,5];\
		_value\
	";
	h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
	class Controls: Controls {
		class Title: Title {
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
		};
		class Value0: ctrlListbox {
			idc=100;
			show=0;
			x="48 * (pixelW * pixelGrid * 	0.50)";
			w="82 * (pixelW * pixelGrid * 	0.50)";
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
			colorSelectBackground[]={0,0,0,0};
			colorSelectBackground2[]={0,0,0,0};
			onLBSelChanged = "\
				_ctrlListbox = _this select 0;\
				_cursel = _this select 1;\
				_active = _ctrlListbox lbvalue _cursel;\
				_active = (_active + 1) % 2;\
				_pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
				_pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
				_ctrlListbox lbsetvalue [_cursel,_active];\
				_ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
			";
			onSetFocus = "\
			_ctrl = _this select 0;\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Value_Blufor','']) isEqualto '')},{\
				params ['_ctrl'];\
				_ctrlGroup = ctrlparentcontrolsgroup _ctrl;\
				_selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Blufor',0];\
				{\
					_ctrlListbox = _ctrlGroup controlsGroupCtrl (100 + _x);\
					_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
				} foreach [0,1,2,3,4,5];\
			}, [_ctrl]] call CBA_fnc_waitUntilAndExecute;\
			";
		};
		class Value1: Value0 {
			idc=101;
		};
		class Value2: Value0 {
			idc=102;
		};
		class Value3: Value0 {
			idc=103;
		};
		class Value4: Value0 {
			idc=104;
		};
		class Value5: Value0 {
			idc=105;
		};
		class Value6: Value0 {
			idc=106;
		};
		class Value7: Value0 {
			idc=107;
		};
	};
};

class UO_FW_Respawn_Combo_Opfor: Combo {
	attributeLoad = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Opfor',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Opfor',_config];\
		private _respawnSystemTypeArray = [['None',0],['Unlimited',1],['Individual Tickets',2],['Team Tickets',3],['Wave',4],['Triggered',5]];\
		{\
			_x params ['_name','_number'];\
			private _index = _ctrlCombo lbadd _name;\
			_ctrlCombo lbsetdata [_index,_name];\
			_ctrlCombo lbsetValue [_index,_number];\
			if (_value isEqualto (_ctrlCombo lbValue _index)) then {\
				_ctrlCombo lbSetCurSel _index;\
			};\
		} foreach _respawnSystemTypeArray;\
	";
	attributeSave = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Opfor',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Opfor',_config];\
		_value\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLoad = "\
			params ['_ctrlCombo'];\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Opfor','']) isEqualto '')},{\
				params ['_ctrlCombo'];\
				private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Opfor',''];\
				private _configH = configHierarchy _configstr;\
				private _configHParent = _configH select ((count _configH) - 2);\
				private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
				private _respawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Opfor',0];\
				private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				_n = 0;\
				{\
					if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
						_cfg = _cfgAttributes select _n;\
						_respawnTypes = getarray (_cfg >> 'respawnTypes');\
						_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
						_fade = [0.75,0] select _state;\
						_n = _n + 1;\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
						ctrlsetfocus _x;\
						ctrlsetfocus _ctrlCombo;\
					};\
				} foreach (allcontrols (ctrlparent _ctrlCombo));\
			}, [_ctrlCombo]] call CBA_fnc_waitUntilAndExecute;\
			";
			onLBSelChanged = "\
				params ['_ctrlCombo','_cursel'];\
				[_ctrlCombo,_cursel] spawn {\
					params ['_ctrlCombo','_cursel'];\
					_respawnType = _ctrlCombo lbValue _cursel;\
					private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Opfor',''];\
					private _configH = configHierarchy _configstr;\
					private _configHParent = _configH select ((count _configH) - 2);\
					private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
					missionNamespace setvariable ['UO_FW_Respawn_Value_Opfor',_respawnType];\
					private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
					_n = 0;\
					{\
						if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
							_cfg = _cfgAttributes select _n;\
							_respawnTypes = getarray (_cfg >> 'respawnTypes');\
							_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
							_fade = [0.75,0] select _state;\
							_n = _n + 1;\
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

class UO_FW_RespawnTemplates_Opfor: Title {
	attributeLoad = "\
		private _selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Opfor',0];\
		private _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
		private _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
		private _defaultTemplates = [\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesNone'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesUnlimited'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesIndTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTeamTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesWave'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTriggered')\
		];\
		private _isDefault = _value isequalto [''];\
		{\
			private _cfgTemplate = _x;\
			private _scope = if (isnumber (_cfgTemplate >> 'scope')) then {getnumber (_cfgTemplate >> 'scope')} else {2};\
			private _respawnTypes = getarray (_cfgTemplate >> 'respawnTypes');\
			{\
				private _respawnType = _x;\
				private _ctrlListbox = _this controlsGroupCtrl (100 + _respawnType);\
				private _selected = if ((_respawnType == _selectedRespawnType) && {!_isDefault}) then {\
					_value\
				} else {\
					_defaultTemplates select _respawnType\
				};\
				if ((_scope > 1) && {(count _respawnTypes == 0) || _respawnType in _respawnTypes}) then {\
					private _data = configname _cfgTemplate;\
					private _name = gettext (_cfgTemplate >> 'displayName');\
					if (_name == '') then {_name = _data};\
					private _lbAdd = _ctrlListbox lbadd _name;\
					_ctrlListbox lbsetdata [_lbAdd,_data];\
					private _active = _data in _selected;\
					_ctrlListbox lbsetvalue [_lbAdd,[0,1] select _active];\
					_ctrlListbox lbsetpicture [_lbAdd,[_pictureUnchecked,_pictureChecked] select _active];\
				};\
			} foreach [0,1,2,3,4,5];\
		} foreach configproperties [configfile >> 'UO_FW_RespawnTemplates','isclass _x'];\
		{\
			private _ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
			lbsort _ctrlListbox;\
		} foreach [0,1,2,3,4,5];\
	";
	attributeSave = "\
		_value = [];\
		{\
			_ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			if (ctrlshown _ctrlListbox) exitwith {\
				for '_i' from 0 to (lbsize _ctrlListbox - 1) do {\
					if (_ctrlListbox lbvalue _i > 0) then {_value pushback (_ctrlListbox lbdata _i);};\
				};\
			};\
		} foreach [0,1,2,3,4,5];\
		_value\
	";
	h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
	class Controls: Controls {
		class Title: Title {
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
		};
		class Value0: ctrlListbox {
			idc=100;
			show=0;
			x="48 * (pixelW * pixelGrid * 	0.50)";
			w="82 * (pixelW * pixelGrid * 	0.50)";
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
			colorSelectBackground[]={0,0,0,0};
			colorSelectBackground2[]={0,0,0,0};
			onLBSelChanged = "\
				_ctrlListbox = _this select 0;\
				_cursel = _this select 1;\
				_active = _ctrlListbox lbvalue _cursel;\
				_active = (_active + 1) % 2;\
				_pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
				_pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
				_ctrlListbox lbsetvalue [_cursel,_active];\
				_ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
			";
			onSetFocus=  "\
			_ctrl = _this select 0;\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Value_Opfor','']) isEqualto '')},{\
				params ['_ctrl'];\
				_ctrlGroup = ctrlparentcontrolsgroup _ctrl;\
				_selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Opfor',0];\
				{\
					_ctrlListbox = _ctrlGroup controlsGroupCtrl (100 + _x);\
					_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
				} foreach [0,1,2,3,4,5];\
			}, [_ctrl]] call CBA_fnc_waitUntilAndExecute;\
			";
		};
		class Value1: Value0 {
			idc=101;
		};
		class Value2: Value0 {
			idc=102;
		};
		class Value3: Value0 {
			idc=103;
		};
		class Value4: Value0 {
			idc=104;
		};
		class Value5: Value0 {
			idc=105;
		};
		class Value6: Value0 {
			idc=106;
		};
		class Value7: Value0 {
			idc=107;
		};
	};
};

class UO_FW_Respawn_Combo_Indfor: Combo {
	attributeLoad = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Indfor',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Indfor',_config];\
		private _respawnSystemTypeArray = [['None',0],['Unlimited',1],['Individual Tickets',2],['Team Tickets',3],['Wave',4],['Triggered',5]];\
		{\
			_x params ['_name','_number'];\
			private _index = _ctrlCombo lbadd _name;\
			_ctrlCombo lbsetdata [_index,_name];\
			_ctrlCombo lbsetValue [_index,_number];\
			if (_value isEqualto (_ctrlCombo lbValue _index)) then {\
				_ctrlCombo lbSetCurSel _index;\
			};\
		} foreach _respawnSystemTypeArray;\
	";
	attributeSave = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Indfor',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Indfor',_config];\
		_value\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLoad = "\
			params ['_ctrlCombo'];\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Indfor','']) isEqualto '')},{\
				params ['_ctrlCombo'];\
				private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Indfor',''];\
				private _configH = configHierarchy _configstr;\
				private _configHParent = _configH select ((count _configH) - 2);\
				private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
				private _respawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Indfor',0];\
				private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				_n = 0;\
				{\
					if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
						_cfg = _cfgAttributes select _n;\
						_respawnTypes = getarray (_cfg >> 'respawnTypes');\
						_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
						_fade = [0.75,0] select _state;\
						_n = _n + 1;\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
						ctrlsetfocus _x;\
						ctrlsetfocus _ctrlCombo;\
					};\
				} foreach (allcontrols (ctrlparent _ctrlCombo));\
			}, [_ctrlCombo]] call CBA_fnc_waitUntilAndExecute;\
			";
			onLBSelChanged = "\
				params ['_ctrlCombo','_cursel'];\
				[_ctrlCombo,_cursel] spawn {\
					params ['_ctrlCombo','_cursel'];\
					_respawnType = _ctrlCombo lbValue _cursel;\
					private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Indfor',''];\
					private _configH = configHierarchy _configstr;\
					private _configHParent = _configH select ((count _configH) - 2);\
					private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
					missionNamespace setvariable ['UO_FW_Respawn_Value_Indfor',_respawnType];\
					private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
					_n = 0;\
					{\
						if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
							_cfg = _cfgAttributes select _n;\
							_respawnTypes = getarray (_cfg >> 'respawnTypes');\
							_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
							_fade = [0.75,0] select _state;\
							_n = _n + 1;\
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

class UO_FW_RespawnTemplates_Indfor: Title {
	attributeLoad = "\
		private _selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Indfor',0];\
		private _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
		private _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
		private _defaultTemplates = [\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesNone'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesUnlimited'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesIndTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTeamTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesWave'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTriggered')\
		];\
		private _isDefault = _value isequalto [''];\
		{\
			private _cfgTemplate = _x;\
			private _scope = if (isnumber (_cfgTemplate >> 'scope')) then {getnumber (_cfgTemplate >> 'scope')} else {2};\
			private _respawnTypes = getarray (_cfgTemplate >> 'respawnTypes');\
			{\
				private _respawnType = _x;\
				private _ctrlListbox = _this controlsGroupCtrl (100 + _respawnType);\
				private _selected = if ((_respawnType == _selectedRespawnType) && {!_isDefault}) then {\
					_value\
				} else {\
					_defaultTemplates select _respawnType\
				};\
				if ((_scope > 1) && {(count _respawnTypes == 0) || _respawnType in _respawnTypes}) then {\
					private _data = configname _cfgTemplate;\
					private _name = gettext (_cfgTemplate >> 'displayName');\
					if (_name == '') then {_name = _data};\
					private _lbAdd = _ctrlListbox lbadd _name;\
					_ctrlListbox lbsetdata [_lbAdd,_data];\
					private _active = _data in _selected;\
					_ctrlListbox lbsetvalue [_lbAdd,[0,1] select _active];\
					_ctrlListbox lbsetpicture [_lbAdd,[_pictureUnchecked,_pictureChecked] select _active];\
				};\
			} foreach [0,1,2,3,4,5];\
		} foreach configproperties [configfile >> 'UO_FW_RespawnTemplates','isclass _x'];\
		{\
			private _ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
			lbsort _ctrlListbox;\
		} foreach [0,1,2,3,4,5];\
	";
	attributeSave = "\
		_value = [];\
		{\
			_ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			if (ctrlshown _ctrlListbox) exitwith {\
				for '_i' from 0 to (lbsize _ctrlListbox - 1) do {\
					if (_ctrlListbox lbvalue _i > 0) then {_value pushback (_ctrlListbox lbdata _i);};\
				};\
			};\
		} foreach [0,1,2,3,4,5];\
		_value\
	";
	h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
	class Controls: Controls {
		class Title: Title {
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
		};
		class Value0: ctrlListbox {
			idc=100;
			show=0;
			x="48 * (pixelW * pixelGrid * 	0.50)";
			w="82 * (pixelW * pixelGrid * 	0.50)";
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
			colorSelectBackground[]={0,0,0,0};
			colorSelectBackground2[]={0,0,0,0};
			onLBSelChanged = "\
				_ctrlListbox = _this select 0;\
				_cursel = _this select 1;\
				_active = _ctrlListbox lbvalue _cursel;\
				_active = (_active + 1) % 2;\
				_pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
				_pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
				_ctrlListbox lbsetvalue [_cursel,_active];\
				_ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
			";
			onSetFocus=  "\
			_ctrl = _this select 0;\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Value_Indfor','']) isEqualto '')},{\
				params ['_ctrl'];\
				_ctrlGroup = ctrlparentcontrolsgroup _ctrl;\
				_selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Indfor',0];\
				{\
					_ctrlListbox = _ctrlGroup controlsGroupCtrl (100 + _x);\
					_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
				} foreach [0,1,2,3,4,5];\
			}, [_ctrl]] call CBA_fnc_waitUntilAndExecute;\
			";
		};
		class Value1: Value0 {
			idc=101;
		};
		class Value2: Value0 {
			idc=102;
		};
		class Value3: Value0 {
			idc=103;
		};
		class Value4: Value0 {
			idc=104;
		};
		class Value5: Value0 {
			idc=105;
		};
		class Value6: Value0 {
			idc=106;
		};
		class Value7: Value0 {
			idc=107;
		};
	};
};

class UO_FW_Respawn_Combo_Civ: Combo {
	attributeLoad = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Civ',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Civ',_config];\
		private _respawnSystemTypeArray = [['None',0],['Unlimited',1],['Individual Tickets',2],['Team Tickets',3],['Wave',4],['Triggered',5]];\
		{\
			_x params ['_name','_number'];\
			private _index = _ctrlCombo lbadd _name;\
			_ctrlCombo lbsetdata [_index,_name];\
			_ctrlCombo lbsetValue [_index,_number];\
			if (_value isEqualto (_ctrlCombo lbValue _index)) then {\
				_ctrlCombo lbSetCurSel _index;\
			};\
		} foreach _respawnSystemTypeArray;\
	";
	attributeSave = "\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);\
		missionNamespace setvariable ['UO_FW_Respawn_Value_Civ',_value];\
		missionNamespace setvariable ['UO_FW_Respawn_Combo_Cfg_Civ',_config];\
		_value\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLoad = "\
			params ['_ctrlCombo'];\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Civ','']) isEqualto '')},{\
				params ['_ctrlCombo'];\
				private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Civ',''];\
				private _configH = configHierarchy _configstr;\
				private _configHParent = _configH select ((count _configH) - 2);\
				private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
				private _respawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Civ',0];\
				private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				_n = 0;\
				{\
					if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
						_cfg = _cfgAttributes select _n;\
						_respawnTypes = getarray (_cfg >> 'respawnTypes');\
						_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
						_fade = [0.75,0] select _state;\
						_n = _n + 1;\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
						ctrlsetfocus _x;\
						ctrlsetfocus _ctrlCombo;\
					};\
				} foreach (allcontrols (ctrlparent _ctrlCombo));\
			}, [_ctrlCombo]] call CBA_fnc_waitUntilAndExecute;\
			";
			onLBSelChanged = "\
				params ['_ctrlCombo','_cursel'];\
				[_ctrlCombo,_cursel] spawn {\
					params ['_ctrlCombo','_cursel'];\
					_respawnType = _ctrlCombo lbValue _cursel;\
					private _configstr = missionNamespace getvariable ['UO_FW_Respawn_Combo_Cfg_Civ',''];\
					private _configH = configHierarchy _configstr;\
					private _configHParent = _configH select ((count _configH) - 2);\
					private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
					missionNamespace setvariable ['UO_FW_Respawn_Value_Civ',_respawnType];\
					private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
					_n = 0;\
					{\
						if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
							_cfg = _cfgAttributes select _n;\
							_respawnTypes = getarray (_cfg >> 'respawnTypes');\
							_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
							_fade = [0.75,0] select _state;\
							_n = _n + 1;\
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

class UO_FW_RespawnTemplates_Civ: Title {
	attributeLoad = "\
		private _selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Civ',0];\
		private _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
		private _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
		private _defaultTemplates = [\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesNone'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesUnlimited'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesIndTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTeamTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesWave'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTriggered')\
		];\
		private _isDefault = _value isequalto [''];\
		{\
			private _cfgTemplate = _x;\
			private _scope = if (isnumber (_cfgTemplate >> 'scope')) then {getnumber (_cfgTemplate >> 'scope')} else {2};\
			private _respawnTypes = getarray (_cfgTemplate >> 'respawnTypes');\
			{\
				private _respawnType = _x;\
				private _ctrlListbox = _this controlsGroupCtrl (100 + _respawnType);\
				private _selected = if ((_respawnType == _selectedRespawnType) && {!_isDefault}) then {\
					_value\
				} else {\
					_defaultTemplates select _respawnType\
				};\
				if ((_scope > 1) && {(count _respawnTypes == 0) || _respawnType in _respawnTypes}) then {\
					private _data = configname _cfgTemplate;\
					private _name = gettext (_cfgTemplate >> 'displayName');\
					if (_name == '') then {_name = _data};\
					private _lbAdd = _ctrlListbox lbadd _name;\
					_ctrlListbox lbsetdata [_lbAdd,_data];\
					private _active = _data in _selected;\
					_ctrlListbox lbsetvalue [_lbAdd,[0,1] select _active];\
					_ctrlListbox lbsetpicture [_lbAdd,[_pictureUnchecked,_pictureChecked] select _active];\
				};\
			} foreach [0,1,2,3,4,5];\
		} foreach configproperties [configfile >> 'UO_FW_RespawnTemplates','isclass _x'];\
		{\
			private _ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
			lbsort _ctrlListbox;\
		} foreach [0,1,2,3,4,5];\
	";
	attributeSave = "\
		_value = [];\
		{\
			_ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			if (ctrlshown _ctrlListbox) exitwith {\
				for '_i' from 0 to (lbsize _ctrlListbox - 1) do {\
					if (_ctrlListbox lbvalue _i > 0) then {_value pushback (_ctrlListbox lbdata _i);};\
				};\
			};\
		} foreach [0,1,2,3,4,5];\
		_value\
	";
	h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
	class Controls: Controls {
		class Title: Title {
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
		};
		class Value0: ctrlListbox {
			idc=100;
			show=0;
			x="48 * (pixelW * pixelGrid * 	0.50)";
			w="82 * (pixelW * pixelGrid * 	0.50)";
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
			colorSelectBackground[]={0,0,0,0};
			colorSelectBackground2[]={0,0,0,0};
			onLBSelChanged = "\
				_ctrlListbox = _this select 0;\
				_cursel = _this select 1;\
				_active = _ctrlListbox lbvalue _cursel;\
				_active = (_active + 1) % 2;\
				_pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
				_pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
				_ctrlListbox lbsetvalue [_cursel,_active];\
				_ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
			";
			onSetFocus=  "\
			_ctrl = _this select 0;\
			[{!((missionNamespace getvariable ['UO_FW_Respawn_Value_Civ','']) isEqualto '')},{\
				params ['_ctrl'];\
				_ctrlGroup = ctrlparentcontrolsgroup _ctrl;\
				_selectedRespawnType = missionNamespace getvariable ['UO_FW_Respawn_Value_Civ',0];\
				{\
					_ctrlListbox = _ctrlGroup controlsGroupCtrl (100 + _x);\
					_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
				} foreach [0,1,2,3,4,5];\
			}, [_ctrl]] call CBA_fnc_waitUntilAndExecute;\
			";
		};
		class Value1: Value0 {
			idc=101;
		};
		class Value2: Value0 {
			idc=102;
		};
		class Value3: Value0 {
			idc=103;
		};
		class Value4: Value0 {
			idc=104;
		};
		class Value5: Value0 {
			idc=105;
		};
		class Value6: Value0 {
			idc=106;
		};
		class Value7: Value0 {
			idc=107;
		};
	};
};
