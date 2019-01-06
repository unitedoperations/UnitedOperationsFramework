class UO_FW_Gear_SystemType: Combo {
	attributeSave = "(_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100)";
	attributeLoad ="\
		[_this controlsGroupCtrl 100,_config] call UO_FW_fnc_attributeLoadCombo;\
		[_this,_value,_unit] spawn {\
		disableserialization;\
		params ['_config','_value'];\
		private _ctrlCombo = (_config controlsGroupCtrl 100);\
		private _n = 0;\
		private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
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
			class Items {
				class None {
					text = "None";
					//tooltip="";
					value = 0;
					data = "None";
					default = 1;
				};
				class ACEAR
				{
					text = "ACE Arsenal";
					//tooltip="";
					data = "ACEAR";
					value = 1;
				};
				class OLSEN
				{
					text = "Olsen Script";
					//tooltip="";
					value = 2;
					data = "OLSEN";
				};
			};
			onLBSelChanged="\
			_ctrlCombo = _this select 0;\
		  _cursel = _this select 1;\
		  _GearSystem = _ctrlCombo lbData _cursel;\
		  [_ctrlCombo,_cursel,_GearSystem] spawn {\
			 	 disableserialization;\
				 _this params ['_ctrlCombo','_cursel','_GearSystem'];\
				 private _n = 0;\
			 	 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
			 	 private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Gear' >> 'Attributes',0] call BIS_fnc_returnChildren;\
				 {\
			 		 if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
			 			private _cfg = _cfgAttributes select _n;\
			 			_n = _n + 1;\
						private _state = true;\
			 			if (isArray(_cfg >> 'GearSystems')) then {\
							private _GearSystems = getarray (_cfg >> 'GearSystems');\
							if !(_GearSystem in _GearSystems) then {\
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
