class UO_FW_Hostage_Behavior_Checkbox: Checkbox {
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onLoad="\
				private _ctrlCheckbox = _this select 0;\
				private _HostageBehaviorMode = [0,1] select (cbChecked _ctrlCheckbox);\
				private _unit = ((get3denselected 'object') select 0);\
				private _n = 0;\
				private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Hostage_Attributes' >> 'Attributes',0] call BIS_fnc_returnChildren;\
				{\
					if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
						private _cfg = _cfgAttributes select _n;\
						_n = _n + 1;\
						private _state = true;\
						if (isArray(_cfg >> 'HostageBehaviorModes')) then {\
				 			_HostageBehaviorModes = getarray (_cfg >> 'HostageBehaviorModes');\
							if !(_HostageBehaviorMode in _HostageBehaviorModes) then {\
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
			";
			onCheckedChanged="\
				private _ctrlCheckbox = _this select 0;\
				private _HostageBehaviorMode = [0,1] select (cbChecked _ctrlCheckbox);\
				private _unit = ((get3denselected 'object') select 0);\
				private _n = 0;\
				private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Hostage_Attributes' >> 'Attributes',0] call BIS_fnc_returnChildren;\
				{\
					if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
						private _cfg = _cfgAttributes select _n;\
						_n = _n + 1;\
						private _state = true;\
						if (isArray(_cfg >> 'HostageBehaviorModes')) then {\
				 			_HostageBehaviorModes = getarray (_cfg >> 'HostageBehaviorModes');\
							if !(_HostageBehaviorMode in _HostageBehaviorModes) then {\
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
			";
		};
	};
};
