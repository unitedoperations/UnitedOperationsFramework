/*	Description: Create a unit of a group and apply required settings.
 * 	Arguments:
 * 		GROUP	- Group Unit will be added to
 * 		ARRAY	- Position to create the unit at
 *		ARRAY	- Required Unit Settings
 *		STRING	- Group Stance Setting
 * 	Return Value:
 * 		OBJECT 	- Unit with settings
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params ["_occupy","_grp","_gpos","_startBld","_i","_u","_taskRadius",["_currentVeh",objNull,[objNull]]];
	_u params ["_uv","_uc","_pos","_light","_vcd","_vcu","_dmg","_g","_veh","_vr","_veha","_cuf","_wtr","_per","_ust","_rem","_uint","_name","_identity"];
	if(_occupy) then {
		_pos = _gpos;
	} else {
		if(_startBld && !_veha) then {
			_pos = [_gpos,_taskRadius,_i] call UO_FW_AI_fnc_getStartBuilding;
		};
	};
	private _unit = _grp createUnit [_uc,_pos,[],0,"NONE"];
	[_unit] join _grp;
	_unit disableAI "PATH";
	_unit setPosATL _pos;
	_unit setVectorDirAndUp [_vcd,_vcu];
	_unit setUnitLoadout [_g, true];
	_unit setDamage _dmg;
	if(_cuf) then {[_unit,_cuf] call ACE_captives_fnc_setHandcuffed;};
	[_unit,_rem] call UO_FW_AI_fnc_removeKit;
	if(count _name > 1) then {
		missionNamespace setVariable[_name, _unit];
	};
	_unit setVariable["aeUnitIdentity",_identity,true];
	[_unit,_per] call UO_FW_AI_fnc_setPersistent;
	_unit spawn _uint;
	if(_veha && !isNull _currentVeh) then {
		[_unit,_vr,_currentVeh] call UO_FW_AI_fnc_setAssignedVehicle;
	};
	if(!isNil "UO_FW_aCount_event_addEH") then { ["UO_FW_aCount_event_addEH", _unit] call CBA_fnc_serverEvent};
	_unit call UO_FW_FNC_trackUnit;
	_unit
