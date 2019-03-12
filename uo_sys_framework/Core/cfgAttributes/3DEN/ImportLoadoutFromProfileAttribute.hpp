class UO_FW_ImportLoadoutFromProfileAttribute: Combo {
    attributeLoad="\
        private _control = _this controlsgroupctrl 100;\
        private _profileArray = profileNamespace getvariable ['UO_FW_ProfileLoadoutSettingsArray',[]];\
        if (_profileArray isEqualto []) then {\
            lbClear _control;\
            private _placeholderIndex = _control lbadd 'No Loadout Profiles Saved';\
            _control lbsetdata [_placeholderIndex,'No Loadout Profiles Saved'];\
            _control lbSetCurSel _placeholderIndex;\
        } else {\
            lbClear _control;\
            private _placeholderIndex = _control lbadd 'None';\
            _control lbsetdata [_placeholderIndex,'None'];\
            {\
                _x params ['_name'];\
                private _index = _control lbadd _name;\
                _control lbsetdata [_index,_name];\
            } foreach _profileArray;\
            _control lbSetCurSel _placeholderIndex;\
        };\
    ";
    attributeSave="";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			idc=100;
            x="48 * (pixelW * pixelGrid * 	0.50)";
			w="(	60 - 	5) * (pixelW * pixelGrid * 	0.50)";
			h="5 * (pixelH * pixelGrid * 	0.50)";
		};
		class Preview: ctrlButtonPictureKeepAspect {
			idc=101;
            x="(	48 + 	60 - 	5) * (pixelW * pixelGrid * 	0.50)";
			w="0.99 * 	5 * (pixelW * pixelGrid * 	0.50)";
			h="5 * (pixelH * pixelGrid * 	0.50)";
			text="\a3\3DEN\Data\Attributes\ComboPreview\play_ca.paa";
			onMouseButtonClick= QUOTE(\
				_this params ['_ctrlButton'];\
				_ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
				_ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
				[ARR_2((_ctrlCombo lbData lbcursel _ctrlCombo),false)] call EFUNC(3DEN,ImportLoadoutSettings);\
			);
		};
	};
};
