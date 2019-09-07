#include "\x\UO_FW\addons\Main\script_macros.hpp"
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
#include "\x\UO_FW\addons\Main\Core\RscTitles\rscdefinitions.hpp"
#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\resincl.inc"
#include "\x\UO_FW\addons\Main\Core\MainExternal.hpp"

class CfgFactionClasses {
    class NO_CATEGORY;
    class MGVAR(FrameworkCategory): NO_CATEGORY {
        displayName = " United Operations Framework";
    };
    //#include "HeadlessAIModule\cfgFactionClasses.hpp"
};

class CfgFunctions {
	class MGVAR(Framework) {
		tag = QUOTE(PREFIX);
		#include "Core\cfgFunctions.hpp"
		//Add Custom Functions
		#include "BriefingModule\cfgFunctions.hpp"
		#include "ShotCountModule\cfgFunctions.hpp"
		#include "AIDriversModule\cfgFunctions.hpp"
		#include "GearModule\cfgFunctions.hpp"
		#include "AOLimitModule\cfgFunctions.hpp"
		#include "SetupTimerModule\cfgFunctions.hpp"
		#include "AILinkModule\cfgFunctions.hpp"
		#include "StartTextModule\cfgFunctions.hpp"
		#include "AutoTrackAssetModule\cfgFunctions.hpp"
		#include "CaptureZoneModule\cfgFunctions.hpp"
		#include "StartInParachuteModule\cfgFunctions.hpp"
        #include "FiremissionVirtualModule\cfgFunctions.hpp"
		#include "HostageModule\cfgFunctions.hpp"
		#include "CoverMapModule\cfgFunctions.hpp"
		#include "MapAndCompassRemoverModule\cfgFunctions.hpp"
	};
	//Add Custom Function Categories with a Different Tag
	//#include "HeadlessAIModule\cfgFunctions.hpp"
};

class CfgVehicles {
    class All {
        class EventHandlers {
            #include "GearModule\cfg3denEH\EH.hpp"
        };
    };
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
    class EGVAR(Core,BaseModule): Module_F {
        category = QMGVAR(FrameworkCategory);
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        is3DEN = 0;
        scope = 1;
        icon = "\a3\3DEN\Data\CfgWaypoints\scripted_ca.paa";
        editorCategory = QMGVAR(Category);
        editorSubCategory = QMGVAR(SubCategory);
    };
    //add custom cfgVehicles
    //#include "HeadlessAIModule\cfgVehicles.hpp"
    #include "SetupTimerModule\cfgVehicles.hpp"
    #include "CaptureZoneModule\cfgVehicles.hpp"
    #include "AOLimitModule\cfgVehicles.hpp"
    #include "CoverMapModule\cfgVehicles.hpp"
    #include "Core\cfgVehicles.hpp"
    #include "FiremissionVirtualModule\cfgVehicles.hpp"
};

class RscTitles {
    #include "Core\RscTitles.hpp"
    #include "AOLimitModule\RscTitles.hpp"
    #include "SetupTimerModule\RscSetupTimer.hpp"
};
#include "FiremissionVirtualModule\dia\dia_polarFiremission.hpp"

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

//class CfgUnitInsignia {
//
//};

class Cfg3DEN {

    class EventHandlers {
        #include "Core\cfg3denEH.hpp"
    };

    class Mission {
        class EGVAR(Core,Settings) {
            displayName = "Mission Settings";
            class AttributeCategories {
                //add Main mission settings here
                #include "Core\cfg3den\Mission\MainMenu.hpp"
                #include "Core\cfg3den\Mission\TeamsMenu.hpp"
                #include "Core\cfg3den\Mission\VisionSettings.hpp"
                #include "Core\cfg3den\Mission\DebugMenu.hpp"
            };
        };

        //Additional Core cfg3denMenu defines
        #include "Core\cfg3den\cfg3denMenuCategories.hpp"

        class EGVAR(Module,Settings) {
            displayName = "Module Settings";
            class AttributeCategories {
                //add module settings here
                #include "AIDriversModule\cfg3den\Modules\AIDrivers.hpp"
                #include "AILinkModule\cfg3den\Modules\AILink.hpp"
                #include "AntiNDModule\cfg3den\Modules\AntiND.hpp"
                #include "AutoTrackAssetModule\cfg3den\Modules\AutoTrackAsset.hpp"
                #include "MapAndCompassRemoverModule\cfg3den\Modules\MapAndCompass.hpp"
                #include "MarkerControlModule\cfg3den\Modules\MarkerControl.hpp"
                #include "SafeStartModule\cfg3den\Modules\SafeStart.hpp"
                #include "StartInParachuteModule\cfg3den\Modules\StartInParachute.hpp"
                #include "SelfActionsModule\cfg3den\Modules\SelfActions.hpp"
                #include "ShotCountModule\cfg3den\Modules\ShotCount.hpp"
                #include "StartTextModule\cfg3den\Modules\StartText.hpp"
                #include "CoverMapModule\cfg3den\Modules\CoverMap.hpp"
            };
        };
        #include "GearModule\cfg3den\cfg3denMenuCategories.hpp"
        //Add Custom Mission 3DEN Editor Categories
        #include "BriefingModule\cfg3den\cfg3denMenuCategories.hpp"
        //#include "HeadlessAIModule\cfg3den\cfg3denMenuCategories.hpp"
        #include "FiremissionVirtualModule\cfg3den\cfg3denMenuCategories.hpp"
        #include "ACREModule\cfg3den\cfg3denMenuCategories.hpp"
    };

    //Add Custom Base 3DEN Options & Categories
    class Group {
        class AttributeCategories {
            //#include "HeadlessAIModule\cfgAttributeCategories\Group.hpp"
        };
    };

