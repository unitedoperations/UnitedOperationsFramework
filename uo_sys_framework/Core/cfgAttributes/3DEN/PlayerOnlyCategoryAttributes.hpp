class EGVAR(Core,CheckBoxPlayerOnlyCategory): CheckBox {
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class EGVAR(Core,CheckBoxStatePlayerOnlyCategory): CheckBoxState {
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class EGVAR(Core,CheckboxNumberPlayerOnlyCategory): Edit {
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class EGVAR(Core,CheckboxReversedPlayerOnlyCategory): Edit {
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class EGVAR(Core,EditPlayerOnlyCategory): Edit {
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class EGVAR(3DEN,EditShortPlayerOnlyCategory): Edit
{
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class EGVAR(Core,EditArrayPlayerOnlyCategory): Edit
{
    onLoad="\
    private ['_isUnitPlayable'];\
    private _unit = ((get3denselected 'object') select 0);\
    private _ctrl = _this select 0;\
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
    {\
        if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
            if !(isNull player) then {\
                 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
            } else {\
                 _isUnitPlayable = (_unit in playableUnits);\
            };\
            _state = [false,true] select (_isUnitPlayable);\
            _fade = [0.75,0] select _state;\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlshow _state;\
            _x ctrlcommit 0;\
            ctrlsetfocus _x;\
            ctrlsetfocus _ctrl;\
        };\
    } foreach (allcontrols (ctrlparent _ctrl));\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};
