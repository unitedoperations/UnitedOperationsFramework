
#include "cfgFSM.hpp"

class UO_FW_AI_Module : OlsenModule {
    scope = 1;
    category = "UO_FrameworkCategory_AI";
    icon = "\a3\3DEN\Data\CfgWaypoints\scripted_ca.paa";
};

class UO_FW_AI_ZoneModule : UO_FW_AI_Module {
    scope = 2;
    displayName = "AI Zone (Circle)";
    //icon = "\UO_FW\Resources\Icons\zonemodule_ca.paa";
    function = "UO_FW_AI_fnc_zone";
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
        class UO_FW_AI_zoneInitial {
            displayName = "Initial Spawn";
            tooltip = "Enabling activates the zone on init, spawning units on the start of the mission. Default disabled.";
            property = "UO_FW_AI_zoneInitial";
            control = "CheckboxStateReversed";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_AI_zoneRadiusX {
            displayName = "Activation Radius X";
            tooltip = "The size of the X value of the area the player will initiate this zone at in metres. Default: 100";
            property = "UO_FW_AI_zoneRadiusX";
            control = "UO_FW_AI_moduleradiusControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_zoneRadiusY {
            displayName = "Activation Radius Y";
            tooltip = "The size of the Y value of the area the player will initiate this zone at in metres. Default: 100";
            property = "UO_FW_AI_zoneRadiusY";
            control = "UO_FW_AI_moduleradiusControl2";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_zoneDelay {
            displayName = "Delay";
            tooltip = "Delay after zone is activated that actual spawning occurs. Default 0 secs";
            property = "UO_FW_AI_zoneDelay";
            control = "UO_FW_AI_zoneDelayControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_zoneOn {
            displayName = "Suspension";
            tooltip = "Suspending the zone to be enabled later, suspended zones will not detect player is with in radius or that a custom condition is met until zone is enabled. Default: Enabled";
            property = "UO_FW_AI_zoneOn";
            control = "UO_FW_AI_zoneOnControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_Zoneside {
            displayName = "Activating Unit Side";
            tooltip = "Side of the unit that activates the zone. Default: ANY";
            property = "UO_FW_AI_Zoneside";
            control = "UO_FW_AI_ZonesideControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "4";
        };
        class UO_FW_AI_zoneType {
            displayName = "Activating Unit Type";
            tooltip = "Type of unit the player is that activates the zone. Default all Units";
            property = "UO_FW_AI_zoneType";
            control = "UO_FW_AI_zoneTypeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_zoneCondition {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this zone to be activated, condition true will spawn the zone. Default: Nil";
            property = "UO_FW_AI_zoneCondition";
            control = "UO_FW_AI_moduleconditionControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'false'";
        };
        class UO_FW_AI_zoneCode {
            displayName = "Custom Code";
            tooltip = "Pass custom code to be executed when zone is activated. Default: Nil";
            property = "UO_FW_AI_zoneCode";
            control = "UO_FW_AI_codeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};
class UO_FW_AI_ZoneModule_R : UO_FW_AI_ZoneModule {
    displayName = "AI Zone (Square)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};

class UO_FW_AI_ControlModule : UO_FW_AI_Module {
    scope = 2;
    displayName = "AI Control (Circle)";
    //icon = "\UO_FW\Resources\Icons\controlmodule_ca.paa";
    function = "UO_FW_AI_fnc_control";
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
        class UO_FW_AI_ControlRadiusX {
            displayName = "Activation Radius X";
            tooltip = "The size of the X value of the area the player will initiate the control zone at in metres. Default: 100";
            property = "UO_FW_AI_ControlRadiusX";
            control = "UO_FW_AI_moduleradiusControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_ControlRadiusY {
            displayName = "Activation Radius Y";
            tooltip = "The size of the Y value of the area the player will initiate the control zone at in metres. Default: 100";
            property = "UO_FW_AI_ControlRadiusY";
            control = "UO_FW_AI_moduleradiusControl2";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_controlOn {
            displayName = "Suspension";
            tooltip = "Suspending the control module to be enabled later, suspended control modules will not detect player is with in radius or that a custom condition is met until enabled. Default: Enabled";
            property = "UO_FW_AI_controlOn";
            control = "UO_FW_AI_zoneOnControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_ControlInitAction {
            displayName = "Initiate Action";
            tooltip = "The action the control module performs to linked zones when initiated, toggle Enable,Disable or Do Nothing. Default: Do Nothing";
            property = "UO_FW_AI_ControlInitAction";
            control = "UO_FW_AI_initActionControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_ControlAction {
            displayName = "Activate Action";
            tooltip = "The action the control module performs to linked zones when activated, toggle Enable or Disable. Default: Enable";
            property = "UO_FW_AI_ControlAction";
            control = "UO_FW_AI_actionControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_ControlDelay {
            displayName = "Delay";
            tooltip = "Delay after control module is activated that actual toggle of linked zones occurs. Default: 0secs";
            property = "UO_FW_AI_ControlDelay";
            control = "UO_FW_AI_zoneDelayControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_ControlSide {
            displayName = "Activating Player Side";
            tooltip = "Side of the player that activates the control module. Default: WEST";
            property = "UO_FW_AI_ControlSide";
            control = "UO_FW_AI_ZonesideControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_ControlType {
            displayName = "Activating Player Type";
            tooltip = "Type of unit the player is that activates the control module. Default: All Units";
            property = "UO_FW_AI_ControlType";
            control = "UO_FW_AI_zoneTypeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_ControlCondition {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this control module to be activated, condition true will initiate the control module. Default: Nil";
            property = "UO_FW_AI_ControlCondition";
            control = "UO_FW_AI_moduleconditionControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'false'";
            validate = "condition";
        };
        class UO_FW_AI_ControlCode {
            displayName = "Custom Code";
            tooltip = "Pass custom code to be executed when the control module is activated. Default: Nil";
            property = "UO_FW_AI_ControlCode";
            control = "UO_FW_AI_codeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};
class UO_FW_AI_ControlModule_R : UO_FW_AI_ControlModule {
    displayName = "AI Control (Square)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};

class UO_FW_AI_TaskModule : UO_FW_AI_Module {
    scope = 2;
    displayName = "AI Task";
    //icon = "\UO_FW\Resources\Icons\taskmodule_ca.paa";
    function = "UO_FW_AI_fnc_task";
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
        class UO_FW_AI_taskRadius {
            displayName = "Radius";
            tooltip = "The range the group will attempt to conduct the set task in. Default: 100";
            property = "UO_FW_AI_taskRadius";
            control = "UO_FW_AI_moduleradiusControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_TaskTime {
            displayName = "Time";
            tooltip = "How long the linked units will perform this task. Default: 0 (forever).";
            property = "UO_FW_AI_TaskTime";
            control = "UO_FW_AI_standardNumberControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_TaskId {
            displayName = "Task ID";
            tooltip = "The order that the linked units will perform this task in when multiple tasks used. To use a priority order leave off. Default: OFF.";
            property = "UO_FW_AI_TaskId";
            control = "UO_FW_AI_numberSelect1Control";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_taskSet {
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Hold Until";
            property = "UO_FW_AI_taskSet";
            control = "UO_FW_AI_taskControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "4";
        };
        class UO_FW_AI_occupyOptionSet {
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or buildings. Default: OFF";
            property = "UO_FW_AI_occupyOptionSet";
            control = "UO_FW_AI_occupyoptionControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_changeWaypointWait {
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            property = "UO_FW_AI_changeWaypointWait";
            control = "UO_FW_AI_waypointwaitControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "3";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_behaviourChange {
            displayName = "Change Behaviour";
            tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
            property = "UO_FW_AI_behaviourChange";
            control = "UO_FW_AI_behaviourchangeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class UO_FW_AI_combatMode {
            displayName = "Change CombatMode";
            tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
            property = "UO_FW_AI_combatMode";
            control = "UO_FW_AI_combatmodechangeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class UO_FW_AI_speed {
            displayName = "Change Speed";
            tooltip = "Speed of the group or unit on activation. Default: Limited";
            property = "UO_FW_AI_speed";
            control = "UO_FW_AI_speedchangeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class UO_FW_AI_formation {
            displayName = "Change Formation";
            tooltip = "Formation of the group or unit on activation. Default: WEDGE";
            property = "UO_FW_AI_formation";
            control = "UO_FW_AI_formationchangeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class UO_FW_AI_groupStance {
            displayName = "Change Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            property = "UO_FW_AI_groupStance";
            control = "UO_FW_AI_stancechangeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'unchanged'";
        };
        class UO_FW_AI_taskCondition {
            displayName = "Condition";
            tooltip = "Activate this task with a condition. Default: True";
            property = "UO_FW_AI_taskCondition";
            control = "UO_FW_AI_moduleconditionControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "";
            validate = "condition";
        };
        class UO_FW_AI_taskOnComplete {
            displayName = "On Completion";
            tooltip = "Pass custom parameters or code when the group completes this task. (_this = [GROUP,TASK Module]) Default: Nil";
            property = "UO_FW_AI_taskOnComplete";
            control = "UO_FW_AI_codeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "(true)";
        };
        class UO_FW_AI_TaskPriority {
            displayName = "Priority";
            tooltip = "Task priority allows the group to choose between two assigned tasks. Default: Medium";
            property = "UO_FW_AI_TaskPriority";
            control = "UO_FW_AI_taskpriorityControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class UO_FW_AI_PositionModule : UO_FW_AI_Module {
    scope = 2;
    displayName = "AI Position (Circle)";
    //icon = "\UO_FW\Resources\Icons\posmodule_ca.paa";
    function = "UO_FW_AI_fnc_position";
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
        class UO_FW_AI_positionType {
            displayName = "Type of Position";
            tooltip = "Sets the type of position other modules will identify this position as. Default: Standard";
            property = "UO_FW_AI_positionType";
            control = "UO_FW_AI_positiontypeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_AI_positionRadiusX {
            displayName = "Radius X";
            tooltip = "The X radius the position will use to generate a random position. Default: 0";
            property = "UO_FW_AI_positionRadiusX";
            control = "UO_FW_AI_moduleradiusControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_positionRadiusY {
            displayName = "Radius Y";
            tooltip = "The Y radius the position will use to generate a random position. Default: 0";
            property = "UO_FW_AI_positionRadiusY";
            control = "UO_FW_AI_moduleradiusControl2";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class UO_FW_AI_positionWarnRadius {
            displayName = "Warn Area Radius";
            tooltip = "Distance for player to be warned before entering area. Default: 20.";
            property = "UO_FW_AI_positionWarnRadius";
            control = "UO_FW_AI_standardNumberControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "20";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class UO_FW_AI_PositionModule_R : UO_FW_AI_PositionModule {
    displayName = "AI Position (Square)";
    class AttributeValues {
        size2[] = {0,0};
        IsRectangle = 1;
    };
};
class UO_FW_AI_RespawnModule : UO_FW_AI_Module {
    scope = 2;
    displayName = "AI Respawn";
    //icon = "\UO_FW\Resources\Icons\respawnmodule_ca.paa";
    function = "UO_FW_AI_fnc_respawn";
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    class Attributes {
        class UO_FW_AI_respawnside {
            displayName = "Respawn Side";
            tooltip = "Side of the unit that will respawn at the new location. Default: WEST";
            property = "UO_FW_AI_respawnside";
            control = "UO_FW_AI_ZonesideControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class UO_FW_AI_TemplateModule : UO_FW_AI_Module {
    scope = 2;
    displayName = "AI Group Template";
    //icon = "\UO_FW\Resources\Icons\templatemodule_ca.paa";
    function = "UO_FW_AI_fnc_temp";
    functionPriority = 1;
    isGlobal = 2;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    icon = "\x\UO_FW\addons\Main\HeadlessAIModule\resources\aitemplatemodule_ca.paa";
};
