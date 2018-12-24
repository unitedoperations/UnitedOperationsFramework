#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = "United Operations Framework";
		author = "United Operations";
		authors[] = {"Sacher","Blackhawk","Olsen","PiZZADOX","TrainDoctor"};
		url = "https://github.com/unitedoperations/UnitedOperationsFramework";
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main","3DEN","A3_Modules_F"};
		VERSION_CONFIG;
	};
};

//external class references
#include "Core\RscTitles\rscdefinitions.hpp"
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

	//#include "HeadlessAIModule\cfgFactionClasses.hpp"
};

class CfgFunctions
{
	class UO_Framework
	{
		tag = "UO_FW";
		//add custom functions
		#include "3DEN\cfgFunctions.hpp"
		#include "CallExecution\cfgFunctions.hpp"
		#include "Core\cfgFunctions.hpp"
		#include "BriefingModule\cfgFunctions.hpp"
		#include "EndConditionsModule\cfgFunctions.hpp"
		#include "TeamColourModule\cfgFunctions.hpp"
		#include "SelfActionsModule\cfgFunctions.hpp"
		#include "SafeStartModule\cfgFunctions.hpp"
		#include "ShotCountModule\cfgFunctions.hpp"
		#include "AntiNDModule\cfgFunctions.hpp"
		#include "AIDriversModule\cfgFunctions.hpp"
		#include "ACREModule\cfgFunctions.hpp"
		#include "GearModule\cfgFunctions.hpp"
		#include "AOLimitModule\cfgFunctions.hpp"
		#include "SetupTimerModule\cfgFunctions.hpp"
		#include "AILinkModule\cfgFunctions.hpp"
		#include "DisconnectControlModule\cfgFunctions.hpp"
		#include "MarkerControlModule\cfgFunctions.hpp"
		#include "StartTextModule\cfgFunctions.hpp"
		#include "AutoTrackAssetModule\cfgFunctions.hpp"
		#include "JipModule\cfgFunctions.hpp"
		#include "CaptureZoneModule\cfgFunctions.hpp"
		#include "StartInParachuteModule\cfgFunctions.hpp"
		#include "MapCompassRemoverModule\cfgFunctions.hpp"
		#include "FiremissionModule\cfgFunctions.hpp"
		#include "HostageModule\cfgFunctions.hpp"
	};

	//#include "HeadlessAIModule\cfgFunctions.hpp"
};

class CfgEditorCategories {
	class UO_FW_Category {
		displayName = "UO_FW"
	};
};

class CfgEditorSubcategories {
	class UO_FW_SubCategory {
		displayName = "UO_FW"
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class EventHandlers;
		class ArgumentsBaseUnits {
			class Units;
		};
		class ModuleDescription {
			class AnyBrain;
		};
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
		editorCategory = "UO_FW_Category";
		editorSubCategory = "UO_FW_SubCategory";
	};
	//add custom cfgVehicles
	//#include "Core\cfgVehicles.hpp"

	//#include "HeadlessAIModule\cfgVehicles.hpp"
	#include "SetupTimerModule\cfgVehicles.hpp"
	#include "CaptureZoneModule\cfgVehicles.hpp"
	#include "AOLimitModule\cfgVehicles.hpp"
};

class RscTitles
{
	#include "Core\RscTitles.hpp"
	#include "AOLimitModule\RscTitles.hpp"
	#include "SetupTimerModule\RscSetupTimer.hpp"
};
#include "FiremissionModule\RscTitles.hpp"

