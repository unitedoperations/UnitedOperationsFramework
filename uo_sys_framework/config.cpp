#include "script_macros.hpp"
#include "\x\UO_FW\addons\Main\config_macros.hpp"

class CfgPatches {
    class ADDON {
        name = "United Operations Framework";
        author = "United Operations";
        authors[] = {"Sacher","Blackhawk","Olsen","PiZZADOX","TrainDoctor"};
        url = "https://github.com/unitedoperations/UnitedOperationsFramework";
        units[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_Main","3DEN","ace_Main","ace_arsenal","A3_Modules_F"};
        VERSION_CONFIG;
    };
};

//External Class References
#include "Core\RscTitles\rscdefinitions.hpp"
#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\resincl.inc"
#include "Core\MainExternal.hpp"

class CfgFactionClasses {
    class NO_CATEGORY;
    class UO_FrameworkCategory: NO_CATEGORY {
        displayName = " United Operations Framework";
    };
    #include "HeadlessAIModule\cfgFactionClasses.hpp"
};

class CfgFunctions {
	class UO_Framework {
		tag = "UO_FW";
		#include "Core\cfgFunctions.hpp"
		//Add Custom Functions
		#include "BriefingModule\cfgFunctions.hpp"
		#include "ShotCountModule\cfgFunctions.hpp"
		#include "AIDriversModule\cfgFunctions.hpp"
		#include "GearModule\cfgFunctions.hpp"
		#include "AOLimitModule\cfgFunctions.hpp"
		#include "SetupTimerModule\cfgFunctions.hpp"
		#include "AILinkModule\cfgFunctions.hpp"
		#include "DisconnectControlModule\cfgFunctions.hpp"
		#include "StartTextModule\cfgFunctions.hpp"
		#include "AutoTrackAssetModule\cfgFunctions.hpp"
		#include "CaptureZoneModule\cfgFunctions.hpp"
		#include "StartInParachuteModule\cfgFunctions.hpp"
		#include "MapCompassRemoverModule\cfgFunctions.hpp"
		#include "FiremissionModule\cfgFunctions.hpp"
		#include "HostageModule\cfgFunctions.hpp"
		#include "CoverMapModule\cfgFunctions.hpp"
	};
	//Add Custom Function Categories with a Different Tag
	#include "HeadlessAIModule\cfgFunctions.hpp"
};

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class EventHandlers;
        class ArgumentsBaseUnits {
            class Units;
        };
        class ModuleDescription {
            class AnyBrain;
        };
    };
    class OlsenModule: Module_F {
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
    #include "HeadlessAIModule\cfgVehicles.hpp"
    #include "SetupTimerModule\cfgVehicles.hpp"
    #include "CaptureZoneModule\cfgVehicles.hpp"
    #include "AOLimitModule\cfgVehicles.hpp"
    #include "CoverMapModule\cfgVehicles.hpp"
};

class RscTitles {
    #include "Core\RscTitles.hpp"
    #include "AOLimitModule\RscTitles.hpp"
    #include "SetupTimerModule\RscSetupTimer.hpp"
};
#include "FiremissionModule\RscTitles.hpp"

class CfgNotifications {
    #include "AOLimitModule\cfgNotifications.hpp"
    #include "SetupTimerModule\CfgNotifications.hpp"
};

class CfgDebriefingSections {
    #include "Core\cfgDebriefingSections.hpp"
};

class CfgSounds {
    #include "SelfActionsModule\cfgSounds.hpp"
};

class CfgAmmo {
    #include "SelfActionsModule\cfgAmmo.hpp"
};

class CfgMagazines {
    #include "SelfActionsModule\cfgMagazines.hpp"
};

class CfgUnitInsignia {

};

class Cfg3DEN {
    class Mission {
        class UO_FW_Settings {
            displayName = "Mission Settings";
            class AttributeCategories {
                //add Main mission settings here
                #include "Core\cfg3den\Mission\MainMenu.hpp"
                #include "Core\cfg3den\Mission\TeamsMenu.hpp"
                //debug at bottom
                #include "Core\cfg3den\Mission\DebugMenu.hpp"
            };
        };

        //Additional Core cfg3denMenu defines
        #include "Core\cfg3den\cfg3denMenuCategories.hpp"

