class UO_FW_CheckBoxAIOnlyCategory: CheckBox
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};

class UO_FW_CheckBoxStateAIOnlyCategory: CheckBoxState
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};

class UO_FW_CheckboxNumberAIOnlyCategory: Edit
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};

class UO_FW_CheckboxReversedAIOnlyCategory: Edit
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};

class UO_FW_EditAIOnlyCategory: Edit
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};

class UO_FW_EditShortAIOnlyCategory: Edit
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};

class UO_FW_EditArrayAIOnlyCategory: Edit
{
	onLoad="\
	diag_log 'onload triggered';\
	_this spawn {\
		 disableserialization;\
		 private ['_isUnitPlayable'];\
		 private _ctrl = _this select 0;\
		 private _unit = ((get3denselected 'object') select 0);\
		 private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
		{\
			if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
				if !(isNull player) then {\
					 _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
				} else {\
					 _isUnitPlayable = (_unit in playableUnits);\
				};\
				_state = [true,false] select (_isUnitPlayable);\
				_fade = [0.75,0] select _state;\
				_x ctrlenable _state;\
				_x ctrlsetfade _fade;\
				_x ctrlshow _state;\
				_x ctrlcommit 0;\
				ctrlsetfocus _x;\
				ctrlsetfocus _ctrl;\
			};\
		} foreach (allcontrols (ctrlparent _ctrl));\
	};\
	";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: Value {};
	};
};
