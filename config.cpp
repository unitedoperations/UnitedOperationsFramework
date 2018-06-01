class CfgPatches
{
	class OF_OlsenFrameworkModuls
	{
		// Meta information for editor
		name = "My Addon";
		author = "Me";
		url = "http://xkcd.com";
		units[] = {"OF_BriefingModule","OF_SoftAOLimitModule","OF_CoreBasicSetupModule","OF_AreaEndModule","OF_CustomCodeEndModule","OF_CustomEndModule","OF_TimeLimitEndModule",
		"OF_CasualtyPercentageEndModule","OF_AOLimitModule","OF_AceMedicalModule","OF_StartOnSafeModule"};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};
class CfgFactionClasses
{
	class NO_CATEGORY;
	class OF_FrameworkCategory: NO_CATEGORY
	{
			displayName = "Olsenframework";
	};
};

class CfgFunctions
{
		class OF_Framework
		{
			tag = "OF";
			#include "Core\cfgFunctions.hpp"
			#include "BriefingModule\cfgFunctions.hpp"
			#include "SoftAOLimitModule\cfgFunctions.hpp"
			#include "AOLimitModule\cfgFunctions.hpp"
			#include "AntiNDModule\cfgFunctions.hpp"
			#include "EndConditionModule\cfgFunctions.hpp"
			#include "Ace_MedicalModule\cfgFunctions.hpp"
			#include "GearModule\cfgFunctions.hpp"
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
    class OlsenModule: Module_F
	{
		category = "OF_FrameworkCategory";
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
		 icon = "\OF_OlsenFrameworkModuls\Core\logo.paa"; // Map icon. Delete this entry to use the default icon
		 // Menu displayed when the module is placed or double-clicked on by Zeus
		 curatorInfoType = "RscDisplayAttributeModuleNuke";
	};
	// Description base classes, for more information see below
	#include "Core\cfgVehicles.hpp"
	#include "AntiNDModule\cfgVehicles.hpp"	
	#include "BriefingModule\cfgVehicles.hpp"
	#include "SoftAOLimitModule\cfgVehicles.hpp"

	#include "EndConditionModule\cfgVehicles.hpp"
	#include "Ace_MedicalModule\cfgVehicles.hpp"
	#include "GearModule\cfgVehicles.hpp"
	#include "StartOnSafeModule\cfgVehicles.hpp"

#include "StartOnTeamColorModule\cfgVehicles.hpp"
};

class cfgRscTitles
{

	 #include "SoftAOLimitModule\cfgRscTitles.hpp"
	 #include "Core\cfgRscTitles.hpp"
};

class CfgNotifications
{

	#include "SoftAOLimitModule\cfgNotifications.hpp"

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
