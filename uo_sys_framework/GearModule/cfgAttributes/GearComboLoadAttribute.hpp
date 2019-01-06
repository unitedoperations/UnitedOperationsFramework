class UO_FW_Gear_ComboGearLoad: ComboPreview
		{
			//save the lbData from the selected entry upon exit
			attributeSave = "(_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100)";
			//_this - config, _value - saved value
			attributeLoad="\
			[_this,_value] spawn {\
				disableserialization;\
				params ['_config','_value'];\
				private _control = (_config controlsGroupCtrl 100);\
				_classArray = [['None','NONE'],['Rifleman','RFL'],['Rifleman AT','RFLAT'],['Automatic Rifleman','AR'],['Grenadier','GRN'],['Team Leader','TL'],['Squad Leader','SQL'],['Anti Tank','AT'],['Assistant Anti Tank','AAT'],['Machinegunner','MGA'],['Assistant Machinegunner','AMG'],['Vehicle Crewman','VCRW'],['Vehicle Commander','VCMD']];\
				{\
					_x params ['_name','_className'];\
					private _index = _control lbadd _name;\
					_control lbsetdata [_index,_className];\
					_control lbsetValue [_index,_foreachIndex];\
					if (_value isEqualto (_control lbData _index)) then {\
						_control lbSetCurSel _index;\
					};\
				} foreach _classArray;\
			};\
			";
			class Controls: Controls
			{
				class Title: Title {};
				class Value: Value {};
				class Preview: Preview
				{
					idc=101;
					onMouseButtonClick="\
						_ctrlButton = _this select 0;\
						_ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
						_ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
						_unit = ((get3denselected 'object') select 0);\
						[(_ctrlCombo lbData lbcursel _ctrlCombo),_unit] call UO_FW_fnc_GearTypeLoadfromAttribute;\
					";
				};
			};
		};