        class UO_FW_Module_Settings {
            displayName = "Module Settings";
            class AttributeCategories {
                //add module settings here
                #include "AIDriversModule\cfg3den\Modules\AIDrivers.hpp"
                #include "AILinkModule\cfg3den\Modules\AILink.hpp"
                #include "AntiNDModule\cfg3den\Modules\AntiND.hpp"
                #include "AutoTrackAssetModule\cfg3den\Modules\AutoTrackAsset.hpp"
                #include "MapCompassRemoverModule\cfg3den\Modules\MapAndCompass.hpp"
                #include "DisconnectControlModule\cfg3den\Modules\DisconnectControl.hpp"
                #include "MarkerControlModule\cfg3den\Modules\MarkerControl.hpp"
                #include "SafeStartModule\cfg3den\Modules\SafeStart.hpp"
                #include "SelfActionsModule\cfg3den\Modules\SelfActions.hpp"
                #include "ShotCountModule\cfg3den\Modules\ShotCount.hpp"
                #include "StartTextModule\cfg3den\Modules\StartText.hpp"
                #include "CoverMapModule\cfg3den\Modules\CoverMap.hpp"
            };
        };
        #include "GearModule\cfg3den\cfg3denMenuCategories.hpp"
        //Add Custom Mission 3DEN Editor Categories
        #include "BriefingModule\cfg3den\cfg3denMenuCategories.hpp"
        #include "HeadlessAIModule\cfg3den\cfg3denMenuCategories.hpp"
        #include "ACREModule\cfg3den\cfg3denMenuCategories.hpp"
    };

    //Add Custom Base 3DEN Options & Categories
    class Group {
        class AttributeCategories {
            #include "HeadlessAIModule\cfgAttributeCategories\Group.hpp"
        };
    };

    class Object {
        class AttributeCategories {
            #include "HeadlessAIModule\cfgAttributeCategories\Object.hpp"
            #include "TeamColourModule\cfgAttributeCategories\Object.hpp"
            #include "GearModule\cfgAttributeCategories\Object.hpp"
            #include "ACREModule\cfgAttributeCategories\Object.hpp"
            #include "AIDriversModule\cfgAttributeCategories\Object.hpp"
            #include "StartInParachuteModule\cfgAttributeCategories\Object.hpp"
            #include "MapCompassRemoverModule\cfgAttributeCategories\Object.hpp"
            #include "FiremissionModule\cfgAttributeCategories\Object.hpp"
            #include "HostageModule\cfgAttributeCategories\Object.hpp"
            #include "CoverMapModule\cfgAttributeCategories\Object.hpp"
            #include "ObjectSettingsModule\cfgAttributeCategories\Object.hpp"
        };
    };

    class Logic {
        class Draw {
            class 3D {
                textureBackgroundModule =  "\x\UO_FW\addons\Main\Core\Resources\UI\textureBackgroundModuleSquareInv_ca.paa";
                sizeModule="(32 + 14) * pixelW";
                sizeBackgroundModule="(48 + 14) * pixelW";
                colorModule[]={0,0,0};
                colorModuleBackground[]={1,1,1};
                colorModulePreview[]={1,1,1};
                colorModulePreviewBackground[]={1,1,1};
                alphaNormal=1;
                alphaNormalBackground=0.75;
                alphaSelected=1;
                alphaSelectedBackground=1;
                alphaHover=1;
                alphaHoverBackground=1;
                fadeDistance=2500;
            };
            class 2D {
                textureBackgroundModule =  "\x\UO_FW\addons\Main\Core\Resources\UI\textureBackgroundModuleSquareInv_ca.paa";
                sizeModule="(32 + 6) * pixelW";
                sizeBackgroundModule="(48 + 6) * pixelW";
                presenceBorder=2;
                areaBorder=1;
                colorModule[]={0,0,0};
                colorModuleBackground[]={1,1,1};
                colorModulePreview[]={0,0,0};
                colorModulePreviewBackground[]={1,1,1};
                alphaNormal=1;
                alphaNormalBackground=0.75;
                alphaSelected=1;
                alphaSelectedBackground=1;
                alphaHover=1;
                alphaHoverBackground=1;
            };
        };

        class AttributeCategories {
            #include "HeadlessAIModule\cfgAttributeCategories\Logic.hpp"
        };
    };

