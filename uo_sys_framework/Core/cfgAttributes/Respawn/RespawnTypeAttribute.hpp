#define RESPAWNCOMBO_ATTR_LOAD(VALUEVAR,CFGVAR) \
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

#define RESPAWNCOMBO_ATTR_SAVE(VALUEVAR,CFGVAR) \
attributeSave = "\
    private _ctrlCombo = (_this controlsGroupCtrl 100);\
    private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);\
    missionNamespace setvariable ['##VALUEVAR##',_value];\
    missionNamespace setvariable ['##CFGVAR##',_config];\
    _value\
"

#define RESPAWNCOMBO_ONLOAD(VALUEVAR,CFGVAR) \
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

#define RESPAWNCOMBO_ONLBSELCHANGED(VALUEVAR,CFGVAR) \
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

#define RESPAWNTEMPLATES_ATTR_LOAD(VALUEVAR) \
attributeLoad = QUOTE([ARR_3(_this,_value,VALUEVAR)] call EFUNC(Respawn,respawntemplates_attr_load))

#define RESPAWNTEMPLATES_ATTR_SAVE \
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

#define RESPAWNTEMPLATES_ATTR_ONLOAD \
onLBSelChanged = "\
    _ctrlListbox = _this select 0;\
    _cursel = _this select 1;\
    _active = _ctrlListbox lbvalue _cursel;\
    _active = (_active + 1) / 2;\
    _pictureChecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureChecked');\
    _pictureUnchecked = gettext (configfile >> 'ctrlCheckbox' >> 'textureUnchecked');\
    _ctrlListbox lbsetvalue [_cursel,_active];\
    _ctrlListbox lbsetpicture [_cursel,[_pictureUnchecked,_pictureChecked] select _active];\
"

#define RESPAWNTEMPLATES_ATTR_ONSETFOCUS(VALUEVAR) \
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

#define RESPAWNCOMBO_ATTR_VALUES \
class Value1: Value0 { idc=101; };\
class Value2: Value0 { idc=102; };\
class Value3: Value0 { idc=103; };\
class Value4: Value0 { idc=104; };\
class Value5: Value0 { idc=105; };\
class Value6: Value0 { idc=106; };\
class Value7: Value0 { idc=107; }

class EGVAR(Respawn,Combo_Blufor): Combo {
    RESPAWNCOMBO_ATTR_LOAD(EGVAR(Respawn,Value_Blufor),RESPAWNCOMBO_Cfg_Blufor);
    RESPAWNCOMBO_ATTR_SAVE(EGVAR(Respawn,Value_Blufor),RESPAWNCOMBO_Cfg_Blufor);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            RESPAWNCOMBO_ONLOAD(EGVAR(Respawn,Value_Blufor),RESPAWNCOMBO_Cfg_Blufor);
            RESPAWNCOMBO_ONLBSELCHANGED(EGVAR(Respawn,Value_Blufor),RESPAWNCOMBO_Cfg_Blufor);
        };
    };
};

class EGVAR(Respawn,Templates_Blufor): Title {
    RESPAWNTEMPLATES_ATTR_LOAD(EGVAR(Respawn,Value_Blufor));
    RESPAWNTEMPLATES_ATTR_SAVE;
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
            RESPAWNTEMPLATES_ATTR_ONLOAD;
            RESPAWNTEMPLATES_ATTR_ONSETFOCUS(EGVAR(Respawn,Value_Blufor));
        };
        RESPAWNCOMBO_ATTR_VALUES;
    };
};

