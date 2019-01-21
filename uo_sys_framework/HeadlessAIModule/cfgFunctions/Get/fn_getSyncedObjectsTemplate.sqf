/*    Description: Gets synced units, vehicles and objects synced to a template module.
 *    Arguments:
 *         ARRAY    - Module (name, _logic)
 *    Return Value:
 *         ARRAY     - Entities linked to object
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_logic",["_entities",[[], [], []],[[]]],["_vehLog",[],[[]]],"_t","_j","_g"];
    private _synced = [_logic] call UO_FW_AI_fnc_getSynced; 
    private _posModules = [_logic,["UO_FW_AI_PositionModule"]] call UO_FW_AI_fnc_getSyncedModules;
    {    
        private _posModule = _x;
        private _position = (getPosATL _posModule);
        for [{_t=0}, {(_t < count _synced)}, {_t = _t + 1}] do {
            private _obj =  _synced select _t;
            if (!(_obj isKindOf "Logic")) then {
                if (_obj isKindOf "Thing") then {
                    private _thing = ;
                    (_entities select 2) pushback ([_obj,_position] call UO_FW_AI_fnc_getDetailsThing);            
                };
                if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static" || _obj isKindOf "Air" || _obj isKindOf "Ship" || _obj isKindOf "LandVehicle") then {
                    private _grp = if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static") then {group (gunner _obj)} else {group (driver _obj)};                
                    if (isNull _grp) then {
                        (_entities select 1) pushback ([_obj] call UO_FW_AI_fnc_getDetailsVehicleEmpty);
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
                                _grpPosArray = [_grpPos,0,_grpRadius,(_gx*5)] call UO_FW_AI_fnc_getRandomPositionCircle;
                            } else {
                                if (_posRadius > 1) then {
                                    _grpPosArray = [_grpPos,0,_posRadius,(_gx*5)] call UO_FW_AI_fnc_getRandomPositionCircle;
                                };
                            };
                            if (!(_grpPosArray isEqualTo [])) then {
                                _index = (floor random (count _grpPosArray));
                                _grpPosNew = _grpPosArray select _index;
                                _grpPosArray deleteAt _index;
                            };
                        };
                        for [{_j=0}, {(_j < (count _units))}, {_j = _j + 1}] do { 
                            private _u = _units select _j;
                            private _unitpos = [_grpPosNew,_grpldr,_u] call UO_FW_AI_fnc_getNewPos;
                            private _veh = assignedVehicle _u;    
                            if (!isNull _veh) then {
                                private _vehPos = getposATL _veh;
                                if (!(_grpPosNew isEqualTo _grpPos)) then {_vehPos = _grpPosNew;};
                                if (!(_veh in _vehLog)) then {
                                    (_group select 2) pushBack ([_veh,_vehPos] call UO_FW_AI_fnc_getDetailsVehicle);                                
                                    _vehLog pushBack _veh;
                                };
                            };                         
                            if (_grpldr == _u) then {
                                {
                                    (_group select 1) pushback _x;                             
                                } forEach ([_u,_grpPosNew] call UO_FW_AI_fnc_getDetailsGroup);
                            };
                            private _unitDetails = [_u,_unitpos,_veh] call UO_FW_AI_fnc_getDetailsUnit;
                            (_group select 2) pushback _unitDetails;
                        };
                        private _occupy = ((_group select 1) select 15);
                        private _multiOccupy = _grp getVariable ['UO_FW_AI_multiOccupy',0];
                        private _newOccupy = [(_grp getVariable ['UO_FW_AI_multiOccupy',0])] call UO_FW_AI_fnc_setMultiOccupy;                    
                        private _currentPos = ((_group select 1) select 1);    
                        for [{_g=0},{(_g < _gx)},{_g=_g+1}] do {
                            if (_newOccupy isEqualTo 0 && _gx isEqualTo 1) then {
                                (_entities select 0) pushback _group; 
                            } else {                            
                                if (_gx > 1) then {
                                    if (!(_grpPosArray isEqualTo [])) then {
                                        _index = (floor random (count _grpPosArray));
                                        _currentPos = _grpPosArray select _index;
                                        _grpPosArray deleteAt _index;
                                    };
                                };
                                if (_g < _newOccupy || _newOccupy isEqualTo 0) then {
                                    _newgroup = +_group; 
                                    _newgroup set [0,format["%1_%2",(str _grp),_g]];
                                    (_newgroup select 1) set [1, _currentPos];
                                    (_newgroup select 1) set [15, _occupy];    
                                    for [{_h=0},{(_h < (count (_newgroup select 2)))},{_h=_h+1}] do {
                                        ((_newgroup select 2) select _h) set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                                    };
                                    (_entities select 0) pushback _newgroup;                 
                                } else {
                                    _newgroup = +_group; 
                                    _newgroup set [0,format["%1_%2",(str _grp),_g]];
                                    (_newgroup select 1) set [1, _currentPos];
                                    (_newgroup select 1) set [15, 0];
                                    for [{_h=0},{(_h < (count (_newgroup select 2)))},{_h=_h+1}] do {
                                        ((_newgroup select 2) select _h) set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                                    };
                                    (_entities select 0) pushback _newgroup;
                                };
                            };                                
                        };
                    };
                };
            };
        };
    } forEach _posModules;
    [_synced] call UO_FW_AI_fnc_deleteVehicles;    
    _entities    