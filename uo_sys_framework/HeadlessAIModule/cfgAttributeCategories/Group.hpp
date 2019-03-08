class EGVAR(AI,GroupBehaviour) {
    displayName = "AI Group Behavour Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(AI,behaviour) {
            displayName = "Behaviour";
            tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
            property = QEGVAR(AI,behaviour);
            control = QEGVAR(AI,behaviourControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'safe'";
        };
        class EGVAR(AI,combatMode) {
            displayName = "CombatMode";
            tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
            property = QEGVAR(AI,combatMode);
            control = QEGVAR(AI,combatModeControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'red'";
        };
        class EGVAR(AI,speed) {
            displayName = "Speed";
            tooltip = "Speed of the group or unit on activation. Default: Limited";
            property = QEGVAR(AI,speed);
            control = QEGVAR(AI,speedControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'limited'";
        };
        class EGVAR(AI,formation) {
            displayName = "Formation";
            tooltip = "Formation of the group or unit on activation. Default: WEDGE";
            property = QEGVAR(AI,formation);
            control = QEGVAR(AI,formationControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'wedge'";
        };
        class EGVAR(AI,groupStance) {
            displayName = "Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            property = QEGVAR(AI,groupStance);
            control = QEGVAR(AI,stanceControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'auto'";
        };
        class EGVAR(AI,forceLights) {
            displayName = "Force Flashlights";
            tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
            property = QEGVAR(AI,forceLights);
            control = QEGVAR(AI,forcelightsControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(AI,surrender) {
            displayName = "Will Surrender";
            tooltip = "This group will surrender if there team leader dies or they take greater than 50% casualties. Default: False";
            property = QEGVAR(AI,surrender);
            control = QEGVAR(AI,boolControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(AI,groupInit) {
            displayName = "Group Init";
            tooltip = "Pass custom parameters or code to the group of units. ( _this = GROUP ) Default: Nil";
            property = QEGVAR(AI,groupInit);
            control = QEGVAR(AI,codeControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};
class EGVAR(AI,GroupTask) {
    displayName = "AI Group Task Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(AI,createRadius) {
            displayName = "Creation Radius";
            tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
            property = QEGVAR(AI,createRadius);
            control = QEGVAR(AI,standardNumberControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,patrolRadius) {
            displayName = "Task Radius";
            tooltip = "Radius that Group will conduct the assigned task in. Default: 30m";
            property = QEGVAR(AI,patrolRadius);
            control = QEGVAR(AI,patrolradiusControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,waypointWait) {
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            property = QEGVAR(AI,waypointWait);
            control = QEGVAR(AI,waypointwaitControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "3";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,startBuilding) {
            displayName = "Start in Building";
            tooltip = "Group will start inside nearest building then move out to conduct set task. Building Occupy tasks overide this setting. Default: Off";
            property = QEGVAR(AI,startBuilding);
            control = QEGVAR(AI,startbuildingControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(AI,task) {
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            property = QEGVAR(AI,task);
            control = QEGVAR(AI,taskControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "4";
        };
        class EGVAR(AI,TaskTimer) {
            displayName = "Time";
            tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
            property = QEGVAR(AI,TaskTimer);
            control = QEGVAR(AI,standardNumberAltControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class EGVAR(AI,GroupPopulate) {
    displayName = "AI Populate Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(AI,multiplier) {
            displayName = "Group Multiplier";
            tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
            property = QEGVAR(AI,multiplier);
            control = QEGVAR(AI,multiplierControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AI,multiOccupy) {
            displayName = "Multiplied Groups Occupy Options";
            tooltip = "How many generated groups from the group muliplier will use the occupy options below. Default: NO CHANGE";
            property = QEGVAR(AI,multiOccupy);
            control = QEGVAR(AI,multioccupyControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(AI,occupyOption) {
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or buildings. Default: OFF";
            property = QEGVAR(AI,occupyOption);
            control = QEGVAR(AI,occupyoptionControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
    };
};
class Init : Init {collapsed = 1;};
class State : State {collapsed = 1;};
