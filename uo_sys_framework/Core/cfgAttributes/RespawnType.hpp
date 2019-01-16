class UO_FW_Respawn_Combo: Combo {
	attributeLoad ="\
		[_this controlsGroupCtrl 100,_config] call UO_FW_fnc_attributeLoadCombo;\
		disableSerialization;\
		private _ctrlCombo = (_this controlsGroupCtrl 100);\
		_ctrlCombo setvariable ['UO_FW_parentcfg',_config];\
		private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
	";
	attributeSave ="\
		value = [_this controlsGroupCtrl 100,_config] call Enh_fnc_attributeSaveCombo;\
		value\
	";
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			class Items {
				class None {
					text="None";
					tooltip="";
					data="None";
					value=0;
				};
				class Unlimited {
					text="Unlimited";
					tooltip="";
					data="Unlimited";
					value=1;
				};
				class IndTickets {
					text="Individual Tickets";
					tooltip="";
					data="IndTickets";
					value=2;
				};
				class TeamTickets {
					text="Team Tickets";
					tooltip="";
					data="TeamTickets";
					value=3;
				};
				class Wave {
					text="Wave";
					tooltip="";
					data="Wave";
					value=4;
				};
				class Triggered {
					text="Triggered";
					tooltip="";
					data="Triggered";
					value=5;
				};
			};
			onLBSelChanged="\
				_ctrlCombo = _this select 0;\
				_cursel = _this select 1;\
				_respawnType = _ctrlCombo lbvalue _cursel;\
				private _config = _ctrlCombo getvariable ['UO_FW_parentcfg',''];\
				private _configH = configHierarchy _config;\
				diag_log format ['_configH: %1',_configH];\
				private _configHParent = _configH select ((count _configH) - 2);\
				diag_log format ['_configHParent: %1',_configHParent];\
				private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
				missionnamespace setvariable ['UO_FW_Respawn_value',_respawnType];\
				_ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
				diag_log format ['_cfgAttributes: %1',_cfgAttributes];\
				_n = 0;\
				{\
					if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
						_cfg = _cfgAttributes select _n;\
						_respawnTypes = getarray (_cfg >> 'respawnTypes');\
						_state = ((count _respawnTypes == 0) || (_respawnType in _respawnTypes));\
						_fade = [0.75,0] select _state;\
						_n = _n + 1;\
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

class UO_FW_RespawnTemplates: Title {
	attributeLoad="\
		_selectedRespawnType = missionnamespace getvariable ['UO_FW_Respawn_value',0];\
		_pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
		_pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
		_defaultTemplates = [\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesNone'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesUnlimited'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesIndTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTeamTick'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesWave'),\
			getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTriggered')\
		];\
		_isDefault = _value isequalto [''];\
		{\
			_cfgTemplate = _x;\
			_scope = if (isnumber (_cfgTemplate >> 'scope')) then {getnumber (_cfgTemplate >> 'scope')} else {2};\
			_respawnTypes = getarray (_cfgTemplate >> 'respawnTypes');\
			{\
				_respawnType = _x;\
				_ctrlListbox = _this controlsGroupCtrl (100 + _respawnType);\
				_selected = if (_respawnType == _selectedRespawnType && {!_isDefault}) then {\
					_value\
				} else {\
					_defaultTemplates select _respawnType\
				};\
				if (_scope > 1 && {count _respawnTypes == 0 || {_respawnType in _respawnTypes}}) then {\
					_data = configname _cfgTemplate;\
					_name = gettext (_cfgTemplate >> 'displayName');\
					if (_name == '') then {_name = _data};\
					_lbAdd = _ctrlListbox lbadd _name;\
					_ctrlListbox lbsetdata [_lbAdd,_data];\
					_active = _data in _selected;\
					_ctrlListbox lbsetvalue [_lbAdd,[0,1] select _active];\
					_ctrlListbox lbsetpicture [_lbAdd,[_pictureUnchecked,_pictureChecked] select _active];\
				};\
			} foreach [0,1,2,3,4,5];\
		} foreach configproperties [configfile >> 'UO_FW_RespawnTemplates','isclass _x'];\
		{\
			_ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
			lbsort _ctrlListbox;\
		} foreach [0,1,2,3,4,5];\
	";
	attributeSave="\
		_value = [];\
		{\
			_ctrlListbox = _this controlsGroupCtrl (100 + _x);\
			if (ctrlshown _ctrlListbox) exitwith {\
				for '_i' from 0 to (lbsize _ctrlListbox - 1) do {\
					if (_ctrlListbox lbvalue _i > 0) then {_value pushback (_ctrlListbox lbdata _i);};\
				};\
			};\
		} foreach [0,1,2,3,4,5];\
		_value\
	";
	h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
	class Controls: Controls {
		class Title: Title {
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
		};
		class Value0: ctrlListbox {
			idc=100;
			show=0;
			x="48 * (pixelW * pixelGrid * 	0.50)";
			w="82 * (pixelW * pixelGrid * 	0.50)";
			h="5 * 	5 * (pixelH * pixelGrid * 	0.50)";
			colorSelectBackground[]={0,0,0,0};
			colorSelectBackground2[]={0,0,0,0};
			onLBSelChanged="\
				_ctrlListbox = _this select 0;\
				_cursel = _this select 1;\
				_active = _ctrlListbox lbvalue _cursel;\
				_active = (_active + 1) % 2;\
				_pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
				_pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
				_ctrlListbox lbsetvalue [_cursel,_active];\
				_ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
			";
			onSetFocus="\
				_ctrlGroup = ctrlparentcontrolsgroup (_this select 0);\
				_selectedRespawnType = missionnamespace getvariable ['UO_FW_Respawn_value',0];\
				{\
				_ctrlListbox = _ctrlGroup controlsGroupCtrl (100 + _x);\
				_ctrlListbox ctrlshow (_x == _selectedRespawnType);\
			} foreach [0,1,2,3,4,5];\
			";
		};
		class Value1: Value0 {
			idc=101;
		};
		class Value2: Value0 {
			idc=102;
		};
		class Value3: Value0 {
			idc=103;
		};
		class Value4: Value0 {
			idc=104;
		};
		class Value5: Value0 {
			idc=105;
		};
		class Value6: Value0 {
			idc=106;
		};
		class Value7: Value0 {
			idc=107;
		};
	};
};
