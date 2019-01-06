//class UO_FW_TeamColourAttribute: Toolbox {
//	attributeLoad = "missionnamespace setvariable ['UO_FW_TeamColour_value',_value]; (_this controlsGroupCtrl 193) lbsetcursel _value;";
//	attributeSave = "missionnamespace getvariable ['UO_FW_TeamColour_value',0];";
//	h = "18 * (pixelH * pixelGrid * 0.50)";
//	class Controls: Controls {
//		class Title: Title {};
//		class Value: ctrlToolbox {
//			idc = 193;
//			style = "0x02";
//			x = "48 * (pixelW * pixelGrid * 0.50)";
//      w = "82 * (pixelW * pixelGrid * 0.50)";
//      h = "12 * (pixelH * pixelGrid * 0.50)";
//			rows = 2;
//      columns = 3;
//			strings[] = {"NONE","WHITE","RED","BLUE","GREEN","YELLOW"};
//			values[] = {0,1,2,3,4,5};
//			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_TeamColour_value',(_this select 1)];";
//		};
//	};
//};

class UO_FW_TeamColourAttribute: Combo {
	//save the lbData from the selected entry upon exit
	attributeSave = "_value = (_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100); _value";
	//_this - config, _value - saved value
	attributeLoad="\
	[_this,_value] spawn {\
		disableserialization;\
		params ['_config','_value'];\
		private _control = (_config controlsGroupCtrl 100);\
		_teamcolourarray = [['None',[0, 0, 0, 0]],['White',[1, 1, 1, 1]],['Red',[1, 0, 0, 1]],['Green',[0, 1, 0, 1]],['Blue',[0, 0, 1, 1]],['Yellow',[1, 1, 0, 1]]];\
		{\
			_x params ['_name','_colour'];\
			private _index = _control lbadd _name;\
			_control lbsetdata [_index,_name];\
			_control lbsetValue [_index,_foreachIndex];\
			_control lbsetpicture [_index,'#(argb,8,8,3)color(1,1,1,1)'];\
			_control lbsetpicturecolor [_index,_colour];\
			_control lbsetpicturecolorselected [_index,_colour];\
			if (_value isEqualto (_control lbData _index)) then {\
				_control lbSetCurSel _index;\
			};\
		} foreach _teamcolourarray;\
	};\
	";
	onLoad="\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [false,true] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {};
	};
};
