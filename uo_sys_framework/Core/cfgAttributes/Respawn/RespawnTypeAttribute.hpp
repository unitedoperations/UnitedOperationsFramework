#define UO_FW_RESPAWN_COMBO_ATTR_LOAD(VALUEVAR,CFGVAR) \
attributeLoad = "\
    private _ctrlCombo = (_this controlsGroupCtrl 100);\
    missionNamespace setvariable ['##VALUEVAR##',_value];\
    missionNamespace setvariable ['##CFGVAR##',_config];\
    private _respawnSystemTypeArray = [['None',0],['Unlimited',1],['Individual Tickets',2],['Team Tickets',3]];\
    {\
        _x params ['_name','_number'];\
        private _index = _ctrlCombo lbadd _name;\
        _ctrlCombo lbsetdata [_index,_name];\
        _ctrlCombo lbsetValue [_index,_number];\
        if (_value isEqualto (_ctrlCombo lbValue _index)) then {\
            _ctrlCombo lbSetCurSel _index;\
        };\
    } foreach _respawnSystemTypeArray;\
"

#define UO_FW_RESPAWN_COMBO_ATTR_SAVE(VALUEVAR,CFGVAR) \
attributeSave = "\
    private _ctrlCombo = (_this controlsGroupCtrl 100);\
    private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);\
    missionNamespace setvariable ['##VALUEVAR##',_value];\
    missionNamespace setvariable ['##CFGVAR##',_config];\
    _value\
"

#define UO_FW_RESPAWN_COMBO_ONLOAD(VALUEVAR,CFGVAR) \
onLoad = "\
    params ['_ctrlCombo'];\
    [{!((missionNamespace getvariable [(_this select 1),'']) isEqualto '')},{\
        params ['_ctrlCombo','_varName','_cfgVarName'];\
        private _configstr = missionNamespace getvariable [_cfgVarName,''];\
        private _configH = configHierarchy _configstr;\
        private _configHParent = _configH select ((count _configH) - 2);\
        private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
        private _respawnType = missionNamespace getvariable [_varName,0];\
        private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
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
    }, [_ctrlCombo,'##VALUEVAR##','##CFGVAR##']] call CBA_fnc_waitUntilAndExecute;\
"

#define UO_FW_RESPAWN_COMBO_ONLBSELCHANGED(VALUEVAR,CFGVAR) \
onLBSelChanged = "\
    params ['_ctrlCombo','_cursel'];\
    [_ctrlCombo,_cursel] spawn {\
        params ['_ctrlCombo','_cursel'];\
        _respawnType = _ctrlCombo lbValue _cursel;\
        diag_log format ['combo new var onsel: %1',_respawnType];\
        private _configstr = missionNamespace getvariable ['##CFGVAR##',''];\
        private _configH = configHierarchy _configstr;\
        private _configHParent = _configH select ((count _configH) - 2);\
        private _cfgAttributes = [_configHParent,0] call BIS_fnc_returnChildren;\
        missionNamespace setvariable ['##VALUEVAR##',_respawnType];\
        private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
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
    };\
"

#define UO_FW_RESPAWN_TEMPLATES_ATTR_LOAD(VALUEVAR) \
attributeLoad = "\
    private _selectedRespawnType = missionNamespace getvariable ['##VALUEVAR##',0];\
    private _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
    private _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
    private _defaultTemplates = [\
        getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesNone'),\
        getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesUnlimited'),\
        getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesIndTick'),\
        getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTeamTick'),\
        getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesWave'),\
        getarray (configfile >> 'UO_FW_RespawnTemplates' >> 'respawnTemplatesTriggered')\
    ];\
    private _isDefault = _value isequalto [''];\
    {\
        private _cfgTemplate = _x;\
        private _scope = if (isnumber (_cfgTemplate >> 'scope')) then {getnumber (_cfgTemplate >> 'scope')} else {2};\
        private _respawnTypes = getarray (_cfgTemplate >> 'respawnTypes');\
        {\
            private _respawnType = _x;\
            private _ctrlListbox = _this controlsGroupCtrl (100 + _respawnType);\
            private _selected = if ((_respawnType == _selectedRespawnType) && {!_isDefault}) then {\
                _value\
            } else {\
                _defaultTemplates select _respawnType\
            };\
            if ((_scope > 1) && {(count _respawnTypes == 0) || _respawnType in _respawnTypes}) then {\
                private _data = configname _cfgTemplate;\
                private _name = gettext (_cfgTemplate >> 'displayName');\
                if (_name == '') then {_name = _data};\
                private _lbAdd = _ctrlListbox lbadd _name;\
                _ctrlListbox lbsetdata [_lbAdd,_data];\
                private _active = _data in _selected;\
                _ctrlListbox lbsetvalue [_lbAdd,[0,1] select _active];\
                _ctrlListbox lbsetpicture [_lbAdd,[_pictureUnchecked,_pictureChecked] select _active];\
            };\
        } foreach [0,1,2,3,4,5];\
    } foreach configproperties [configfile >> 'UO_FW_RespawnTemplates','isclass _x'];\
    {\
        private _ctrlListbox = _this controlsGroupCtrl (100 + _x);\
        _ctrlListbox ctrlshow (_x == _selectedRespawnType);\
        lbsort _ctrlListbox;\
    } foreach [0,1,2,3,4,5];\
"