class EGVAR(Respawn,Combo_Opfor): EGVAR(Respawn,Combo_Blufor) {
    RESPAWNCOMBO_ATTR_LOAD(EGVAR(Respawn,Value_Opfor),RESPAWNCOMBO_Cfg_Opfor);
    RESPAWNCOMBO_ATTR_SAVE(EGVAR(Respawn,Value_Opfor),RESPAWNCOMBO_Cfg_Opfor);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            RESPAWNCOMBO_ONLOAD(EGVAR(Respawn,Value_Opfor),RESPAWNCOMBO_Cfg_Opfor);
            RESPAWNCOMBO_ONLBSELCHANGED(EGVAR(Respawn,Value_Opfor),RESPAWNCOMBO_Cfg_Opfor);
        };
    };
};

class EGVAR(Respawn,Templates_Opfor): EGVAR(Respawn,Templates_Blufor) {
    RESPAWNTEMPLATES_ATTR_LOAD(EGVAR(Respawn,Value_Opfor));
    RESPAWNTEMPLATES_ATTR_SAVE;
    class Controls: Controls {
        class Title: Title {};
        class Value0: Value0 {
            RESPAWNTEMPLATES_ATTR_ONLOAD;
            RESPAWNTEMPLATES_ATTR_ONSETFOCUS(EGVAR(Respawn,Value_Opfor));
        };
        RESPAWNCOMBO_ATTR_VALUES;
    };
};

class EGVAR(Respawn,Combo_Indfor): EGVAR(Respawn,Combo_Blufor) {
    RESPAWNCOMBO_ATTR_LOAD(EGVAR(Respawn,Value_Indfor),RESPAWNCOMBO_Cfg_Indfor);
    RESPAWNCOMBO_ATTR_SAVE(EGVAR(Respawn,Value_Indfor),RESPAWNCOMBO_Cfg_Indfor);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            RESPAWNCOMBO_ONLOAD(EGVAR(Respawn,Value_Indfor),RESPAWNCOMBO_Cfg_Indfor);
            RESPAWNCOMBO_ONLBSELCHANGED(EGVAR(Respawn,Value_Indfor),RESPAWNCOMBO_Cfg_Indfor);
        };
    };
};

class EGVAR(Respawn,Templates_Indfor): EGVAR(Respawn,Templates_Blufor) {
    RESPAWNTEMPLATES_ATTR_LOAD(EGVAR(Respawn,Value_Indfor));
    RESPAWNTEMPLATES_ATTR_SAVE;
    class Controls: Controls {
        class Title: Title {};
        class Value0: Value0 {
            RESPAWNTEMPLATES_ATTR_ONLOAD;
            RESPAWNTEMPLATES_ATTR_ONSETFOCUS(EGVAR(Respawn,Value_Indfor));
        };
        RESPAWNCOMBO_ATTR_VALUES;
    };
};

class EGVAR(Respawn,Combo_Civ): EGVAR(Respawn,Combo_Blufor) {
    RESPAWNCOMBO_ATTR_LOAD(EGVAR(Respawn,Value_Civ),RESPAWNCOMBO_Cfg_Civ);
    RESPAWNCOMBO_ATTR_SAVE(EGVAR(Respawn,Value_Civ),RESPAWNCOMBO_Cfg_Civ);
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            RESPAWNCOMBO_ONLOAD(EGVAR(Respawn,Value_Civ),RESPAWNCOMBO_Cfg_Civ);
            RESPAWNCOMBO_ONLBSELCHANGED(EGVAR(Respawn,Value_Civ),RESPAWNCOMBO_Cfg_Civ);
        };
    };
};

class EGVAR(Respawn,Templates_Civ): EGVAR(Respawn,Templates_Blufor) {
    RESPAWNTEMPLATES_ATTR_LOAD(EGVAR(Respawn,Value_Civ));
    RESPAWNTEMPLATES_ATTR_SAVE;
    class Controls: Controls {
        class Title: Title {};
        class Value0: Value0 {
            RESPAWNTEMPLATES_ATTR_ONLOAD;
            RESPAWNTEMPLATES_ATTR_ONSETFOCUS(EGVAR(Respawn,Value_Civ));
        };
        RESPAWNCOMBO_ATTR_VALUES;
    };
};
