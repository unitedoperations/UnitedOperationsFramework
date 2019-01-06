class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL: Combo
{
	//save the lbData from the selected entry upon exit
	attributeSave = "(_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100)";
	//_this - config, _value - saved value
	attributeLoad="\
	[_this,_value] spawn {\
		disableserialization;\
		params ['_config','_value'];\
		private _control = (_config controlsGroupCtrl 100);\
		private _defaultloadoutsArray = MissionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];\
		if (_defaultloadoutsArray isEqualto []) then {\
			lbClear _control;\
			private _indexEmpty = _control lbadd 'No Loadouts Defined';\
			_control lbsetdata [_indexEmpty,'No Loadouts Defined'];\
			_control lbsetValue [_indexEmpty,99];\
			_control lbSetCurSel _indexEmpty;\
		} else {\
			lbClear _control;\
			private _indexNone = _control lbadd 'None';\
			_control lbsetdata [_indexNone,'None'];\
			_control lbsetValue [_indexNone,99];\
			if (_value isEqualto (_control lbData _indexNone)) then {\
				_control lbSetCurSel _indexNone;\
			};\
			{\
				_x params ['_loadoutName', '_loadoutData'];\
				private _index = _control lbadd _loadoutName;\
				_control lbsetdata [_index,_loadoutName];\
				_control lbsetValue [_index,_forEachIndex];\
				_uniformArray = (_loadoutData select 3);\
				if !(_uniformArray isEqualto []) then {\
					_uniform = _uniformArray select 0;\
					_uniformPicturePath = getText (configFile >> 'cfgWeapons' >> _uniform >> 'picture');\
					_control lbsetpictureRight [_index,_uniformPicturePath];\
					_control lbsetpictureRightcolor [_index,[1,1,1,0.75]];\
					_control lbsetpictureRightcolorselected [_index,[1,1,1,1]];\
				};\
				_launcherArray = (_loadoutData select 1);\
				if !(_launcherArray isEqualto []) then {\
					_launcherWeapon = _launcherArray select 0;\
					_launcherPicturePath = getText (configFile >> 'cfgWeapons' >> _launcherWeapon >> 'picture');\
					_control lbsetpicture [_index,_launcherPicturePath];\
					_control lbsetpicturecolor [_index,[1,1,1,0.75]];\
					_control lbsetpicturecolorselected [_index,[1,1,1,1]];\
				} else {\
					_primaryWeaponArray = (_loadoutData select 0);\
					if !(_primaryWeaponArray isEqualto []) then {\
						_primaryWeapon = _primaryWeaponArray select 0;\
						_primaryweaponPicturePath = getText (configFile >> 'cfgWeapons' >> _primaryWeapon >> 'picture');\
						_control lbsetpicture [_index,_primaryweaponPicturePath];\
						_control lbsetpicturecolor [_index,[1,1,1,0.75]];\
						_control lbsetpicturecolorselected [_index,[1,1,1,1]];\
					} else {\
						_secondaryWeaponArray = (_loadoutData select 2);\
						if !(_secondaryWeaponArray isEqualto []) then {\
							_secondaryWeapon = _secondaryWeaponArray select 0;\
							_secondaryweaponPicturePath = getText (configFile >> 'cfgWeapons' >> _secondaryWeapon >> 'picture');\
							_control lbsetpicture [_index,_secondaryweaponPicturePath];\
							_control lbsetpicturecolor [_index,[1,1,1,0.75]];\
							_control lbsetpicturecolorselected [_index,[1,1,1,1]];\
						};\
					};\
				};\
				if (_value isEqualto (_control lbData _index)) then {\
					_control lbSetCurSel _index;\
				};\
			} foreach _defaultloadoutsArray;\
		};\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			idc=100;
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbValue _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFL',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFLAT: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFLAT',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_AR: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AR',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_GRN: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_GRN',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_TL: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TL',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_SQL: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_SQL',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_AT: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AT',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_AAT: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AAT',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_MG: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MG',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_AMG: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AMG',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_VCRW: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCRW',_value];\
			};\
			";
		};
	};
};

class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_VCMD: UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL
{
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value
		{
			onLBSelChanged="\
			if (is3den) then {\
				_ctrlCombo = _this select 0;\
			  _cursel = _this select 1;\
				_value = _control lbData _cursel;\
				MissionNamespace setvariable ['UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCMD',_value];\
			};\
			";
		};
	};
};
