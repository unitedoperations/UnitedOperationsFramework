/*	Description: Populates the zone with all linked units, vehicles and objects.
 * 	Arguments:
 * 		ARRAY	- Entities
 * 		NUMBER	- Spawn Delay
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
if(!UO_FW_var_isHCorServer) exitWith {};
params [["_zone",objNull,[objNull]],["_entities",[],[[]]],["_delay",0,[0]],["_code",{},[{}]]];
	sleep _delay;	
	_entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
	{
		private _veh = _x;
		private _v = createVehicle [(_veh select 0),(_veh select 1),[],0,"CAN_COLLIDE"];
		_v setPosATL (_veh select 1);
		_v setVectorDirAndUp [_veh select 2,_veh select 3];
		_v setDamage (_veh select 4);
		_v setFuel (_veh select 5);		 
		{
			_x params [["_class","",[""]],["_path",[],[[]]],["_ammo",0,[0]]];
			_v setMagazineTurretAmmo [_class,_ammo,_path];
		} forEach (_veh select 6);
		_v lock (_veh select 7);
		if((count (_veh select 9)) > 1) then {
			missionNamespace setVariable[(_veh select 9), _v];
		};
		[_v,(_veh select 10)] call UO_AI_fnc_setPersistent;
		[_v,(_veh select 12)] call UO_AI_fnc_iedCreateVBIED;
		_v spawn (_veh select 11);
		sleep 0.25;
	} forEach _emptyvehs;
	{
		private _obj = _x;
		private _o = createVehicle [(_obj select 0),(_obj select 1),[],0,"CAN_COLLIDE"];
		_o setVectorDirAndUp [_obj select 2,_obj select 3];
		_o setPosATL (_obj select 1);
		_o setVariable["persistent",true,true];
		_o setDamage (_obj select 4);
		if((count (_obj select 6)) > 1) then {
			missionNamespace setVariable[(_obj select 6), _o];
		};
		[_o,(_obj select 7)] call UO_AI_fnc_setPersistent;		
		_o spawn (_obj select 8);
		sleep 0.25;
	} forEach _objs;
	{
		_x params ["_grpid","_grpSet","_grpMem"];
		if((_grpSet select 15) > 0 && !(_grpSet select 16) && (_grpSet select 12) < 6) then {
			_x spawn UO_AI_fnc_createOccupyGroup;
			
		} else {
			if(_grpSet select 24) then {
				_x spawn UO_AI_fnc_createParaGroup;
			} else {
				_x spawn UO_AI_fnc_createGroup;
			};
		};
		sleep 0.25;
	} forEach _grps;
	[_zone] spawn _code;
	sleep 3;
	([_zone,["UO_FW_TaskModule"]] call UO_AI_fnc_getSyncedModules) spawn UO_AI_fnc_taskActivate;
	true