/*	Setup of Headless AI Variables. */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

UO_FW_zones 					= [];
UO_FW_entities				= [];
UO_FW_templates				= [];
UO_FW_respawns				= [];
UO_FW_taskedGroups			= [];
UO_FW_functions				= ["UO_FW_IEDModule","UO_FW_FastAirStrikeModule","UO_FW_AirDropModule","UO_FW_HeloInsertModule","UO_FW_ArtilleryStrikeModule"];
UO_FW_zoneTypes 			= [/*0*/["CAManBase","LandVehicle","Ship","Helicopter","Plane"],/*1*/["CAManBase","LandVehicle"],/*2*/["Helicopter","Plane"],/*3*/["CAManBase","LandVehicle","Helicopter"],/*4*/["CAManBase","LandVehicle","Ship"],/*5*/["CAManBase","LandVehicle","Plane"],/*6*/["Ship","Helicopter","Plane"],/*7*/["CAManBase"],/*8*/["LandVehicle"],/*9*/["Ship"],/*10*/["Helicopter"],/*11*/["Plane"]];
UO_FW_ieds					= [];
UO_FW_iedObjects			= [""];
MDET_var_radius 			= 5; 	// Maximum distance from player to mine
MDET_var_angle 				= 60; 	// Player to mine direction angle threshold
MDET_var_rnd_radius 		= true; // Enable/Disable randomizer
MDET_var_rnd_radius_value 	= 7; 	// +/- %
UO_FW_paradrop				= false;
UO_FW_zoneInit				= [];
UO_FW_templateSyncedObjects	= [];
UO_FW_templateCleanup		= false;
UO_FW_AI_initialised		= true;

if (UO_FW_Debug_Detailed_Enabled) then {
	[_logic] spawn UO_AI_fnc_debugSyncedModules;
};
	