#define UO_FW_RESPAWN_TEMPLATES_ATTR_SAVE \
attributeSave = "\
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
"

#define UO_FW_RESPAWN_TEMPLATES_ATTR_ONLOAD \
onLBSelChanged = "\
    _ctrlListbox = _this select 0;\
    _cursel = _this select 1;\
    _active = _ctrlListbox lbvalue _cursel;\
    _active = (_active + 1) % 2;\
    _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
    _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
    _ctrlListbox lbsetvalue [_cursel,_active];\
    _ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
"

#define UO_FW_RESPAWN_TEMPLATES_ATTR_ONSETFOCUS(VALUEVAR) \
onSetFocus = "\
_ctrl = _this select 0;\
diag_log format ['onsetfocus this: %1',_this];\
private _selectedRespawnType = missionNamespace getvariable ['##VALUEVAR##',0];\
diag_log format ['onsetfocus _valueVar: %1',_valueVar];\
    diag_log format ['onsetfocus wait this: %1',_this];\
    _ctrlGroup = ctrlparentcontrolsgroup _ctrl;\
    diag_log format ['onsetfocus _selectedRespawnType: %1',_selectedRespawnType];\
    {\
        _ctrlListbox = _ctrlGroup controlsGroupCtrl (100 + _x);\
        _ctrlListbox ctrlshow (_x == _selectedRespawnType);\
    } foreach [0,1,2,3,4,5];\
"

#define UO_FW_RESPAWN_COMBO_ATTR_VALUES \
class Value1: Value0 { idc=101; };\
class Value2: Value0 { idc=102; };\
class Value3: Value0 { idc=103; };\
class Value4: Value0 { idc=104; };\
class Value5: Value0 { idc=105; };\
class Value6: Value0 { idc=106; };\
class Value7: Value0 { idc=107; }

class UO_FW_Respawn_Combo_Blufor: Combo {
    UO_FW_RESPAWN_COMBO_ATTR_LOAD(UO_FW_Respawn_Value_Blufor,UO_FW_Respawn_Combo_Cfg_Blufor);
    UO_FW_RESPAWN_COMBO_ATTR_SAVE(UO_FW_Respawn_Value_Blufor,UO_FW_Respawn_Combo_Cfg_Blufor);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            UO_FW_RESPAWN_COMBO_ONLOAD(UO_FW_Respawn_Value_Blufor,UO_FW_Respawn_Combo_Cfg_Blufor);
            UO_FW_RESPAWN_COMBO_ONLBSELCHANGED(UO_FW_Respawn_Value_Blufor,UO_FW_Respawn_Combo_Cfg_Blufor);
        };
    };
};

class UO_FW_RespawnTemplates_Blufor: Title {
    UO_FW_RESPAWN_TEMPLATES_ATTR_LOAD(UO_FW_Respawn_Value_Blufor);
    UO_FW_RESPAWN_TEMPLATES_ATTR_SAVE;
    h="8 * 5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h="8 * 5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value0: ctrlListbox {
            idc=100;
            show=0;
            x="48 * (pixelW * pixelGrid * 0.50)";
            w="82 * (pixelW * pixelGrid * 0.50)";
            h="8 * 5 * (pixelH * pixelGrid * 0.50)";
            colorSelectBackground[]={0,0,0,0};
            colorSelectBackground2[]={0,0,0,0};
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONLOAD;
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONSETFOCUS(UO_FW_Respawn_Value_Blufor);
        };
        UO_FW_RESPAWN_COMBO_ATTR_VALUES;
    };
};

