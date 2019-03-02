if (GETMVAR(Enabled_6,false)) then {
    if ((isNil "GVAR(Message_6)") || {!(GVAR(Message_6) isEqualType "STRING")}) then {
        ERROR("invalid message for End Condition Category 6");
    } else {
        LOG("Valid message for End Condition Category 6, executing");

        private _conditionsCountCategory6 = 0;
        if (GETMVAR(CasualtyCount_BLUFOR_6,false)) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (GETMVAR(CasualtyCount_OPFOR_6,false)) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (GETMVAR(CasualtyCount_INDFOR_6,false)) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (GETMVAR(CasualtyCount_CIV_6,false)) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};

        if (!(GETMVAR(EntitiesAlive_Array_6,[]) isEqualto [])) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (!(GETMVAR(EntitiesDead_Array_6,[]) isEqualto [])) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (!(GETMVAR(EntitiesDamaged_Array_6,[]) isEqualto [])) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (!(GETMVAR(HostageRescued_Array_6,[]) isEqualto [])) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (!(GETMVAR(CustomVariables_Array_6,[]) isEqualto [])) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};
        if (!(GETMVAR(CaptureZoneCaptured_Array_6,[]) isEqualto [])) then {_conditionsCountCategory6 = _conditionsCountCategory6 + 1;};

        if ((_conditionsCountCategory6) > 0) then {
            LOG_1("Starting Category 6 Condition Count:%1",_conditionsCountCategory6);
            private _endConditionsCategory6PFHhandle = [{
                params ["_argNested", "_idPFH"];
                _argNested params ["_checkFrequency","_lastCheckedTime"];

                private _timeDifference = (CBA_missionTime - _lastCheckedTime);
                if (_timeDifference <= _checkFrequency) exitwith {};
                _argNested set [1,CBA_missionTime];
                private _ConditionCheckList = [];

                //Casualty Checks
                private _BluforCasConditionCheck = false;

                if (GETMVAR(CasualtyCount_BLUFOR_6,false)) then {
                    private _westCasualty = EGVAR(Core,TeamName_Blufor) call EFUNC(Core,CasualtyPercentage);
                    if (_westCasualty >= GETMVAR(CasualtyCount_BLUFOR_Percentage_6,75)) then {_BluforCasConditionCheck = true;} else {_BluforCasConditionCheck = false;};
                    _ConditionCheckList pushback ["BLUFOR Cas Check",_BluforCasConditionCheck];
                };

                private _OpforCasConditionCheck = false;

                if (GETMVAR(CasualtyCount_OPFOR_6,false)) then {
                    private _eastCasualty = EGVAR(Core,TeamName_Opfor) call EFUNC(Core,CasualtyPercentage);
                    if (_eastCasualty >= GETMVAR(CasualtyCount_OPFOR_Percentage_6,75)) then {_OpforCasConditionCheck = true;} else {_OpforCasConditionCheck = false;};
                    _ConditionCheckList pushback ["OPFOR Cas Check",_OpforCasConditionCheck];
                };

                private _IndforCasConditionCheck = false;

                if (GETMVAR(CasualtyCount_INDFOR_6,false)) then {
                    private _resCasualty = EGVAR(Core,TeamName_Indfor) call EFUNC(Core,CasualtyPercentage);
                    if (_resCasualty >= GETMVAR(CasualtyCount_INDFOR_Percentage_6,75)) then {_IndforCasConditionCheck = true;} else {_IndforCasConditionCheck = false;};
                    _ConditionCheckList pushback ["INDFOR Cas Check",_IndforCasConditionCheck];
                };

                private _CIVCasConditionCheck = false;

                if (GETMVAR(CasualtyCount_CIV_6,false)) then {
                    private _civCasualty = EGVAR(Core,TeamName_Civilian) call EFUNC(Core,CasualtyPercentage);
                    if (_civCasualty >= GETMVAR(CasualtyCount_CIV_Percentage_6,75)) then {_CIVCasConditionCheck = true;} else {_CIVCasConditionCheck = false;};
                    _ConditionCheckList pushback ["CIVILIAN Cas Check",_CIVCasConditionCheck];
                };

                //alive entity block
                private _aliveUnitArray = GETMVAR(EntitiesAlive_Array_6,[]);
                if (!(_aliveUnitArray isEqualto [])) then {
                    LOG_1("Alive Array 1:%1",_aliveUnitArray);
                    private _alive = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if ((_unit isEqualType "OBJECT") && {!(_unit isEqualto objNull)}) then {
                            _alive = _alive && {(_unit call EFUNC(Core,alive))};
                        } else {
                            _alive = false;
                            ["Unit " + _x + " not found!","Unit " + _x + " not found!"] call EFUNC(Core,DebugMessageDetailed);
                        };
                    } forEach _aliveUnitArray;
                    _ConditionCheckList pushback ["Alive Check",_alive];
                };

                //dead entity block
                private _deadUnitArray = GETMVAR(EntitiesDead_Array_6,[]);
                if (!(_deadUnitArray isEqualto [])) then {
                    LOG_1("Dead Array 1:%1",_deadUnitArray);
                    private _dead = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if ((_unit isEqualType "OBJECT") && {!(_unit isEqualto objNull)}) then {
                            _dead = _dead && (!(_unit call EFUNC(Core,alive)));
                        } else {
                            _dead = false;
                            LOG_1("Unit %1 not found!",_x);
                        };
                    } forEach _deadUnitArray;
                    _ConditionCheckList pushback ["Dead Check",_dead];
                };

                //damaged & immobilized entity block
                private _damagedUnitArray = GETMVAR(EntitiesDamaged_Array_6,[]);
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
                private _hostageRescuedArray = GETMVAR(HostageRescued_Array_6,[]);
                if (!(_hostageRescuedArray isEqualto [])) then {
                    LOG_1("Rescued Array 1:%1",_hostageRescuedArray);
                    private _rescued = true;
                    {
                        private _unit = missionNamespace getVariable [_x,objNull];
                        if (!(_unit isEqualto objNull) && {(_unit call EFUNC(Core,alive))}) then {
                            _rescued = _rescued && (_unit call EFUNC(Hostage,IsRescued));
                        } else {
                            _rescued = false;
                            LOG_1("Unit %1 not found!",_x);
                        };
                    } forEach _hostageRescuedArray;
                    _ConditionCheckList pushback ["Rescued Check",_rescued];
                };

                //custom variables block
                private _customVariablesArray = GETMVAR(CustomVariables_Array_6,[]);
                if (!(_customVariablesArray isEqualto [])) then {
                    LOG_1("Var Array 1:%1",GETMVAR(CustomVariables_6,[]));
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

                private _captureZones_Array_6 = GETMVAR(CaptureZoneCaptured_Array_6,[]);
                if (!(_captureZones_Array_6 isEqualto [])) then {
                    private _captureZones_TeamSetting_6 = GETMVAR(CaptureZoneCaptured_Team_6,1);
                    {
                        private _CaptureZoneConditionCheck = true;
                        if !(_x in EGVAR(CaptureZone,ListArray)) then {
                            LOG_1("CaptureZone %1 does not exist!",_x);
                            _CaptureZoneConditionCheck = false;
                        } else {
                            private _varName = format ["%1_var",false];
                            private _teamControllingvarName = format ["%1_teamControlling","UNCONTESTED"];

                            switch (_captureZones_TeamSetting_6) do {
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
                                    if ((missionNamespace getVariable [_teamControllingvarName,false]) isEqualto "CIVILIAN") then {
                                        _CaptureZoneConditionCheck = true;
                                    } else {
                                        _CaptureZoneConditionCheck = false;
                                    };
                                };
                                default {_CaptureZoneConditionCheck = false;};
                            };

                            _CaptureZoneConditionCheck = _CaptureZoneConditionCheck && {(missionNamespace getVariable [_varName,false])};
                            private _checklisttext = format ["CaptureZoneCheck Check: %1 _var: %2 _team: %3", _x,(missionNamespace getVariable [_varName,false]),(missionNamespace getVariable [_teamControllingvarName,false])];
                            _ConditionCheckList pushback [_checklisttext,_CaptureZoneConditionCheck];
                        };
                    } foreach _captureZones_Array_6;
                };

                LOG_1("Category 6 _ConditionCheckList:%1",_ConditionCheckList);

                private _ExtractionCheck = false;

                //check block
                if (GETMVAR(ExtractionEnabled_6,false)) then {
                    private _team = ([EGVAR(Core,TeamName_Blufor),EGVAR(Core,TeamName_Opfor),EGVAR(Core,TeamName_Indfor),EGVAR(Core,TeamName_Civilian)] select GVAR(ExtractionTeam_6));
                    if (GVAR(ExtractionMarker_6) isEqualto "") exitwith {["","No marker entered for extract zone for Category 6!"] call EFUNC(Core,DebugMessageDetailed);};
                    if ((getMarkerColor GVAR(ExtractionMarker_6)) isEqualto "") exitwith {["","Invalid extract marker for Category 6!"] call EFUNC(Core,DebugMessageDetailed);};
                        if ([_team,GVAR(ExtractionMarker_6),GVAR(ExtractionRatio_6)] call FUNC(hasExtracted)) then {
                            _ExtractionCheck = true;
                        } else {
                            _ExtractionCheck = false;
                        };
                } else {
                    _ExtractionCheck = true;
                };

                if (_ExtractionCheck) then {
                    if (GVAR(Mode_6) isEqualto 1) then {
                        {
                            _x params ["_name","_value"];
                            if (_value) exitwith {
                                LOG_1("Category 6 Ending due to :%1",_value);
                                GVAR(Message_6) call EFUNC(Core,EndMission);
                                [_idPFH] call CBA_fnc_removePerFrameHandler;
                            };
                        } foreach _ConditionCheckList;
                    } else {
                        private _fullcheck = true;
                        {
                            _x params ["_name","_value"];
                            _fullcheck = _fullcheck && _value;
                            LOG_2("Category 6 checking var:%1 result:%2",_name,_value);
                        } foreach _ConditionCheckList;
                        if (_fullcheck) then {
                            LOG("Category 6 Ending due to all conditions met!");
                            GVAR(Message_6) call EFUNC(Core,EndMission);
                            [_idPFH] call CBA_fnc_removePerFrameHandler;
                        };
                    };
                };
            }, 60, [(GETMVAR(ConditionSleep,30)),CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
        } else {
            ERROR("No Conditions for Category 6");
        };
    };
};
