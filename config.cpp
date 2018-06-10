class CfgPatches
{
	class UO_UOFrameworkModuls
	{
		// Meta information for editor
		name = "United Operations Framework";
		author = "Me";
		url = "http://xkcd.com";
		units[] = {		"UO_AIBehaviourModule",
						"UO_AILinkModule",
						"UO_AISkillModule",
						"UO_AceMedicalModule",
						"UO_AntiNDModule",
						"UO_AOLimitModule",
						"UO_AreaEndModule",
						"UO_BriefingModule",
						"UO_CasualtyPercentageEndModule",
						"UO_CoreBasicSetupModule",
						"UO_CustomCodeEndModule",
						"UO_CustomEndModule",
						"UO_JipModule",
						"UO_MarkerControlModule",
						"UO_SetupTimerModule",
						"UO_SoftAOLimitModule",
						"UO_StartOnSafeModule",
						"UO_StartOnTeamColorModule",
						"UO_StartTextModule",
						"UO_TimeLimitEndModule"};

		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};
class CfgFactionClasses
{
	class NO_CATEGORY;
	class UO_FrameworkCategory: NO_CATEGORY
	{
			displayName = "United Operations Framework";
	};
};

class CfgFunctions
{
		class UO_Framework
		{
			tag = "UO";

			#include "Core\cfgFunctions.hpp"


			#include "AOLimitModule\cfgFunctions.hpp"
			#include "Ace_MedicalModule\cfgFunctions.hpp"
			#include "AntiNDModule\cfgFunctions.hpp"
			#include "AISkillModule\cfgFunctions.hpp"
			#include "AILinkModule\cfgFunctions.hpp"
		    #include "BriefingModule\cfgFunctions.hpp"
			#include "DisconnectControlModule\cfgFunctions.hpp"
			#include "EndConditionModule\cfgFunctions.hpp"
			#include "GearModule\cfgFunctions.hpp"
			#include "JipModule\cfgFunctions.hpp"
			#include "MarkerControlModule\cfgFunctions.hpp"
			#include "SetupTimerModule\cfgFunctions.hpp"
			#include "ShotCountModule\cfgFunctions.hpp"
			#include "SoftAOLimitModule\cfgFunctions.hpp"
			#include "StartTextModule\cfgFunctions.hpp"
			#include "StartOnSafeModule\cfgFunctions.hpp"
			#include "StartOnTeamColorModule\cfgFunctions.hpp"
		};
};
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ModuleDescription;
	};
    class UO_Module: Module_F
	{
		category = "UO_FrameworkCategory";
		 // 0 for server only execution, 1 for global execution, 2 for persistent global execution
		 isGlobal = 2;
		 // 1 for module waiting until all synced triggers are activated
		 isTriggerActivated = 0;
		 // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		 isDisposable = 0;
		 // // 1 to run init function in Eden Editor as well
		 is3DEN = 0;
		 // Standard object definitions
		 scope = 1; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		 icon = "\UO_UOFrameworkModuls\Core\logo.paa"; // Map icon. Delete this entry to use the default icon
		 // Menu displayed when the module is placed or double-clicked on by Zeus
		 curatorInfoType = "RscDisplayAttributeModuleNuke";
	};
	#include "Core\cfgVehicles.hpp"
	// Description base classes, for more information see below
	#include "AOLimitModule\cfgVehicles.hpp"
	#include "Ace_MedicalModule\cfgVehicles.hpp"
	#include "AntiNDModule\cfgVehicles.hpp"
	#include "AISkillModule\cfgVehicles.hpp"
	#include "AILinkModule\cfgVehicles.hpp"
	#include "BriefingModule\cfgVehicles.hpp"
	#include "DisconnectControlModule\cfgVehicles.hpp"
	#include "EndConditionModule\cfgVehicles.hpp"
	#include "GearModule\cfgVehicles.hpp"
	#include "JipModule\cfgVehicles.hpp"
	#include "MarkerControlModule\cfgVehicles.hpp"
	#include "SetupTimerModule\cfgVehicles.hpp"
	#include "ShotCountModule\cfgVehicles.hpp"
	#include "SoftAOLimitModule\cfgVehicles.hpp"
	#include "StartTextModule\cfgVehicles.hpp"
	#include "StartOnSafeModule\cfgVehicles.hpp"
	#include "StartOnTeamColorModule\cfgVehicles.hpp"

};

class RscTitles
{


	 #include "Core\cfgRscTitles.hpp"
	  #include "SoftAOLimitModule\cfgRscTitles.hpp"
	 #include "SetupTimerModule\RscSetupTimer.hpp"

};

class CfgNotifications
{

	#include "SoftAOLimitModule\cfgNotifications.hpp"
	 #include "SetupTimerModule\CfgNotifications.hpp"

};
class CfgDebriefingSections
{
	#include "Core\cfgDebriefingSections.hpp"
};

class CfgSounds
{

};

class CfgUnitInsignia
{


};

class Params
{

};
#include "Core\cfgDia.hpp"
