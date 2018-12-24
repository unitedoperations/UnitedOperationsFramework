#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)
[] spawn {

	if(!(missionNamespace getVariable ["UO_FW_Gear_Enabled",false])) exitWith {};
	//when set to false, facewear types that are whitelisted will not be removed
	UO_FW_force_remove_facewear = missionNamespace getVariable ["UO_FW_GearFaceRemovalEnabled",false];;

	//forces adding an item to inventory. Works only if container is specified!
	UO_FW_enableOverfill = missionNamespace getVariable ["UO_FW_GearOverfillEnabled",false];

	/*UO_FW_GearLoadouts = [];
	_gear = ["UO_FW_GearPath_1","UO_FW_GearPath_2","UO_FW_GearPath_3","UO_FW_GearPath_4","UO_FW_GearPath_5",
			"UO_FW_GearPath_6","UO_FW_GearPath_7","UO_FW_GearPath_8","UO_FW_GearPath_9","UO_FW_GearPath_10"];
	{
		_gear = missionNamespace getVariable [_x,""];
		if(_gear != "") then
		{
			UO_FW_GearLoadouts pushBack _gear;
		};

	}forEach _gear;*/

	//["","Executing gear of files: " + (str UO_FW_GearLoadouts)] call UO_FW_fnc_DebugMessageDetailed;

	if (!isDedicated && hasinterface) then {
		if !((player getVariable ["UO_FW_Gear_Groupname",""]) isEqualto "") then {
			(group player) setGroupId [(player getVariable ["UO_FW_Gear_Groupname",""])];
		};
		_type = player getVariable ["UO_FW_Gear_UnitGearType",""];
		if !(_type isEqualto "") then {
			_array = [player,_type];

			private _msg = format ["Executing gear of file: %1 for unit %2",(player getVariable ["UO_FW_Gear_Groupname",""]),player];
			UO_FW_DEBUG("",_msg)
			_array call UO_FW_FNC_GearScript;
		} else {
			private _msg = format ["Player unit %1 has no gear type defined, exiting gearscript.",player];
			UO_FW_DEBUG("",_msg)
			UO_FW_GearReady = true;
		};
	};

	if(isServer) then {
		{
			if(!(isPlayer _x)) then {
				if !((_x getVariable ["UO_FW_Gear_Groupname",""]) isEqualto "" ) then {
					(group _x) setGroupId [(_x getVariable ["UO_FW_Gear_Groupname",""])];
				};
				_type = _x getVariable ["UO_FW_Gear_UnitGearType",""];
				if !(_type isEqualto "") then	{
					_array = [_x,_type];
					_array call UO_FW_FNC_GearScript;
				};
			};
		} forEach allUnits;
		{
			if !((_x getVariable ["UO_FW_Gear_Groupname",""]) isEqualto "" ) then {
				(group _x) setGroupId [(_x getVariable ["UO_FW_Gear_Groupname",""])];
			};
			_type = _x getVariable ["UO_FW_Gear_UnitGearType",""];
			if !(_type isEqualto "") then {
				_array = [_x,_type];
				_array call UO_FW_FNC_GearScript;
			};
		} forEach vehicles;
	};
};
