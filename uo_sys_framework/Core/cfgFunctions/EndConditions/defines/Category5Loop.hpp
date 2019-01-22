if (missionNamespace getVariable ["UO_FW_EndCondition_Enabled_5",false]) then {
    if ((isNil "UO_FW_EndCondition_Message_5") || {!(UO_FW_EndCondition_Message_5 isEqualType "STRING")}) then {
        ERROR("invalid message for End Condition Category 5");
    } else {
        LOG("Valid message for End Condition Category 5, executing");

        private _conditionsCountCategory5 = 0;
        if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_5) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_5) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (UO_FW_EndCondition_CasualtyCount_INDFOR_Enabled_5) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (UO_FW_EndCondition_CasualtyCount_CIV_Enabled_5) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};

        if (!(UO_FW_EndCondition_EntitiesAlive_Array_5 isEqualto [])) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (!(UO_FW_EndCondition_EntitiesDead_Array_5 isEqualto [])) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (!(UO_FW_EndCondition_EntitiesDamaged_Array_5 isEqualto [])) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (!(UO_FW_EndCondition_HostageRescued_Array_5 isEqualto [])) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (!(UO_FW_EndCondition_CustomVariables_Array_5 isEqualto [])) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};
        if (!(UO_FW_EndCondition_CaptureZoneCaptured_Array_5 isEqualto [])) then {_conditionsCountCategory5 = _conditionsCountCategory5 + 1;};

        if ((_conditionsCountCategory5) > 0) then {
            LOG_1("Starting Category 5 Condition Count:%1",_conditionsCountCategory5);
            private _endConditionsCategory5PFHhandle = [{
                params ["_argNested", "_idPFH"];
                _argNested params ["_checkFrequency","_lastCheckedTime"];

                private _timeDifference = (CBA_missionTime - _lastCheckedTime);
                if (_timeDifference <= _checkFrequency) exitwith {};
                _argNested set [1,CBA_missionTime];
                private _ConditionCheckList = [];

                //Casualty Checks
                private _BluforCasConditionCheck = false;

                if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_5) then {
                    private _westCasualty = UO_FW_TeamSetting_Blufor_TeamName call UO_FW_fnc_CasualtyPercentage;
                    if (_westCasualty >= UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_5) then {_BluforCasConditionCheck = true;} else {_BluforCasConditionCheck = false;};
                    _ConditionCheckList pushback ["BLUFOR Cas Check",_BluforCasConditionCheck];
                };

                private _OpforCasConditionCheck = false;

                if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_5) then {
                    private _eastCasualty = UO_FW_TeamSetting_Opfor_TeamName call UO_FW_fnc_CasualtyPercentage;
                    if (_eastCasualty >= UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_5) then {_OpforCasConditionCheck = true;} else {_OpforCasConditionCheck = false;};
                    _ConditionCheckList pushback ["OPFOR Cas Check",_OpforCasConditionCheck];
                };

                private _IndforCasConditionCheck = false;

                if (UO_FW_EndCondition_CasualtyCount_INDFOR_Enabled_5) then {
                    private _resCasualty = UO_FW_TeamSetting_Indfor_TeamName call UO_FW_fnc_CasualtyPercentage;
                    if (_resCasualty >= UO_FW_EndCondition_CasualtyCount_INDFOR_Percentage_5) then {_IndforCasConditionCheck = true;} else {_IndforCasConditionCheck = false;};
                    _ConditionCheckList pushback ["INDFOR Cas Check",_IndforCasConditionCheck];
                };

                private _CIVCasConditionCheck = false;

                if (UO_FW_EndCondition_CasualtyCount_CIV_Enabled_5) then {
                    private _civCasualty = UO_FW_TeamSetting_Civ_TeamName call UO_FW_fnc_CasualtyPercentage;
                    if (_civCasualty >= UO_FW_EndCondition_CasualtyCount_CIV_Percentage_5) then {_CIVCasConditionCheck = true;} else {_CIVCasConditionCheck = false;};
                    _ConditionCheckList pushback ["CIVILIAN Cas Check",_CIVCasConditionCheck];
                };

                //alive entity block
                private _aliveUnitArray = missionNamespace getVariable ["UO_FW_EndCondition_EntitiesAlive_Array_5",[]];
                if (!(_aliveUnitArray isEqualto [])) then {
                    LOG_1("Alive Array 1:%1",_aliveUnitArray);
                    private _alive = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if ((_unit isEqualType "OBJECT") && {!(_unit isEqualto objNull)}) then {
                            _alive = _alive && (_unit call UO_FW_fnc_alive);
                        } else {
                            _alive = false;
                            ["Unit " + _x + " not found!","Unit " + _x + " not found!"] call UO_FW_fnc_DebugMessageDetailed;
                        };
                    } forEach _aliveUnitArray;
                    _ConditionCheckList pushback ["Alive Check",_alive];
                };

                //dead entity block
                private _deadUnitArray = missionNamespace getVariable ["UO_FW_EndCondition_EntitiesDead_Array_5",[]];
                if (!(_deadUnitArray isEqualto [])) then {
                    LOG_1("Dead Array 1:%1",_deadUnitArray);
                    private _dead = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if ((_unit isEqualType "OBJECT") && {!(_unit isEqualto objNull)}) then {
                            _dead = _dead && (!(_unit call UO_FW_fnc_alive));
                        } else {
                            _dead = false;
                            LOG_1("Unit %1 not found!",_x);
                        };
                    } forEach _deadUnitArray;
                    _ConditionCheckList pushback ["Dead Check",_dead];
                };

                //damaged & immobilized entity block
                private _damagedUnitArray = missionNamespace getVariable ["UO_FW_EndCondition_EntitiesDamaged_Array_5",[]];
                if (!(_damagedUnitArray isEqualto [])) then {
                    LOG_1("Damaged Array 1:%1",_damagedUnitArray);
                    private _damaged = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if ((_unit isEqualType "OBJECT") && {!(_unit isEqualto objNull)}) then {
                            _damaged = _damaged && ((damage _unit > 0.5) || ((_unit isKindOf LandVehicle) && (!canMove _unit)));
                        } else {
                            _damaged = false;
                            LOG_1("Unit %1 not found!",_x);
                        };
                    } forEach _damagedUnitArray;
                    _ConditionCheckList pushback ["Damaged Check",_damaged];
                };

                //rescued hostage block
                private _hostageRescuedArray = missionNamespace getVariable ["UO_FW_EndCondition_HostageRescued_Array_5",[]];
                if (!(_hostageRescuedArray isEqualto [])) then {
                    LOG_1("Rescued Array 1:%1",_hostageRescuedArray);
                    private _rescued = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if (!(_unit isEqualto objNull) && {(_unit call UO_FW_fnc_alive)}) then {
                            _rescued = _rescued && (_unit call UO_FW_fnc_HostageIsRescued);
                        } else {
                            _rescued = false;
                            LOG_1("Unit %1 not found!",_x);
                        };
                    } forEach _hostageRescuedArray;
                    _ConditionCheckList pushback ["Rescued Check",_rescued];
                };

                //custom variables block
                private _customVariablesArray = missionNamespace getVariable ["UO_FW_EndCondition_CustomVariables_Array_5",[]];
                if (!(_customVariablesArray isEqualto [])) then {
                    LOG_1("Var Array 1:%1",UO_FW_EndCondition_CustomVariables_Array_5);
                    private _custom = true;
                    {
                        if (isNil _x) then {
                            LOG_1("Variable %1 does not exist!",_x);
                            _custom = false;
                        } else {
                            private _Var = missionNamespace getVariable _x;
                            _custom = _custom && _Var;
                            private _checklisttext = format ["Custom Var Check: %1", _x];
                            _ConditionCheckList pushback [_checklisttext,_custom];
                        };
                    } forEach _customVariablesArray;
                };

                private _captureZones_Array_5 = missionNamespace getVariable ["UO_FW_EndCondition_CaptureZoneCaptured_Array_5",[]];
                if (!(_captureZones_Array_5 isEqualto [])) then {
                    private _captureZones_TeamSetting_5 = missionNamespace getVariable ["UO_FW_EndCondition_CaptureZoneCaptured_Team_5",1];
                    {
                        private _CaptureZoneConditionCheck = true;
                        if !(_x in CaptureZone_Array) then {
                            LOG_1("CaptureZone %1 does not exist!",_x);
                            _CaptureZoneConditionCheck = false;
                        } else {
                            private _varName = format ["%1_var",false];
                            private _teamControllingvarName = format ["%1_teamControlling","UNCONTESTED"];

                            switch (_captureZones_TeamSetting_5) do {
                                case 0: {
                                    if ((missionNamespace getVariable [_teamControllingvarName,false]) isEqualto "UNCONTESTED") then {
                                        _CaptureZoneConditionCheck = true;
                                    } else {
                                        _CaptureZoneConditionCheck = false;
                                    };
                                };
                                case 1: {
                                    if ((missionNamespace getVariable [_teamControllingvarName,false]) isEqualto "BLUFOR") then {
                                        _CaptureZoneConditionCheck = true;
                                    } else {
                                        _CaptureZoneConditionCheck = false;
                                    };
                                };
                                case 2: {
                                    if ((missionNamespace getVariable [_teamControllingvarName,false]) isEqualto "OPFOR") then {
                                        _CaptureZoneConditionCheck = true;
                                    } else {
                                        _CaptureZoneConditionCheck = false;
                                    };
                                };
                                case 3: {
                                    if ((missionNamespace getVariable [_teamControllingvarName,false]) isEqualto "INDFOR") then {
                                        _CaptureZoneConditionCheck = true;
                                    } else {
                                        _CaptureZoneConditionCheck = false;
                                    };
                                };
                                case 4: {
                                    if ((missionNamespace getVariable [_teamControllingvarName,false]) isEqualto "CIV") then {
                                        _CaptureZoneConditionCheck = true;
                                    } else {
                                        _CaptureZoneConditionCheck = false;
                                    };
                                };
                                default {_CaptureZoneConditionCheck = false;};
                            };

                            _CaptureZoneConditionCheck = _CaptureZoneConditionCheck && (missionNamespace getVariable [_varName,false]);
                            private _checklisttext = format ["CaptureZoneCheck Check: %1 _var: %2 _team: %3", _x,(missionNamespace getVariable [_varName,false]),(missionNamespace getVariable [_teamControllingvarName,false])];
                            _ConditionCheckList pushback [_checklisttext,_CaptureZoneConditionCheck];
                        };
                    } foreach _captureZones_Array_5;
                };

                LOG_1("Category 5 _ConditionCheckList:%1",_ConditionCheckList);

                private _ExtractionCheck = false;

                //check block
                if (UO_FW_EndCondition_ExtractionEnabled_5) then {
                    private _team = ([UO_FW_TeamSetting_Blufor_TeamName,UO_FW_TeamSetting_Opfor_TeamName,UO_FW_TeamSetting_Indfor_TeamName,UO_FW_TeamSetting_Civ_TeamName] select UO_FW_EndCondition_ExtractionTeam_5);
                    if (UO_FW_EndCondition_ExtractionMarker_5 isEqualto "") exitwith {["","No marker entered for extract zone for Category 5!"] call UO_FW_fnc_DebugMessageDetailed;};
                    if (getMarkerColor UO_FW_EndCondition_ExtractionMarker_5 isEqualto "") exitwith {["","Invalid extract marker for Category 5!"] call UO_FW_fnc_DebugMessageDetailed;};
                        if ([_team,UO_FW_EndCondition_ExtractionMarker_5,UO_FW_EndCondition_ExtractionRatio_5] call UO_FW_fnc_hasExtracted) then {
                            _ExtractionCheck = true;
                        } else {
                            _ExtractionCheck = false;
                        };
                } else {
                    _ExtractionCheck = true;
                };

                if (_ExtractionCheck) then {
                    if (UO_FW_EndCondition_Mode_5 isEqualto 1) then {
                        {
                            _x params ["_name","_value"];
                            if (_value) exitwith {
                                LOG_1("Category 5 Ending due to :%1",_value);
                                UO_FW_EndCondition_Message_5 call UO_FW_fnc_EndMission;
                                [_idPFH] call CBA_fnc_removePerFrameHandler;
                            };
                        } foreach _ConditionCheckList;
                    } else {
                        private _fullcheck = true;
                        {
                            _x params ["_name","_value"];
                            _fullcheck = _fullcheck && _value;
                            LOG_2("Category 5 checking var:%1 result:%2",_name,_value);
                        } foreach _ConditionCheckList;
                        if (_fullcheck) then {
                            LOG("Category 5 Ending due to all conditions met!");
                            UO_FW_EndCondition_Message_5 call UO_FW_fnc_EndMission;
                            [_idPFH] call CBA_fnc_removePerFrameHandler;
                        };
                    };
                };
            }, 60, [(missionNamespace getvariable ["UO_FW_ConditionSleep",30]),CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
        } else {
            ERROR("No Conditions for Category 5");
        };
    };
};
