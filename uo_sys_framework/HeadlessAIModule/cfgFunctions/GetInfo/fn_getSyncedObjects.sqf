/*    Description: Gets synced units, vehicles and objects to a module.
 *    Arguments:
 *         ARRAY    - Module (name, _logic)
 *    Return Value:
 *         ARRAY     - Entities linked to object
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_logic",["_entities",[[], [], []],[[]]],["_vehLog",[],[[]]]];
// Get all Synced units/objects to module (excludes other modules)
private _synced = [_logic] call EFUNC(AI,getSynced);
{
    private _obj =  _x;
    if (!(_obj isKindOf "Logic")) then {
        if (_obj isKindOf "Thing") then {
            (_entities select 2) pushback ([_obj] call EFUNC(AI,getDetailsThing));
        };
        if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static" || _obj isKindOf "Air" || _obj isKindOf "Ship" || _obj isKindOf "LandVehicle") then {
            private _grp = if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static") then {group (gunner _obj)} else {group (driver _obj)};
            if (isNull _grp) then {
                (_entities select 1) pushback ([_obj] call EFUNC(AI,getDetailsVehicleEmpty));
            };
        };
        if (_obj isKindOf "Man") then {
            private _grp = (group _obj);
            private _grpldr = (leader _grp);
            if (_grpldr isEqualTo _obj) then {
                private _grpPos = getposATL _grpldr;
                private _units = units _grp;
                private _group = [str _grp,[],[]];
                private _gx = _grp getVariable ['UO_FW_AI_multiplier',1];
                private _grpPosArray = [];
                private _grpPosNew = _grpPos;
                if (_grp getVariable ['UO_FW_AI_createRadius',0] > 1) then {
                    _grpPosArray = [_grpPos,0,(_grp getVariable 'UO_FW_AI_createRadius'),(_gx*5)] call EFUNC(AI,getRandomPositionCircle);
                    if (!(_grpPosArray isEqualTo [])) then {
                        private _index = (floor random (count _grpPosArray));
                        _grpPosNew = _grpPosArray select _index;
                        _grpPosArray deleteAt _index;
                    };
                };
                {
                    private _unit = _x;
                    private _unitpos = getPosATL _unit;
                    if (!(_grpPosNew isEqualTo _grpPos)) then {
                        _unitpos = [_grpPosNew,_grpldr,_unit] call EFUNC(AI,getNewPos);
                    };
                    private _veh = assignedVehicle _unit;
                    if (!isNull _veh) then {
                        private _vehPos = getposATL _veh;
                        if (!(_grpPosNew isEqualTo _grpPos)) then {_vehPos = _grpPosNew;};
                        if (!(_veh in _vehLog)) then {
                            (_group select 2) pushBack ([_veh,_vehPos] call EFUNC(AI,getDetailsVehicle));
                            _vehLog pushBack _veh;
                        };
                    };
                    if (_grpldr isEqualTo _unit) then {
                        {
                            (_group select 1) pushback _x;
                        } forEach ([_unit,_grpPosNew] call EFUNC(AI,getDetailsGroup));
                    };
                    (_group select 2) pushback ([_unit,_unitpos,_veh] call EFUNC(AI,getDetailsUnit));
                } foreach _units;
                private _occupy = ((_group select 1) select 15);
                private _newOccupy = [(_grp getVariable ['UO_FW_AI_multiOccupy',0]),_gx] call EFUNC(AI,setMultiOccupy);
                private _currentPos = ((_group select 1) select 1);
                for "_g" from 0 to _gx step 1 do {
                    if (_newOccupy isEqualTo 0 && {_gx isEqualTo 1}) then {
                        (_entities select 0) pushback _group;
                    } else {
                        if (_gx > 1) then {
                            if (!(_grpPosArray isEqualTo [])) then {
                                private _index = (floor random (count _grpPosArray));
                                _currentPos = _grpPosArray select _index;
                                _grpPosArray deleteAt _index;
                            };
                        };
                        if (_g < _newOccupy || _newOccupy isEqualTo 0) then {
                            private _newgroup = +_group;
                            _newgroup set [0,format["%1_%2",(str _grp),_g]];
                            (_newgroup select 1) set [1, _currentPos];
                            (_newgroup select 1) set [15, _occupy];
                            {
                                _x set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                            } foreach (_newgroup select 2);
                            (_entities select 0) pushback _newgroup;
                        } else {
                            private _newgroup = +_group;
                            _newgroup set [0,format["%1_%2",(str _grp),_g]];
                            (_newgroup select 1) set [1, _currentPos];
                            (_newgroup select 1) set [15, 0];
                            {
                                _x set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                            } foreach (_newgroup select 2);
                            (_entities select 0) pushback _newgroup;
                        };
                    };
                };
            };
        };
    };
} foreach _synced;
[_synced] call EFUNC(AI,deleteVehicles);
// Check for Synced Position Modules
private _posModules = [_logic,["UO_FW_AI_PositionModule"]] call EFUNC(AI,getSyncedModules);
{
    private _posModule = _x;
    private _position = (getPosATL _posModule);
    private _tempModules = [_posModule,["UO_FW_AI_TemplateModule"]] call EFUNC(AI,getSyncedModules);
    {
        private _tempModule = _x;
        private _tempSynced = [_tempModule] call EFUNC(AI,getSynced);
        {
            private _obj = _x;
            if (!(_obj isKindOf "Logic")) then {
                if (_obj isKindOf "Thing") then {
                    (_entities select 2) pushback ([_obj,_position] call EFUNC(AI,getDetailsThing));
                };
                if (_obj isKindOf "StaticWeapon"
                    || _obj isKindOf "Static"
                    || _obj isKindOf "Air"
                    || _obj isKindOf "Ship"
                    || _obj isKindOf "LandVehicle"
                ) then {
                    private _grp = if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static") then {group (gunner _obj)} else {group (driver _obj)};
                    if (isNull _grp) then {
                        (_entities select 1) pushback ([_obj,_position] call EFUNC(AI,getDetailsVehicleEmpty));
                    };
                };
                if (_obj isKindOf "Man") then {
                    private _grp = (group _obj);
                    private _grpldr = (leader _grp);
                    if (_grpldr == _obj) then {
                        private _grpPos = _position;
                        private _units = units _grp;
                        private _group = [str _grp,[],[]];
                        private _gx = _grp getVariable ['UO_FW_AI_multiplier',1];
                        private _grpPosArray = [];
                        private _grpPosNew = _grpPos;
                        private _grpRadius = _grp getVariable ['UO_FW_AI_createRadius',0];
                        private _posRadius = _posModule getVariable ['UO_FW_AI_PositionRadius',0];
                        if (_grpRadius > 1 || _posRadius > 1) then {
                            if (_grpRadius > 1) then {
                                _grpPosArray = [_grpPos,0,_grpRadius,(_gx*5)] call EFUNC(AI,getRandomPositionCircle);
                            } else {
                                if (_posRadius > 1) then {
                                    _grpPosArray = [_grpPos,0,_posRadius,(_gx*5)] call EFUNC(AI,getRandomPositionCircle);
                                };
                            };
                            if (!(_grpPosArray isEqualTo [])) then {
                                private _index = (floor random (count _grpPosArray));
                                _grpPosNew = _grpPosArray select _index;
                                _grpPosArray deleteAt _index;
                            };
                        };
                        {
                            private _unit = _x;
                            private _unitpos = [_grpPosNew,_grpldr,_unit] call EFUNC(AI,getNewPos);
                            private _veh = assignedVehicle _unit;
                            if (!isNull _veh) then {
                                private _vehPos = getposATL _veh;
                                if (!(_grpPosNew isEqualTo _grpPos)) then {_vehPos = _grpPosNew;};
                                if (!(_veh in _vehLog)) then {
                                    (_group select 2) pushBack ([_veh,_vehPos] call EFUNC(AI,getDetailsVehicle));
                                    _vehLog pushBack _veh;
                                };
                            };
                            if (_grpldr == _unit) then {
                                {
                                    (_group select 1) pushback _x;
                                } forEach ([_unit,_grpPosNew] call EFUNC(AI,getDetailsGroup));
                            };
                            private _unitDetails = [_unit,_unitpos,_veh] call EFUNC(AI,getDetailsUnit);
                            (_group select 2) pushback _unitDetails;
                        } foreach _units;
                        private _occupy = ((_group select 1) select 15);
                        private _newOccupy = [(_grp getVariable ['UO_FW_AI_multiOccupy',0]),_gx] call EFUNC(AI,setMultiOccupy);
                        private _currentPos = ((_group select 1) select 1);
                        for "_g" from 0 to _gx step 1 do {
                            if (_newOccupy isEqualTo 0 && _gx isEqualTo 1) then {
                                (_entities select 0) pushback _group;
                            } else {
                                if (_gx > 1) then {
                                    if (!(_grpPosArray isEqualTo [])) then {
                                        private _index = (floor random (count _grpPosArray));
                                        _currentPos = _grpPosArray select _index;
                                        _grpPosArray deleteAt _index;
                                    };
                                };
                                if (_g < _newOccupy || _newOccupy isEqualTo 0) then {
                                    private _newgroup = +_group;
                                    _newgroup set [0,format["%1_%2",(str _grp),_g]];
                                    (_newgroup select 1) set [1, _currentPos];
                                    (_newgroup select 1) set [15, _occupy];
                                    {
                                        _x set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                                    } foreach (_newgroup select 2);
                                    (_entities select 0) pushback _newgroup;
                                } else {
                                    private _newgroup = +_group;
                                    _newgroup set [0,format["%1_%2",(str _grp),_g]];
                                    (_newgroup select 1) set [1, _currentPos];
                                    (_newgroup select 1) set [15, 0];
                                    {
                                        _x set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                                    } foreach (_newgroup select 2);
                                    (_entities select 0) pushback _newgroup;
                                };
                            };
                        };
                    };
                };
            };
        } forEach _tempSynced;
        {
            UO_FW_AI_templatesyncedObjects pushBack _x;
        } forEach _tempSynced;
    } foreach _tempModules;
} foreach _posModules;
_entities