class CfgNotifications
{
	#include "AOLimitModule\cfgNotifications.hpp"
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
				#include "Core\cfg3den\Mission\Main.hpp"
				#include "Core\cfg3den\Mission\Teams.hpp"
				#include "JipModule\cfg3den\Mission\Jip.hpp"
				//debug at bottom
				#include "Core\cfg3den\Mission\Debug.hpp"
			};
		};

		class UO_FW_Module_Settings
		{
			displayName = "Module Settings";
			class AttributeCategories
			{
				//add module settings here
				#include "AIDriversModule\cfg3den\Modules\AIDrivers.hpp"
				#include "AILinkModule\cfgAttributeCategories\mission\AILink.hpp"
				#include "AntiNDModule\cfg3den\Modules\AntiND.hpp"
				#include "AutoTrackAssetModule\cfgAttributeCategories\mission\AutoTrackAsset.hpp"
				#include "DisconnectControlModule\cfgAttributeCategories\mission\DisconnectControl.hpp"
				#include "MarkerControlModule\cfgAttributeCategories\mission\MarkerControl.hpp"
				#include "SafeStartModule\cfg3den\Modules\SafeStart.hpp"
				#include "SelfActionsModule\cfg3den\Modules\SelfActions.hpp"
				#include "ShotCountModule\cfg3den\Modules\ShotCount.hpp"
				#include "StartTextModule\cfgAttributeCategories\mission\StartText.hpp"
			};
		};
		#include "GearModule\cfg3den\cfg3denMenu.hpp"
		//add custom mission 3den editor categories
		#include "EndConditionsModule\cfg3den\cfg3denMenu.hpp"
		#include "BriefingModule\cfg3den\cfg3denMenu.hpp"
		//#include "HeadlessAIModule\cfg3den\cfg3denMenu.hpp"
		#include "ACREModule\cfg3den\cfg3denMenu.hpp"
	};

	//add custom base 3den options & categories
	class Group {
		class AttributeCategories {
			//#include "HeadlessAIModule\cfgAttributeCategories\Group.hpp"
		};
	};

	class Object {
		class AttributeCategories {
			//#include "HeadlessAIModule\cfgAttributeCategories\Object.hpp"
			#include "TeamColourModule\cfgAttributeCategories\Object.hpp"
			#include "GearModule\cfg3den\UnitGear.hpp"
			#include "ACREModule\cfgAttributeCategories\Object.hpp"
			#include "AIDriversModule\cfgAttributeCategories\Object.hpp"
			#include "StartInParachuteModule\cfgAttributeCategories\Object.hpp"
			#include "MapCompassRemoverModule\cfgAttributeCategories\Object.hpp"
			#include "FiremissionModule\cfgAttributeCategory.hpp"
			#include "HostageModule\cfgAttributeCategories\Object.hpp"
		};
	};

	class Logic {
		class AttributeCategories {
			//#include "HeadlessAIModule\cfgAttributeCategories\Logic.hpp"
		};
	};

	//Add custom configs & controls for 3den and modules
	class Attributes
	{
		#include "3DEN\CfgAttributes.hpp"
		#include "Core\CfgAttributes.hpp"
		#include "EndConditionsModule\CfgAttributes.hpp"
		#include "HeadlessAIModule\CfgAttributes.hpp"
		#include "TeamColourModule\CfgAttributes.hpp"
		#include "CaptureZoneModule\CfgAttributes.hpp"
		#include "StartInParachuteModule\CfgAttributes.hpp"
		#include "JipModule\CfgAttributes.hpp"
		#include "ACREModule\CfgAttributes.hpp"
	};
};

class display3DEN
{
	class Controls
	{
		class MenuStrip: ctrlMenuStrip
		{
			class Items
			{
				//UO menus define
				#include "3DEN\display3DEN\Menu.hpp"

				//Add custom UO menus
				//#include "HeadlessAIModule\display3DEN\Menu.hpp"
				#include "BriefingModule\display3DEN\Menu.hpp"
				#include "EndConditionsModule\display3DEN\Menu.hpp"
				#include "GearModule\display3DEN\Menu.hpp"
				#include "ACREModule\display3DEN\Menu.hpp"

				//tools define
				#include "3DEN\display3DEN\MenuTools.hpp"

				//add custom tools menus

				/*class UO_FW_Tools_Folder {
					text = "Tools";
					items[] = {"UO_FW_Test_Mission","UO_FW_Test_Loadouts"};
				};*/

				//documentation define
				#include "3DEN\display3DEN\MenuDoc.hpp"

				//add custom documentation

				//compile UO menu folder
				//add custom items with an additional entry in items[]
				class UO_FW_Folder
				{
					text = "UO Framework";
					//items[] = {"UO_FW_Settings","UO_FW_Module_Settings","UO_FW_Gear_Settings","UO_FW_EndConditions_Folder","UO_FW_ACRE_Folder","UO_FW_Briefing_Folder","UO_FW_AI_Settings","UO_FW_Documentation"};
					items[] = {"UO_FW_Settings","UO_FW_Module_Settings","UO_FW_Gear_Settings","UO_FW_EndConditions_Folder","UO_FW_ACRE_Folder","UO_FW_Briefing_Folder","UO_FW_Documentation"};
				};
				//compile main menu
				items[] += {"UO_FW_Folder"};
			};
		};
	};
};

class CfgRemoteExec {
    class Functions {
        mode = 2;
        jip = 0;
        class bis_fnc_call {
        	allowedTargets = 0;
					jip = 0;
        };
				class call {
        	allowedTargets = 0;
					jip = 0;
        };
    };
};

class Params
{
	#define DAYTIMEHOUR_DEFAULT 12
	#include "\a3\functions_f\Params\paramDaytimeHour.hpp"
};

class Extended_PreInit_EventHandlers
{
	class UO_Framework_PreInit
	{
		init="call compile preProcessFileLineNumbers 'x\UO_FW\addons\main\XEH_preInit.sqf'";
	};
};
