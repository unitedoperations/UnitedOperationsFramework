class CfgPatches
{
	class UO_UOFrameworkModuls
	{
		// Meta information for editor
		name = "United Operations Framework";
		author = "Me";
		url = "http://xkcd.com";
		units[] = {"UO_BriefingModule","UO_SoftAOLimitModule","UO_CoreBasicSetupModule","UO_AreaEndModule","UO_CustomCodeEndModule","UO_CustomEndModule","UO_TimeLimitEndModule",
		"UO_CasualtyPercentageEndModule","UO_AOLimitModule","UO_AceMedicalModule","UO_StartOnSafeModule"};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};
class CfgFactionClasses
{
	class NO_CATEGORY;
	class UO_FrameworkCategory: NO_CATEGORY
	{
			displayName = "Olsenframework";
	};
};

class CfgFunctions
{
		class UO_Framework
		{
			tag = "UO";
			#include "AOLimitModule\cfgFunctions.hpp"
			#include "Ace_MedicalModule\cfgFunctions.hpp"
			#include "AntiNDModule\cfgFunctions.hpp"
			#include "AISkillModule\cfgFunctions.hpp"
			#include "Core\cfgFunctions.hpp"
			#include "BriefingModule\cfgFunctions.hpp"
			#include "SoftAOLimitModule\cfgFunctions.hpp"
			#include "EndConditionModule\cfgFunctions.hpp"
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
	// Description base classes, for more information see below
	#include "Core\cfgVehicles.hpp"
	#include "AntiNDModule\cfgVehicles.hpp"
	#include "BriefingModule\cfgVehicles.hpp"
	#include "SoftAOLimitModule\cfgVehicles.hpp"
	#include "AISkillModule\cfgVehicles.hpp"
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
