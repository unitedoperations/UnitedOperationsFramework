class UO_FW_Gear_ComboGearLoad: ComboPreview {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        private _unit = ((get3denselected 'object') select 0);\
        _unit setvariable ['UO_FW_Gear_UnitClass',_value,true];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        _control setvariable ['UO_FW_parentcontrolcfg',_config];\
        _classArray = [['None','NONE'],['Rifleman','RFL'],['Rifleman AT','RFLAT'],['Automatic Rifleman','AR'],['Grenadier','GRN'],['Team Leader','TL'],['Squad Leader','SQL'],['Anti Tank','AT'],['Assistant Anti Tank','AAT'],['Machinegunner','MGA'],['Assistant Machinegunner','AMG'],['Vehicle Crewman','VCRW'],['Vehicle Commander','VCMD'],['Medic','MED'],['Marksman','MKS'],['Officer','OFF'],['RATELO','RTO'],['FAC','FAC'],['Custom 1','CUS1'],['Custom 2','CUS2'],['Custom 3','CUS3'],['Custom 4','CUS4'],['Custom 5','CUS5'],['Manual Define','MANUAL']];\
        {\
            _x params ['_name','_className'];\
            private _index = _control lbadd _name;\
            _control lbsetdata [_index,_className];\
            _control lbsetValue [_index,_foreachIndex];\
            if (_value isEqualto (_control lbData _index)) then {\
                _control lbSetCurSel _index;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['UO_FW_Gear_UnitClass',_value,true];\
            };\
        } foreach _classArray;\
    ";
    class Controls: Controls
    {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged="\
                _ctrlCombo = _this select 0;\
                _cursel = _this select 1;\
                _value = _control lbData _cursel;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['UO_FW_Gear_UnitClass',_value,true];\
            ";
        };
        class Preview: Preview
        {
            idc=101;
            onMouseButtonClick="\
                _ctrlButton = _this select 0;\
                _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                _unit = ((get3denselected 'object') select 0);\
                _GearSystem = _unit getvariable ['UO_FW_3DENATTR_GearSystem','NONE'];\
                if ((_GearSystem isEqualto 'ACEAR') || (_GearSystem isEqualto 'OLSEN')) then {\
                    [(_ctrlCombo lbData lbcursel _ctrlCombo),_unit,_GearSystem] call UO_FW_fnc_GearTypeLoadfromAttribute;\
                };\
            ";
        };
    };
};
