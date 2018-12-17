/*	Setup of Headless AI Variables. */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

UO_FW_zones 					= [];
UO_FW_entities				= [];
UO_FW_templates				= [];
UO_FW_respawns				= [];
UO_FW_taskedGroups			= [];
UO_FW_functions				= ["UO_FW_AI_FastAirStrikeModule","UO_FW_AI_AirDropModule","UO_FW_AI_HeloInsertModule"];
UO_FW_zoneTypes 			= [/*0*/["CAManBase","LandVehicle","Ship","Helicopter","Plane"],/*1*/["CAManBase","LandVehicle"],/*2*/["Helicopter","Plane"],/*3*/["CAManBase","LandVehicle","Helicopter"],/*4*/["CAManBase","LandVehicle","Ship"],/*5*/["CAManBase","LandVehicle","Plane"],/*6*/["Ship","Helicopter","Plane"],/*7*/["CAManBase"],/*8*/["LandVehicle"],/*9*/["Ship"],/*10*/["Helicopter"],/*11*/["Plane"]];
UO_FW_paradrop				= false;
UO_FW_zoneInit				= [];
UO_FW_templateSyncedObjects	= [];
UO_FW_templateCleanup		= false;
UO_FW_AI_initialised		= true;

if (UO_FW_Debug_Detailed_Enabled) then {
	[_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
};
