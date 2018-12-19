/*	Description: Module initialisation checks if modules linked correctly.
 *	Arguments:
 * 		STRING	- Mode of Module
 *		ARRAY	- Inputs
 * 	Return Value:
 * 		BOOL	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params [["_mode","",[""]],["_input",[],[[]]]];
	switch _mode do {
		case "init": {
			if !is3DEN then {
				if(isNil "UO_FW_AI_initialised") then {call UO_FW_AI_fnc_init;};
				_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]],["_grps",[],[[]]],["_spos",[0,0,0],[[]]],["_dpos",[],[[]]],["_vehLog",[],[[]]],"_s","_t","_j","_i"];
				if !(_isActivated) exitWith {};
				sleep 0.25;
				private _synced	= synchronizedObjects _logic;
				for [{_s=(count _synced)-1}, {(_s >= 0)}, {_s = _s - 1}] do {
					private _obj = _synced select _s;
					if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static" || _obj isKindOf "Air" || _obj isKindOf "Ship" || _obj isKindOf "LandVehicle") then {
						_synced = _synced + (units _obj);
						_synced = _synced + (assignedCargo _obj);
						_msg = format["RETURN (assignedCargo _obj) | %1",(assignedCargo _obj)];
						UO_FW_DEBUG("",_msg)
					};
				};
				_synced = _synced arrayIntersect _synced;
				for [{_t=0}, {(_t < count _synced)}, {_t = _t + 1}] do {
					private _obj = _synced select _t;
					private _gx = (_logic getVariable ['aeHIMultiplier',1]);
					private _radius = (_logic getVariable ['aeHIRadius',0]);
					if (_obj isKindOf "Logic") then {
						private _posModules = [_logic,["UO_FW_AI_PositionModule"]] call UO_FW_AI_fnc_getSyncedModules;
						_msg = format["RETURN _posModules | %1",_posModules];
						UO_FW_DEBUG("",_msg)
						for [{_i = (count _posModules) -1}, {_i >= 0}, {_i = _i - 1}] do {
							private _module = _posModules select _i;
							_msg = format["RETURN aePositionType | %1 : %2",_module getVariable ['aePositionType',0],_module];
							UO_FW_DEBUG("",_msg)
							if ((_module getVariable ['aePositionType',0]) isEqualTo 1) then {
								_spos = (getposATL _module);
								_posModules deleteAt _i;
							} else {
								_dpos pushBack (getPosATL _module);
							_msg = format["RETURN _module pos | %1",(getPosATL _module)];
							UO_FW_DEBUG("",_msg)
							};
						};
						if(_radius > 0) then {
							private _safePos = [(getPosATL _logic),(2*_gx),[0,_radius]] call UO_FW_AI_fnc_getSafePos;
							_dpos = _dpos + _safePos;
						} else {
							if(_gx > (count _dpos)) then {
								_safePos = [(getPosATL _logic),(2*_gx),[0,_radius]] call UO_FW_AI_fnc_getSafePos;
								if(_safePos isEqualTo [] || (count _safePos) < _gx) then {
									_safePos = [(getPosATL _logic),(2*_gx),[0,(_radius*2)]] call UO_FW_AI_fnc_getSafePos;
								};
								_dpos = _dpos + _safePos;
							};
						};
						_msg = format["RETURN _spos | %1 RETURN _dpos | %2",_spos,_dpos];
						UO_FW_DEBUG("",_msg)
						_logic setVariable ["startPos",_spos];
						_logic setVariable ["dropPos",_dpos];
					} else {
						if (_obj isKindOf "Man") then {
							private _grp = (group _obj);
							private _grpldr = (leader _grp);
							if (_grpldr == _obj) then {
								private _grpPos = getposATL _grpldr;
								private _units = units _grp;
								_msg = format["RETURN _dpos | %1",_dpos];
								UO_FW_DEBUG("",_msg)
								private _group = [str _grp,[],[]];
								private _gx = _logic getVariable ['aeMultiplier',1];
								private _tasks = [_grp,["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getTasks;
								for [{_j=0}, {(_j < (count _units))}, {_j = _j + 1}] do {
									_u = _units select _j;
									private _veh = assignedVehicle _u;
									private _vehRole = [];
									private _vehAssigned = false;
									if (!isNull _veh) then {
										_vehRole = assignedVehicleRole _u;
										_vehAssigned = true;
										if(!(_veh in _vehLog)) then {
											private _unitInit = _veh getVariable ["aeUnitInit",""];
											if(typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
											(_group select 2) pushBack [
												false,
												typeOf _veh,
												_spos,
												vectorDir _veh,
												vectorUp _veh,
												damage _veh,
												fuel _veh,
												magazinesAllTurrets _veh,
												locked _veh,
												surfaceIsWater (getposATL _veh),
												_veh getVariable ["aeUnitName",""],
												_veh getVariable ['aePersistent',false],
												_unitInit
											];
											_vehLog pushBack _veh;
											_msg = format["RETURN _vehLog | %1: %2",_j,_vehLog];
											UO_FW_DEBUG("",_msg)
										};
									};
									if(_grpldr == _u) then {
										_grpInit = _grp getVariable ["aeGroupInit","true"];
										_occupy = _grp getVariable ['aeOccupyOption',0];
										if(_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
										if(typename _grpInit isEqualTo "STRING") then {_grpInit = compile _grpInit;};
										(_group select 1) pushback [
											side _u,
											_spos,
											_grp getVariable ['aeBehaviour','safe'],
											_grp getVariable ['aeCombatMode','red'],
											_grp getVariable ['aeSpeed','limited'],
											_grp getVariable ['aeFormation','wedge'],
											_grp getVariable ['aeGroupStance','auto'],
											_grpInit,
											_grp getVariable ['aeCreateRadius',0],
											_grp getVariable ['aePatrolRadius',0],
											_grp getVariable ['aeWaypointWait',3],
											_grp getVariable ['aeStartBuilding',false],
											_grp getVariable ['aeTask',4],
											_grp getVariable ['aeTaskTimer',0],
											_grp getVariable ['aeMultiplier',1],
											_occupy,
											_vehAssigned,
											([(waypoints _u)] call UO_FW_AI_fnc_getWaypointDetails),
											(surfaceIsWater (getposATL _u)),
											_tasks,
											_grp getVariable ['UO_FW_AI_headless',true],
											_grp getVariable ['aeForceLights',false],
											_grp getVariable ['aeParaEnable',false],
											_grp getVariable ['aeParaHeight',3000],
											_grp getVariable ['aeParaDirection',-1],
											_grp getVariable ['aeParaColMaxLength',100],
											_grp getVariable ['aeParaSpacing',25],
											_grp getVariable ['aeParaSpread',25],
											_grp getVariable ['aeParaSmoke',false],
											_grp getVariable ['aeParaRealism',true]
										];
									};
									private _unitInit = _u getVariable ["aeUnitInit","true"];
									if(typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
									(_group select 2) pushback [
										true,
										typeOf _u,
										_spos,
										false,
										vectorDir _u,
										vectorUp _u,
										damage _u,
										getUnitLoadout _u,
										typeOf _veh,
										_vehRole,
										_vehAssigned,
										_u getVariable ["ACE_captives_isHandcuffed",false],
										(surfaceIsWater (getposATL _u)),
										_u getVariable ['aePersistent',false],
										_u getVariable ['aeStance','auto'],
										_u getVariable ['aeRemove',0],
										_unitInit,
										_u getVariable ['aeUnitName',""]
									];
								};
								_grps pushback _group;
								for [{_g=1},{(_g < _gx)},{_g=_g+1}] do {
									private _nspos = _spos vectorAdd [_g*-100,_g*-100,0];
									_newgroup = +_group;
									_newgroup set [0,format["%1_%2",(str _grp),_g]];
									(_newgroup select 2) set [2, _nspos];
									(_newgroup select 1) set [11, false];
									(_newgroup select 1) set [15, 0];
									_grps pushback _newgroup;
								};

							};
						};
					};
				};
				_msg = format["RETURN aeHIUnits | %1",_logic getVariable "aeHIUnits"];
				UO_FW_DEBUG("",_msg)
				_logic setVariable ["aeHIUnits",_grps];
				[_synced] call UO_FW_AI_fnc_deleteVehicles;
				_syncedZoneModule = [_logic,["UO_FW_AI_ZoneModule"]] call UO_FW_AI_fnc_getSyncedModules;
				_type = typeof _logic;
				if (count _syncedZoneModule == 0) then {
					_msg = format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to create a Heli insert when the Zone is activated.",_logic,_type];
					UO_FW_DEBUG("",_msg)
				};
				[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
			};
		};
		case "attributesChanged3DEN": {
			_logic = _input param [0,objNull,[objNull]];
			private _radius = (_logic getVariable ["aeHIRadius",0]);
            private _area = _logic get3DENAttribute "size2";
            set3DENAttributes [[[_logic],"size2",[_radius,_radius]]];
		};
		case "registeredToWorld3DEN": {};
		case "unregisteredFromWorld3DEN": {};
		case "connectionChanged3DEN": {};
		default {};
	};
	true
