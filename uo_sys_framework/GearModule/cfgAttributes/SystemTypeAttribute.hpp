class EGVAR(Gear,SystemType): Combo {
    attributeSave = "\
        private _value = (_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100);\
        _unit setvariable ['UO_FW_Gear_UnitSystemType',_value];\
        _value\
    ";
    attributeLoad ="\
        private _unit = ((get3denselected 'object') select 0);\
        private _ctrlCombo = (_this controlsGroupCtrl 100);\
        private _n = 0;\
        private _gearSystem = _value;\
        _unit setvariable ['UO_FW_Gear_UnitSystemType',_GearSystem];\
        private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
        private _gearSystemTypes = [['None','NONE'],['ACE Arsenal','ACEAR'],['Olsen','OLSEN']];\
        {\
            _x params ['_name','_string'];\
            private _index = _ctrlCombo lbadd _name;\
            _ctrlCombo lbsetdata [_index,_string];\
            _ctrlCombo lbsetValue [_index,_forEachIndex];\
            if (_value isEqualto (_ctrlCombo lbData _index)) then {\
                _ctrlCombo lbSetCurSel _index;\
            };\
        } foreach _gearSystemTypes;\
        private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Gear' >> 'Attributes',0] call BIS_fnc_returnChildren;\
        {\
             if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                private _cfg = _cfgAttributes select _n;\
                _n = _n + 1;\
                private _state = true;\
                if (isArray(_cfg >> 'GearSystems')) then {\
                     _GearSystems = getarray (_cfg >> 'GearSystems');\
                    if !(_gearSystem in _GearSystems) then {\
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
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged="\
                private _ctrlCombo = _this select 0;\
                private _cursel = _this select 1;\
                private _GearSystem = _ctrlCombo lbData _cursel;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['UO_FW_Gear_UnitSystemType',_GearSystem];\
                private _n = 0;\
                private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
                private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Gear' >> 'Attributes',0] call BIS_fnc_returnChildren;\
                {\
                    if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                        private _cfg = _cfgAttributes select _n;\
                        _n = _n + 1;\
                        private _state = true;\
                        if (isArray(_cfg >> 'GearSystems')) then {\
                             _GearSystems = getarray (_cfg >> 'GearSystems');\
                            if !(_gearSystem in _GearSystems) then {\
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

class EGVAR(Gear,SystemTypeVehicle): Combo {
    attributeSave = "\
        private _value = (_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100);\
        _unit setvariable ['UO_FW_Gear_UnitSystemType',_value];\
        _value\
    ";
    attributeLoad ="\
        private _unit = ((get3denselected 'object') select 0);\
        private _ctrlCombo = (_this controlsGroupCtrl 100);\
        private _n = 0;\
        private _gearSystem = _value;\
        _unit setvariable ['UO_FW_Gear_UnitSystemType',_GearSystem];\
        private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
        private _gearSystemTypes = [['None','NONE'],['Olsen','OLSEN']];\
        {\
            _x params ['_name','_string'];\
            private _index = _ctrlCombo lbadd _name;\
            _ctrlCombo lbsetdata [_index,_string];\
            _ctrlCombo lbsetValue [_index,_forEachIndex];\
            if (_value isEqualto (_ctrlCombo lbData _index)) then {\
                _ctrlCombo lbSetCurSel _index;\
            };\
        } foreach _gearSystemTypes;\
        private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Gear' >> 'Attributes',0] call BIS_fnc_returnChildren;\
        {\
             if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                private _cfg = _cfgAttributes select _n;\
                _n = _n + 1;\
                private _state = true;\
                if (isArray(_cfg >> 'GearSystems')) then {\
                    _GearSystems = getarray (_cfg >> 'GearSystems');\
                    if !(_gearSystem in _GearSystems) then {\
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
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged="\
                private _ctrlCombo = _this select 0;\
                private _cursel = _this select 1;\
                private _GearSystem = _ctrlCombo lbData _cursel;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['UO_FW_Gear_UnitSystemType',_GearSystem];\
                private _n = 0;\
                private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;\
                private _cfgAttributes = [configFile >> 'Cfg3den' >> 'Object' >> 'AttributeCategories' >> 'UO_FW_Gear' >> 'Attributes',0] call BIS_fnc_returnChildren;\
                {\
                    if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                        private _cfg = _cfgAttributes select _n;\
                        _n = _n + 1;\
                        private _state = true;\
                        if (isArray(_cfg >> 'GearSystems')) then {\
                             _GearSystems = getarray (_cfg >> 'GearSystems');\
                            if !(_gearSystem in _GearSystems) then {\
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
