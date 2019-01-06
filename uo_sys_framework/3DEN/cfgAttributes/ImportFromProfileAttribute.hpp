class UO_FW_ImportFromProfileAttribute: ComboPreview {
	class Controls: Controls {
		class Title: Title {};
		class Value: Value
		{
			idc=100;
			x="48 * (pixelW * pixelGrid * 	0.50)";
			w="(	82 - 	5) * (pixelW * pixelGrid * 	0.50)";
			h="5 * (pixelH * pixelGrid * 	0.50)";
			onLoad="\
			_this spawn {\
				disableserialization;\
				params ['_control','_config'];\
				private _profileArray = profileNamespace getvariable ['UO_FW_ProfileSettingsArray',[]];\
				if (_profileArray isEqualto []) then {\
					lbClear _control;\
					private _index = _control lbadd 'No Settings Profiles Saved';\
					_control lbsetdata [_index,'No Settings Profiles Saved'];\
					_control lbsetValue [_index,99];\
					_control lbSetCurSel _index;\
				} else {\
					lbClear _control;\
					private _index = _control lbadd 'None';\
					_control lbsetdata [_index,'None'];\
					_control lbsetValue [_index,99];\
					_control lbSetCurSel _index;\
					{\
						_x params ['_name'];\
						private _index = _control lbadd _name;\
						_control lbsetdata [_index,_name];\
						_control lbsetValue [_index,_forEachIndex];\
					} foreach _profileArray;\
				};\
			};\
			 ";
		};
		class Preview: Preview
		{
			idc=101;
			x="(	48 + 	82 - 	5) * (pixelW * pixelGrid * 	0.50)";
			w="0.99 * 	5 * (pixelW * pixelGrid * 	0.50)";
			h="5 * (pixelH * pixelGrid * 	0.50)";
			text="\a3\3DEN\Data\Attributes\ComboPreview\play_ca.paa";
			onMouseButtonClick="\
				_this params ['_ctrlButton'];\
				_ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
				_ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
				[(_ctrlCombo lbData lbcursel _ctrlCombo),false] call UO_FW_fnc_ImportSettings;\
			";
		};
	};
};
