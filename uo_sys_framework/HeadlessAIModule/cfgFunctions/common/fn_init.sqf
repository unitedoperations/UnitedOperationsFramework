/*	Setup of Headless AI Variables. */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

UO_FW_AI_Zones 					= [];
UO_FW_AI_entities				= [];
UO_FW_AI_templates				= [];
UO_FW_AI_respawns				= [];
UO_FW_AI_taskedGroups			= [];
UO_FW_AI_functions				= ["UO_FW_AI_FastAirStrikeModule","UO_FW_AI_AirDropModule","UO_FW_AI_HeloInsertModule"];
UO_FW_AI_zoneTypes 			= [/*0*/["CAManBase","LandVehicle","Ship","Helicopter","Plane"],/*1*/["CAManBase","LandVehicle"],/*2*/["Helicopter","Plane"],/*3*/["CAManBase","LandVehicle","Helicopter"],/*4*/["CAManBase","LandVehicle","Ship"],/*5*/["CAManBase","LandVehicle","Plane"],/*6*/["Ship","Helicopter","Plane"],/*7*/["CAManBase"],/*8*/["LandVehicle"],/*9*/["Ship"],/*10*/["Helicopter"],/*11*/["Plane"]];
UO_FW_AI_paradrop				= false;
UO_FW_AI_zoneInit				= [];
UO_FW_AI_templatesyncedObjects	= [];
UO_FW_AI_templateCleanup		= false;
UO_FW_AI_initialised		= true;

if (getMissionConfigValue["UO_FW_Debug_Detailed_Enabled",false]) then {
	diag_log "fn_init initialized!";
};
