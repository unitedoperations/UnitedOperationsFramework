class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo: Combo
		{
			class Controls: Controls
			{
				class Title: Title {};
				class Value: Value
				{
					onLoad="\
					_this spawn {\
						disableserialization;\
						params ['_control','_config'];\
						private ['_index'];\
						private _loadoutArray = MissionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];\
						if (_loadoutArray isEqualto []) then {\
							lbClear _control;\
							_index = _control lbadd 'No Loadouts Defined';\
							_control lbsetdata [_index,'No Loadouts Defined'];\
							_control lbSetCurSel _index;\
						} else {\
							lbClear _control;\
							_index = _control lbadd 'None';\
							_control lbsetdata [_index,'None'];\
							{\
								_x params ['_loadoutName', '_loadoutData'];\
								_index = _control lbadd _loadoutName;\
								_control lbsetdata [_index,_loadoutName];\
								_primaryWeaponArray = (_loadoutData select 0);\
								if !(_primaryWeaponArray isEqualto []) then {\
									_primaryWeapon = _primaryWeaponArray select 0;\
									_picturePath = getText (configFile >> 'cfgWeapons' >> _primaryWeapon >> 'picture');\
									_control lbsetpicture [_index,_picturePath];\
									_control lbsetpicturecolor [_index,[1,1,1,0.75]];\
									_control lbsetpicturecolorselected [_index,[1,1,1,1]];\
								} else {\
									_secondaryWeaponArray = (_loadoutData select 2);\
									if !(_secondaryWeaponArray isEqualto []) then {\
										_secondaryWeapon = _secondaryWeaponArray select 0;\
										_picturePath = getText (configFile >> 'cfgWeapons' >> _secondaryWeapon >> 'picture');\
										_control lbsetpicture [_index,_picturePath];\
										_control lbsetpicturecolor [_index,[1,1,1,0.75]];\
										_control lbsetpicturecolorselected [_index,[1,1,1,1]];\
									};\
								};\
							} foreach _loadoutArray;\
						};\
					};\
					";
				};
			};
		};