    //Add Custom Configs & Controls for 3DEN and Modules
    class Attributes {
        #include "Core\CfgAttributes.hpp"
        #include "HeadlessAIModule\CfgAttributes.hpp"
        #include "TeamColourModule\CfgAttributes.hpp"
        #include "CaptureZoneModule\CfgAttributes.hpp"
        #include "StartInParachuteModule\CfgAttributes.hpp"
        #include "ACREModule\CfgAttributes.hpp"
        #include "GearModule\CfgAttributes.hpp"
        #include "AOLimitModule\CfgAttributes.hpp"
        #include "HostageModule\CfgAttributes.hpp"
    };
};

class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                //UO Menus Define
                #include "Core\display3DEN\Menu.hpp"
                #include "Core\display3DEN\MenuEndConditions.hpp"
                #include "Core\display3DEN\MenuRespawn.hpp"
                //Add Custom UO Menus
                #include "HeadlessAIModule\display3DEN\Menu.hpp"
                #include "BriefingModule\display3DEN\Menu.hpp"
                #include "GearModule\display3DEN\Menu.hpp"
                #include "ACREModule\display3DEN\Menu.hpp"
                //Tools Define
                #include "Core\display3DEN\Menu3DEN.hpp"
                #include "Core\display3DEN\MenuTools.hpp"
                //Add Custom Tools Menus
                /*class UO_FW_Tools_Folder {
                    text = "Tools";
                    items[] = {"UO_FW_Test_Mission","UO_FW_Test_Loadouts"};
                };*/
                //Documentation Define
                #include "Core\display3DEN\MenuDoc.hpp"
                //Compile UO Menu Folder
                //Add Custom Items with an Additional Entry in Items[]
                class UO_FW_Folder {
                    text = "UO Framework";
                    items[] = {"UO_FW_Settings","UO_FW_Briefing_Folder","UO_FW_Respawn_Folder","UO_FW_Module_Settings","UO_FW_EndConditions_Folder","UO_FW_ACRE_Folder","UO_FW_Gear_Folder","UO_FW_AI_Settings","UO_FW_ExportImport_Folder","UO_FW_Documentation"};
                    //items[] = {"UO_FW_Settings","UO_FW_Module_Settings","UO_FW_Gear_Settings","UO_FW_EndConditions_Folder","UO_FW_ACRE_Folder","UO_FW_Briefing_Folder","UO_FW_Documentation"};
                };
                //Compile Main Menu
                items[] += {"UO_FW_Folder"};
            };
        };
    };
};

class CfgRemoteExec {

};

#include "Core\CfgUO\RespawnTemplates.hpp"

class Params {
    #define DAYTIMEHOUR_DEFAULT 12
    #include "\a3\functions_f\Params\paramDaytimeHour.hpp"
};

//class Extended_PreStart_EventHandlers {
//    #include "Core\cfgXEH\PreStart.hpp"
//};

class Extended_PreInit_EventHandlers {
	#include "Core\cfgXEH\PreInit.hpp"
	//Module PreInit Activation
	#include "GearModule\cfgXEH\PreInit.hpp"
	#include "CoverMapModule\cfgXEH\PreInit.hpp"
	#include "BriefingModule\cfgXEH\PreInit.hpp"
	#include "AntiNDModule\cfgXEH\PreInit.hpp"
	#include "TeamColourModule\cfgXEH\PreInit.hpp"
	#include "SelfActionsModule\cfgXEH\PreInit.hpp"
	#include "MarkerControlModule\cfgXEH\PreInit.hpp"
	#include "ShotCountModule\cfgXEH\PreInit.hpp"
	#include "FiremissionModule\cfgXEH\PreInit.hpp"
	#include "StartInParachuteModule\cfgXEH\PreInit.hpp"
	#include "StartTextModule\cfgXEH\PreInit.hpp"
	#include "ACREModule\cfgXEH\PreInit.hpp"
	#include "AIDriversModule\cfgXEH\PreInit.hpp"
	#include "AILinkModule\cfgXEH\PreInit.hpp"
	#include "HeadlessAIModule\cfgXEH\PreInit.hpp"
};

class Extended_PostInit_Eventhandlers {
    #include "Core\cfgXEH\PostInit.hpp"
    //Module PostInit Activation
};

class Extended_InitPost_Eventhandlers {
    //Module InitPost Activation
    class CAManBase {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "HeadlessAIModule\cfgXEH\InitPost.hpp"
    };
    class LandVehicle {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
    };
    class Helicopter {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
    };
    class Plane {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
    };
    class Ship_F {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
    };
};
