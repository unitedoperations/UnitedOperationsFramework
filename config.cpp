#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = "United Operations Framework";
		author = "United Operations";
		authors[] = {"Sacher","Blackhawk","Olsen","PiZZADOX"};
		url = "https://github.com/unitedoperations/UnitedOperationsFramework";
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"cba_main","3den","A3_Modules_F"};
		VERSION_CONFIG;
	};
};

//external class references
#include "Core\cfgDia.hpp"
#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\resincl.inc"
#include "3den\MainExternal.hpp"

class CfgFactionClasses
{
	class NO_CATEGORY;
	
	class UO_FrameworkCategory: NO_CATEGORY
	{
			displayName = "United Operations Framework";
	};
	
	#include "HeadlessAIModule\cfgFactionClasses.hpp"
};

class CfgFunctions
{
	class UO_Framework
	{
		tag = "UO_FW";
		//add custom functions
		#include "3den\cfgFunctions.hpp"
		#include "Core\cfgFunctions.hpp"
		#include "BriefingModule\cfgFunctions.hpp"
		#include "EndConditionsModule\cfgFunctions.hpp"
	};
	
	#include "HeadlessAIModule\cfgFunctions.hpp"
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
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		scope = 1;
		icon = "\a3\3DEN\Data\CfgWaypoints\scripted_ca.paa";
		curatorInfoType = "RscDisplayAttributeModuleNuke";
	};
	//add custom cfgVehicles
	//#include "Core\cfgVehicles.hpp"
	#include "HeadlessAIModule\cfgVehicles.hpp"
};

class cfgRscTitles
{
	//#include "Core\cfgRscTitles.hpp"
};

class CfgNotifications
{
	
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

class Cfg3DEN
{
	class Mission
	{
		class UO_FW_Settings
		{
			displayName = "Mission Settings";
			class AttributeCategories
			{
				//add main mission settings here
				#include "Core\cfgAttributeCategories\Mission\Main.hpp"
				#include "Core\cfgAttributeCategories\Mission\Teams.hpp"
				#include "EndConditionsModule\cfgAttributeCategories\Mission\Timelimit.hpp"
				#include "Core\cfgAttributeCategories\Mission\Debug.hpp"
			};
		};
		
		class UO_FW_Module_Settings
		{
			displayName = "Module Settings";
			class AttributeCategories
			{
				//add module settings here
				//#include "SafeStartModule\cfgAttributeCategories\SafeStart.hpp"
				//#include "AntiNDModule\cfgAttributeCategories\AntiND.hpp"
				
			};
		};
		
		//add custom mission 3den editor categories
		#include "BriefingModule\cfg3den\cfg3denMenu.hpp"
		#include "HeadlessAIModule\cfg3den\cfg3denMenu.hpp"
	};
	
	//add custom base 3den options & categories
	#include "HeadlessAIModule\Cfg3DEN.hpp"
	
	//Add custom configs & controls for 3den and modules
	class Attributes
	{
		#include "3DEN\CfgAttributes.hpp"
		#include "Core\CfgAttributes.hpp"
		#include "HeadlessAIModule\CfgAttributes.hpp"
	};
};

class display3DEN
{
	class Controls
	{
		class MenuStrip : ctrlMenuStrip
		{
			class Items
			{
				//UO menus define
				#include "3DEN\display3DEN\Menu.hpp"
				
				//Add custom UO menus
				#include "HeadlessAIModule\display3DEN\Menu.hpp"
				#include "BriefingModule\display3DEN\Menu.hpp"
				
				//tools define
				#include "3DEN\display3DEN\MenuTools.hpp"
				
				//add custom tools menus
				
				//documentation define
				#include "3DEN\display3DEN\MenuDoc.hpp"
				
				//add custom documentation
				
				//compile UO menu folder
				//add custom items with an additional entry in items[]
				class UO_FW_Folder
				{
					text = "UO Framework";
					items[] = {"UO_FW_Settings","UO_FW_Module_Settings","UO_FW_Briefing_Folder","UO_FW_AI_Settings","UO_FW_Tools_Folder","UO_FW_Documentation"};
				};
				
				//compile main menu
				items[] += {"UO_FW_Folder"};
			};
		};
	};
};

class Params
{
	
};

