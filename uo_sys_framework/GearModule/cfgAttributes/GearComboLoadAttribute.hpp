class UO_FW_Gear_ComboGearLoad: ComboPreview {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        private _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        private _unit = ((get3denselected 'object') select 0);\
        _unit setvariable ['UO_FW_Gear_UnitGearType',_value];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        _control setvariable ['UO_FW_parentcontrolcfg',_config];\
        _classArray = [\
            ['None','NONE'],\
            ['Squad Leader','SQL'],\
            ['Team Leader','TL'],\
            ['Rifleman','RFL'],\
            ['Rifleman AT','RFLAT'],\
            ['Automatic Rifleman','AR'],\
            ['Grenadier','GRN'],\
            ['Vehicle Crewman','VCRW'],\
            ['Vehicle Commander','VCMD'],\
            ['Officer','OFF'],\
            ['2IC','TWOIC'],\
            ['Medic','MED'],\
            ['Anti Tank','AT'],\
            ['Assistant Anti Tank','AAT'],\
            ['Machinegunner','MG'],\
            ['Assistant Machinegunner','AMG'],\
            ['Marksman','MKS'],\
            ['RATELO','RTO'],\
            ['FAC','FAC'],\
            ['FO','FO'],\
            ['Engineer','ENG'],\
            ['EOD','EOD'],\
            ['Heavy Anti Tank','HAT'],\
            ['Assistant Heavy Anti Tank','AHAT'],\
            ['Mortar Team Leader','MORTL'],\
            ['Mortar Crewman','MOR'],\
            ['Pilot','APLT'],\
            ['Air Crewman','ACRW'],\
            ['Custom 1','CUS1'],\
            ['Custom 2','CUS2'],\
            ['Custom 3','CUS3'],\
            ['Custom 4','CUS4'],\
            ['Custom 5','CUS5'],\
            ['Manual','MANUAL']\
        ];\
        {\
            _x params ['_name','_className'];\
            private _index = _control lbadd _name;\
            _control lbsetdata [_index,_className];\
            _control lbsetValue [_index,_foreachIndex];\
            if (_value isEqualto (_control lbData _index)) then {\
                _control lbSetCurSel _index;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['UO_FW_Gear_UnitGearType',_value];\
            };\
        } foreach _classArray;\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged="\
                private _ctrlCombo = _this select 0;\
                private _cursel = _this select 1;\
                private _value = _control lbData _cursel;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['UO_FW_Gear_UnitGearType',_value];\
            ";
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick="\
                private _ctrlButton = _this select 0;\
                private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                private _value = _ctrlCombo lbData _cursel;\
                private _unit = ((get3denselected 'object') select 0);\
                private _GearSystem = _unit getvariable ['UO_FW_Gear_UnitGearType','NONE'];\
                private _UnitClass = _unit getvariable ['UO_FW_Gear_UnitSystemType','NONE'];\
                if (!(_GearSystem isEqualto 'NONE') || !(_UnitClass isEqualto 'NONE')) then {\
                    [_unit,_GearSystem,_UnitClass] call UO_FW_fnc_GearTypeLoad3DEN;\
                };\
            ";
        };
    };
};
