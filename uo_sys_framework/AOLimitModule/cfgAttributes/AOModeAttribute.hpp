class UO_FW_AOModeAttribute: Title {
	attributeLoad = "[_this controlsGroupCtrl 100,_config] call UO_FW_fnc_attributeLoadCombo";
	attributeSave = "[_this controlsGroupCtrl 100,_config] call UO_FW_fnc_attributeSaveCombo";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlCombo {
			class Items {
				class Hard
				{
					text="Hard AO";
					//tooltip="";
					value=0;
					default = 1;
				};
				class Soft
				{
					text="Soft AO";
					//tooltip="";
					value=1;
				};
			};
			onLBSelChanged="_ctrlCombo = _this select 0;\
		  _cursel = _this select 1;\
		  _AOType = _ctrlCombo lbvalue _cursel;\
		  _logic = ((get3denselected 'logic') select 0);\
		  _logic setvariable ['AOType_value',_AOType];\
		  [_this,_logic,_AOType] spawn {\
		 	 diag_log format ['_this: %1',_this];\
		 	 disableserialization; _ctrlCombo = (_this select 0) select 0;\
		 	 _cursel = (_this select 0) select 1;\
		 	 _logic = _this select 1;\
		 	 _AOType = _logic getvariable ['AOType_value',0];\
		 	 _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
		 	 _logicType = typeOf _logic;\
		 	 _cfgAttributes = [configFile >> 'CfgVehicles' >> _logicType >> 'Attributes',0] call BIS_fnc_returnChildren;\
		 	 {\
		 		 if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
		 			diag_log format ['_n count: %1',_n];\
		 			_cfg = _cfgAttributes select _n;\
		 			_n = _n + 1;\
		 			diag_log format ['_cfg: %1',_cfg];\
					_state = true;\
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
		 };";
		};
	};
};
