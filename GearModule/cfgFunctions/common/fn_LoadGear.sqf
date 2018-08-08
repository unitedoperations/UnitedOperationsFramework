#include "\x\UO_FW\addons\main\script_macros.hpp"

UO_FW_EXEC_CHECK(ALL)
if(!(missionNamespace getVariable ["UO_FW_Gear_Enabled",false])) exitWith {};
//when set to false, facewear types that are whitelisted will not be removed
UO_FW_force_remove_facewear = missionNamespace getVariable ["UO_FW_GearFaceRemovalEnabled",false];;

//forces adding an item to inventory. Works only if container is specified!
UO_FW_enableOverfill = missionNamespace getVariable ["UO_FW_GearOverfillEnabled",false];

UO_FW_GearLoadouts = [];
_gear = ["UO_FW_GearPath_1","UO_FW_GearPath_2","UO_FW_GearPath_3","UO_FW_GearPath_4","UO_FW_GearPath_5",
		 "UO_FW_GearPath_6","UO_FW_GearPath_7","UO_FW_GearPath_8","UO_FW_GearPath_9","UO_FW_GearPath_10"];
{
	_gear = missionNamespace getVariable [_x,""]; 
	if(_gear != "") then 
	{
		UO_FW_GearLoadouts pushBack _gear;
	};
	
}forEach _gear;

UO_FW_EXEC_CHECK(CLIENT)

_type = player getVariable ["UO_FW_Gear_UnitGearType",""];
if(_type != "") then 
{
	_array = [player,_type];
	if(player getVariable ["UO_FW_Gear_Groupname",""] != "" ) then {_array pushBack (player getVariable ["UO_FW_Gear_Groupname",""])};
	_array call UO_FW_FNC_GearScript;
};