class UO_FW_Respawn_Combo_Opfor: UO_FW_Respawn_Combo_Blufor {
    UO_FW_RESPAWN_COMBO_ATTR_LOAD(UO_FW_Respawn_Value_Opfor,UO_FW_Respawn_Combo_Cfg_Opfor);
    UO_FW_RESPAWN_COMBO_ATTR_SAVE(UO_FW_Respawn_Value_Opfor,UO_FW_Respawn_Combo_Cfg_Opfor);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            UO_FW_RESPAWN_COMBO_ONLOAD(UO_FW_Respawn_Value_Opfor,UO_FW_Respawn_Combo_Cfg_Opfor);
            UO_FW_RESPAWN_COMBO_ONLBSELCHANGED(UO_FW_Respawn_Value_Opfor,UO_FW_Respawn_Combo_Cfg_Opfor);
        };
    };
};

class UO_FW_RespawnTemplates_Opfor: UO_FW_RespawnTemplates_Blufor {
    UO_FW_RESPAWN_TEMPLATES_ATTR_LOAD(UO_FW_Respawn_Value_Opfor);
    UO_FW_RESPAWN_TEMPLATES_ATTR_SAVE;
    class Controls: Controls {
        class Title: Title {};
        class Value0: Value0 {
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONLOAD;
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONSETFOCUS(UO_FW_Respawn_Value_Opfor);
        };
        UO_FW_RESPAWN_COMBO_ATTR_VALUES;
    };
};

class UO_FW_Respawn_Combo_Indfor: UO_FW_Respawn_Combo_Blufor {
    UO_FW_RESPAWN_COMBO_ATTR_LOAD(UO_FW_Respawn_Value_Indfor,UO_FW_Respawn_Combo_Cfg_Indfor);
    UO_FW_RESPAWN_COMBO_ATTR_SAVE(UO_FW_Respawn_Value_Indfor,UO_FW_Respawn_Combo_Cfg_Indfor);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            UO_FW_RESPAWN_COMBO_ONLOAD(UO_FW_Respawn_Value_Indfor,UO_FW_Respawn_Combo_Cfg_Indfor);
            UO_FW_RESPAWN_COMBO_ONLBSELCHANGED(UO_FW_Respawn_Value_Indfor,UO_FW_Respawn_Combo_Cfg_Indfor);
        };
    };
};

class UO_FW_RespawnTemplates_Indfor: UO_FW_RespawnTemplates_Blufor {
    UO_FW_RESPAWN_TEMPLATES_ATTR_LOAD(UO_FW_Respawn_Value_Indfor);
    UO_FW_RESPAWN_TEMPLATES_ATTR_SAVE;
    class Controls: Controls {
        class Title: Title {};
        class Value0: Value0 {
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONLOAD;
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONSETFOCUS(UO_FW_Respawn_Value_Indfor);
        };
        UO_FW_RESPAWN_COMBO_ATTR_VALUES;
    };
};

class UO_FW_Respawn_Combo_Civ: UO_FW_Respawn_Combo_Blufor {
    UO_FW_RESPAWN_COMBO_ATTR_LOAD(UO_FW_Respawn_Value_Civilian,UO_FW_Respawn_Combo_Cfg_Civilian);
    UO_FW_RESPAWN_COMBO_ATTR_SAVE(UO_FW_Respawn_Value_Civilian,UO_FW_Respawn_Combo_Cfg_Civilian);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            UO_FW_RESPAWN_COMBO_ONLOAD(UO_FW_Respawn_Value_Civilian,UO_FW_Respawn_Combo_Cfg_Civilian);
            UO_FW_RESPAWN_COMBO_ONLBSELCHANGED(UO_FW_Respawn_Value_Civilian,UO_FW_Respawn_Combo_Cfg_Civilian);
        };
    };
};

class UO_FW_RespawnTemplates_Civ: UO_FW_RespawnTemplates_Blufor {
    UO_FW_RESPAWN_TEMPLATES_ATTR_LOAD(UO_FW_Respawn_Value_Civilian);
    UO_FW_RESPAWN_TEMPLATES_ATTR_SAVE;
    class Controls: Controls {
        class Title: Title {};
        class Value0: Value0 {
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONLOAD;
            UO_FW_RESPAWN_TEMPLATES_ATTR_ONSETFOCUS(UO_FW_Respawn_Value_Civilian);
        };
        UO_FW_RESPAWN_COMBO_ATTR_VALUES;
    };
};
