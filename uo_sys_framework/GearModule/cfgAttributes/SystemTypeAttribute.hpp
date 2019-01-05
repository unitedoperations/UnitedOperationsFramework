class UO_FW_Gear_SystemType: Combo {
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			class Items {
				class Hard
				{
					text="ACE Arsenal";
					//tooltip="";
					data="ACEARSENAL";
					value=0;
					default = 0;
				};
				class Soft
				{
					text="Olsen Script";
					//tooltip="";
					data="OLSEN";
					value=1;
				};
			};
			onLBSelChanged="\
			_ctrlCombo = _this select 0;\
		  _cursel = _this select 1;\
		  _GearSystem = _ctrlCombo lbvalue _cursel;\
		  _unit = ((get3denselected 'object') select 0);\
		  _unit setvariable ['GearSystem_value',_GearSystem];\
		  [_this,_unit,_GearSystem] spawn {\
			 	 disableserialization;\
				 private _ctrlCombo = (_this select 0) select 0;\
			 	 private _cursel = (_this select 0) select 1;\
			 	 private _unit = _this select 1;\
			 	 private _GearSystem = _this select 2;\
				 private _n = 0;\
			 	 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
			 	 private _unitType = typeOf _unit;\
				 private _objectcfg = _unitType call CBA_fnc_getObjectConfig;\
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