    class Object {
        class AttributeCategories {
            //#include "HeadlessAIModule\cfgAttributeCategories\Object.hpp"
            #include "TeamColourModule\cfgAttributeCategories\Object.hpp"
            #include "GearModule\cfgAttributeCategories\Object.hpp"
            #include "ACREModule\cfgAttributeCategories\Object.hpp"
            #include "AIDriversModule\cfgAttributeCategories\Object.hpp"
            #include "StartInParachuteModule\cfgAttributeCategories\Object.hpp"
            #include "MapAndCompassRemoverModule\cfgAttributeCategories\Object.hpp"
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
            //#include "HeadlessAIModule\cfgAttributeCategories\Logic.hpp"
        };
    };

    //Add Custom Configs & Controls for 3DEN and Modules
    class Attributes {
        #include "Core\CfgAttributes.hpp"
        //#include "HeadlessAIModule\CfgAttributes.hpp"
        #include "BriefingModule\CfgAttributes.hpp"
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
    class ContextMenu: ctrlMenu {
        class Items {

            class EGVAR(Core,ContextSeperator) {
                value = 0;
                conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
            };

            #include "Core\display3den\ContextMenu.hpp"
            #include "BriefingModule\display3den\ContextMenu.hpp"
            #include "ACREModule\display3den\ContextMenu.hpp"
            #include "GearModule\display3den\ContextMenu.hpp"

            items[] += {
                QEGVAR(Core,ContextSeperator),
                QEGVAR(Core,ContextFolder),
                QEGVAR(Briefing,ContextFolder),
                QEGVAR(ACRE,ContextFolder),
                QEGVAR(Gear,ContextFolder)
            };
        };
    };

    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                //UO Menus Define
                #include "Core\display3DEN\Menu.hpp"
                #include "Core\display3DEN\MenuEndConditions.hpp"
                #include "Core\display3DEN\MenuRespawn.hpp"
                //Add Custom UO Menus
                //#include "HeadlessAIModule\display3DEN\Menu.hpp"
                #include "BriefingModule\display3DEN\Menu.hpp"
                #include "GearModule\display3DEN\Menu.hpp"
                #include "ACREModule\display3DEN\Menu.hpp"
                #include "FiremissionVirtualModule\display3DEN\Menu.hpp"
                //Tools Define
                #include "Core\display3DEN\Menu3DEN.hpp"
                #include "Core\display3DEN\MenuTools.hpp"
                //Documentation Define
                #include "Core\display3DEN\MenuDoc.hpp"
                //Compile UO Menu Folder
                //Add Custom Items with an Additional Entry in Items[]
                class EGVAR(Core,Folder) {
                    text = "UO Framework";
                    items[] = {
                        QEGVAR(Core,SettingsMenu),
                        QEGVAR(Briefing,Folder),
                        QEGVAR(Respawn,Folder),
                        QEGVAR(Module,SettingsMenu),
                        QEGVAR(EndConditions,Folder),
                        QEGVAR(ACRE,Folder),
                        QEGVAR(Gear,Folder),
                        QEGVAR(FiremissionVirtual,Folder),
                        QEGVAR(ExportImport,Folder),
                        QEGVAR(Core,Documentation),
                        QEGVAR(Core,VersionDisplay)
                    };
                };
                //Compile Main Menu
                items[] += {QEGVAR(Core,Folder)};
            };
        };
    };
};

#include "Core\CfgUO\RespawnTemplates.hpp"

#include "GearModule\CfgUO\GearPresets.hpp"

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
    #include "FiremissionVirtualModule\cfgXEH\PreInit.hpp"
	#include "StartInParachuteModule\cfgXEH\PreInit.hpp"
	#include "StartTextModule\cfgXEH\PreInit.hpp"
	#include "SafeStartModule\cfgXEH\PreInit.hpp"
	#include "ACREModule\cfgXEH\PreInit.hpp"
	#include "AIDriversModule\cfgXEH\PreInit.hpp"
	#include "AILinkModule\cfgXEH\PreInit.hpp"
	#include "HostageModule\cfgXEH\PreInit.hpp"
	//#include "HeadlessAIModule\cfgXEH\PreInit.hpp"
};

class Extended_PostInit_Eventhandlers {
    #include "Core\cfgXEH\PostInit.hpp"
    //Module PostInit Activation
};

//class Extended_Init_Eventhandlers {
//};

class Extended_InitPost_Eventhandlers {
    //Module InitPost Activation
    class CAManBase {
        #include "Core\cfgXEH\InitPost.hpp"
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "HostageModule\cfgXEH\InitPost.hpp"
        //#include "HeadlessAIModule\cfgXEH\InitPost.hpp"
        #include "MapAndCompassRemoverModule\cfgXEH\InitPost.hpp"
    };
    class LandVehicle {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
        #include "AIDriversModule\cfgXEH\InitPost.hpp"
    };
    class Helicopter {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
        #include "AIDriversModule\cfgXEH\InitPost.hpp"
    };
    class Plane {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
        #include "AIDriversModule\cfgXEH\InitPost.hpp"
    };
    class Ship_F {
        #include "ShotCountModule\cfgXEH\InitPost.hpp"
        #include "AutoTrackAssetModule\cfgXEH\InitPost.hpp"
        #include "AIDriversModule\cfgXEH\InitPost.hpp"
    };
};

class Extended_Killed_Eventhandlers {
    class CAManBase {
        #include "Core\cfgXEH\onKilled.hpp"
    };
};

class Extended_Respawn_Eventhandlers {
    class CAManBase {
        #include "Core\cfgXEH\onRespawn.hpp"
    };
};
