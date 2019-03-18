class EGVAR(AOLimit,AOModeAttribute): Combo {
    attributeLoad ="\
        private _logic = ((get3denselected 'logic') select 0);\
        private _cfgname = gettext (_config >> 'property');\
        _logic setvariable [_cfgname,_value];\
        private _ctrlCombo = (_this controlsGroupCtrl 100);\
        _ctrlCombo setvariable ['parentcontrolcfg',_config];\
        private _ctrlGroup = ctrlParentControlsGroup _ctrlCombo;\
        private _AOSystemTypes = [['Hard','HARD'],['Soft','SOFT']];\
        {\
            _x params ['_name','_string'];\
            private _index = _ctrlCombo lbadd _name;\
            _ctrlCombo lbsetdata [_index,_string];\
            if (_value isEqualto (_ctrlCombo lbData _index)) then {\
                _ctrlCombo lbSetCurSel _index;\
                diag_log format ['_ctrlCombo lbSetCurSel: %1',_index];\
                diag_log format ['_ctrlCombo lbSetCurSel _value: %1',_value];\
                private _AOType = _value;\
                diag_log format ['_respawnSystem: %1',_respawnSystem];\
                private _configH = configHierarchy _config;\
                diag_log format ['_configH: %1',_configH];\
                private _configHParent = _configH select ((count _configH) - 2);\
                diag_log format ['_configHParent: %1',_configHParent];\
                private _cfgAttributes = [_configHParent,1] call BIS_fnc_returnChildren;\
                diag_log format ['_cfgAttributes: %1',_cfgAttributes];\
                private _n = 0;\
                {\
                    if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                        private _cfg = _cfgAttributes select _n;\
                        diag_log format ['_cfg: %1',_cfg];\
                        _n = _n + 1;\
                        diag_log format ['_n: %1',_n];\
                        private _state = true;\
                        if (isArray(_cfg >> 'AOTypes')) then {\
                            _AOTypes = getarray (_cfg >> 'AOTypes');\
                            diag_log format ['_AOTypes: %1',_AOTypes];\
                            if !(_AOType in _AOTypes) then {\
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
            };\
        } foreach _AOSystemTypes;\
    ";
    attributeSave = "\
        private _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        private _cfgname = gettext (_config >> 'property');\
        private _logic = ((get3denselected 'logic') select 0);\
        _logic setvariable [_cfgname,_value];\
        _value\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged="\
                private _ctrlCombo = _this select 0;\
                private _cursel = _this select 1;\
                private _AOType = _ctrlCombo lbData _cursel;\
                private _logic = ((get3denselected 'logic') select 0);\
                private _logicType = typeOf _logic;\
                private _cfgAttributes = [configFile >> 'CfgVehicles' >> _logicType >> 'Attributes',0] call BIS_fnc_returnChildren;\
                private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
                private _n = 0;\
                {\
                    if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                        private _cfg = _cfgAttributes select _n;\
                        _n = _n + 1;\
                        private _state = true;\
                        if (isArray(_cfg >> 'AOTypes')) then {\
                             _AOTypes = getarray (_cfg >> 'AOTypes');\
                            if !(_AOType in _AOTypes) then {\
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
            ";
        };
    };
};
