
#include "cfgFSM.hpp"

class EGVAR(AI,Module) : EGVAR(Core,BaseModule) {
    scope = 1;
    category = "UO_FrameworkCategory_AI";
    icon = "\a3\3DEN\Data\CfgWaypoints\scripted_ca.paa";
};

class EGVAR(AI,ZoneModule) : EGVAR(AI,Module) {
    scope = 2;
    displayName = "AI Zone (Circle)";
    //icon = "\UO_FW\Resources\Icons\zonemodule_ca.paa";
    function = QEFUNC(AI,zone);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    curatorInfoType = "RscDisplayAttributeModuleNuke";
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\x\UO_FW\addons\Main\HeadlessAIModule\resources\aizonemodule_ca.paa";

    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 0;
    };

    class Attributes {
        class EGVAR(AI,zoneInitial) {
            displayName = "Initial Spawn";
            tooltip = "Enabling activates the zone on init, spawning units on the start of the mission. Default disabled.";
            property = QEGVAR(AI,zoneInitial);
            control = "CheckboxStateReversed";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(AI,zoneRadiusX) {
            displayName = "Activation Radius X";
            tooltip = "The size of the X value of the area the player will initiate this zone at in metres. Default: 100";
            property = QEGVAR(AI,zoneRadiusX);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,zoneRadiusY) {
            displayName = "Activation Radius Y";
            tooltip = "The size of the Y value of the area the player will initiate this zone at in metres. Default: 100";
            property = QEGVAR(AI,zoneRadiusY);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,zoneDelay) {
            displayName = "Delay";
            tooltip = "Delay after zone is activated that actual spawning occurs. Default 0 secs";
            property = QEGVAR(AI,zoneDelay);
            control = QEGVAR(AI,zoneDelayControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,zoneSuspend) {
            displayName = "Suspension";
            tooltip = "Suspending the zone to be enabled later, suspended zones will not detect player is with in radius or that a custom condition is met until zone is enabled. Default: Enabled";
            property = QEGVAR(AI,zoneSuspend);
            control = QEGVAR(AI,zoneSuspendControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,Zoneside) {
            displayName = "Activating Unit Side";
            tooltip = "Side of the unit that activates the zone. Default: ANY";
            property = QEGVAR(AI,Zoneside);
            control = QEGVAR(AI,ZonesideControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "4";
        };
        class EGVAR(AI,zoneType) {
            displayName = "Activating Unit Type";
            tooltip = "Type of unit the player is that activates the zone. Default all Units";
            property = QEGVAR(AI,zoneType);
            control = QEGVAR(AI,zoneTypeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,zoneCondition) {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this zone to be activated, condition true will spawn the zone. Default: Nil";
            property = QEGVAR(AI,zoneCondition);
            control = QEGVAR(AI,moduleconditionControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
        class EGVAR(AI,zoneCode) {
            displayName = "Custom Code";
            tooltip = "Pass custom code to be executed when zone is activated. Default: Nil";
            property = QEGVAR(AI,zoneCode);
            control = QEGVAR(AI,codeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
        };
    };
};
class EGVAR(AI,ZoneModule_R) : UO_FW_AI_ZoneModule {
    displayName = "AI Zone (Square)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};

class EGVAR(AI,ControlModule) : EGVAR(AI,Module) {
    scope = 2;
    displayName = "AI Control (Circle)";
    //icon = "\UO_FW\Resources\Icons\controlmodule_ca.paa";
    function = QEFUNC(AI,control);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    curatorInfoType = "RscDisplayAttributeModuleNuke";
    canSetArea = 1;
    icon = "\x\UO_FW\addons\Main\HeadlessAIModule\resources\aicontrolmodule_ca.paa";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 0;
    };
    class Attributes {
        class EGVAR(AI,ControlRadiusX) {
            displayName = "Activation Radius X";
            tooltip = "The size of the X value of the area the player will initiate the control zone at in metres. Default: 100";
            property = QEGVAR(AI,ControlRadiusX);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,ControlRadiusY) {
            displayName = "Activation Radius Y";
            tooltip = "The size of the Y value of the area the player will initiate the control zone at in metres. Default: 100";
            property = QEGVAR(AI,ControlRadiusY);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,controlSuspend) {
            displayName = "Suspension";
            tooltip = "Suspending the control module to be enabled later, suspended control modules will not detect player is with in radius or that a custom condition is met until enabled. Default: Enabled";
            property = QEGVAR(AI,controlSuspend);
            control = QEGVAR(AI,zoneSuspendControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,ControlInitAction) {
            displayName = "Initiate Action";
            tooltip = "The action the control module performs to linked zones when initiated, toggle Enable,Disable or Do Nothing. Default: Do Nothing";
            property = QEGVAR(AI,ControlInitAction);
            control = QEGVAR(AI,initActionControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,ControlAction) {
            displayName = "Activate Action";
            tooltip = "The action the control module performs to linked zones when activated, toggle Enable or Disable. Default: Enable";
            property = QEGVAR(AI,ControlAction);
            control = QEGVAR(AI,actionControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,ControlDelay) {
            displayName = "Delay";
            tooltip = "Delay after control module is activated that actual toggle of linked zones occurs. Default: 0secs";
            property = QEGVAR(AI,ControlDelay);
            control = QEGVAR(AI,zoneDelayControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,ControlSide) {
            displayName = "Activating Player Side";
            tooltip = "Side of the player that activates the control module. Default: WEST";
            property = QEGVAR(AI,ControlSide);
            control = QEGVAR(AI,ZonesideControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,ControlType) {
            displayName = "Activating Player Type";
            tooltip = "Type of unit the player is that activates the control module. Default: All Units";
            property = QEGVAR(AI,ControlType);
            control = QEGVAR(AI,zoneTypeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,ControlCondition) {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this control module to be activated, condition true will initiate the control module. Default: Nil";
            property = QEGVAR(AI,ControlCondition);
            control = QEGVAR(AI,moduleconditionControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'false'";
            validate = "condition";
        };
        class EGVAR(AI,ControlCode) {
            displayName = "Custom Code";
            tooltip = "Pass custom code to be executed when the control module is activated. Default: Nil";
            property = QEGVAR(AI,ControlCode);
            control = QEGVAR(AI,codeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};
class EGVAR(AI,ControlModule_R) : UO_FW_AI_ControlModule {
    displayName = "AI Control (Square)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};

class EGVAR(AI,TaskModule) : EGVAR(AI,Module) {
    scope = 2;
    displayName = "AI Task";
    //icon = "\UO_FW\Resources\Icons\taskmodule_ca.paa";
    function = QEFUNC(AI,task);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    curatorInfoType = "RscDisplayAttributeModuleNuke";
    canSetArea = 1;
    class AttributeValues {
        size2[] = {50,50};
    };
    class Attributes {
        class EGVAR(AI,taskRadius) {
            displayName = "Radius";
            tooltip = "The range the group will attempt to conduct the set task in. Default: 100";
            property = QEGVAR(AI,taskRadius);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,TaskTime) {
            displayName = "Time";
            tooltip = "How long the linked units will perform this task. Default: 0 (forever).";
            property = QEGVAR(AI,TaskTime);
            control = QEGVAR(AI,standardNumberControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,TaskId) {
            displayName = "Task ID";
            tooltip = "The order that the linked units will perform this task in when multiple tasks used. To use a priority order leave off. Default: OFF.";
            property = QEGVAR(AI,TaskId);
            control = QEGVAR(AI,numberSelect1Control);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,taskSet) {
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Hold Until";
            property = QEGVAR(AI,taskSet);
            control = QEGVAR(AI,taskControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "4";
        };
        class EGVAR(AI,occupyOptionSet) {
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or buildings. Default: OFF";
            property = QEGVAR(AI,occupyOptionSet);
            control = QEGVAR(AI,occupyoptionControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,changeWaypointWait) {
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            property = QEGVAR(AI,changeWaypointWait);
            control = QEGVAR(AI,waypointwaitControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "3";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,behaviourChange) {
            displayName = "Change Behaviour";
            tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
            property = QEGVAR(AI,behaviourChange);
            control = QEGVAR(AI,behaviourchangeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class EGVAR(AI,combatMode) {
            displayName = "Change CombatMode";
            tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
            property = QEGVAR(AI,combatMode);
            control = QEGVAR(AI,combatmodechangeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class EGVAR(AI,speed) {
            displayName = "Change Speed";
            tooltip = "Speed of the group or unit on activation. Default: Limited";
            property = QEGVAR(AI,speed);
            control = QEGVAR(AI,speedchangeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class EGVAR(AI,formation) {
            displayName = "Change Formation";
            tooltip = "Formation of the group or unit on activation. Default: WEDGE";
            property = QEGVAR(AI,formation);
            control = QEGVAR(AI,formationchangeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class EGVAR(AI,groupStance) {
            displayName = "Change Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            property = QEGVAR(AI,groupStance);
            control = QEGVAR(AI,stancechangeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class EGVAR(AI,taskCondition) {
            displayName = "Condition";
            tooltip = "Activate this task with a condition. Default: True";
            property = QEGVAR(AI,taskCondition);
            control = QEGVAR(AI,moduleconditionControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "";
            validate = "condition";
        };
        class EGVAR(AI,taskOnComplete) {
            displayName = "On Completion";
            tooltip = "Pass custom parameters or code when the group completes this task. (_this = [GROUP,TASK Module]) Default: Nil";
            property = QEGVAR(AI,taskOnComplete);
            control = QEGVAR(AI,codeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "(true)";
        };
        class EGVAR(AI,TaskPriority) {
            displayName = "Priority";
            tooltip = "Task priority allows the group to choose between two assigned tasks. Default: Medium";
            property = QEGVAR(AI,TaskPriority);
            control = QEGVAR(AI,taskpriorityControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class EGVAR(AI,PositionModule) : EGVAR(AI,Module) {
    scope = 2;
    displayName = "AI Position (Circle)";
    //icon = "\UO_FW\Resources\Icons\posmodule_ca.paa";
    function = QEFUNC(AI,position);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    curatorInfoType = "RscDisplayAttributeModuleNuke";
    canSetArea = 1;
    class AttributeValues {
        size2[] = {0,0};
        IsRectangle = 0;
    };
    class Attributes {
        class EGVAR(AI,positionType) {
            displayName = "Type of Position";
            tooltip = "Sets the type of position other modules will identify this position as. Default: Standard";
            property = QEGVAR(AI,positionType);
            control = QEGVAR(AI,positiontypeControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,positionRadiusX) {
            displayName = "Radius X";
            tooltip = "The X radius the position will use to generate a random position. Default: 0";
            property = QEGVAR(AI,positionRadiusX);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,positionRadiusY) {
            displayName = "Radius Y";
            tooltip = "The Y radius the position will use to generate a random position. Default: 0";
            property = QEGVAR(AI,positionRadiusY);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,positionWarnRadius) {
            displayName = "Warn Area Radius";
            tooltip = "Distance for player to be warned before entering area. Default: 20.";
            property = QEGVAR(AI,positionWarnRadius);
            control = QEGVAR(AI,standardNumberControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "20";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class EGVAR(AI,PositionModule_R) : EGVAR(AI,PositionModule) {
    displayName = "AI Position (Square)";
    class AttributeValues {
        size2[] = {0,0};
        IsRectangle = 1;
    };
};
class EGVAR(AI,RespawnModule) : EGVAR(AI,Module)  {
    scope = 2;
    displayName = "AI Respawn";
    //icon = "\UO_FW\Resources\Icons\respawnmodule_ca.paa";
    function = QEFUNC(AI,respawn);
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    class Attributes {
        class EGVAR(AI,respawnside) {
            displayName = "Respawn Side";
            tooltip = "Side of the unit that will respawn at the new location. Default: WEST";
            property = QEGVAR(AI,respawnside);
            control = QEGVAR(AI,ZonesideControl);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class EGVAR(AI,TemplateModule) : EGVAR(AI,Module) {
    scope = 2;
    displayName = "AI Group Template";
    //icon = "\UO_FW\Resources\Icons\templatemodule_ca.paa";
    function = QEFUNC(AI,temp);
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    icon = "\x\UO_FW\addons\Main\HeadlessAIModule\resources\aitemplatemodule_ca.paa";
};
