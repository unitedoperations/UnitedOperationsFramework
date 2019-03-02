class EGVAR(AI,UnitOptions) {
    displayName = "AI Unit Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(AI,unitName) {
            displayName = "Name";
            tooltip = "Pass custom name to the unit. Default: Nil";
            property = QEGVAR(AI,unitName);
            control = "UO_FW_AI_unitnameControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(AI,unitIdentity) {
            displayName = "Identity";
            tooltip = "Set the custom name to appear when the units Identity is checked. Default: Nil";
            property = QEGVAR(AI,unitIdentity);
            control = "UO_FW_AI_standardStringOneControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(AI,unitPersistent) {
            displayName = "Persistent";
            tooltip = "Is the unit persistent, will be it get cleaned up by the clean up script if it dies. Default: Persistent";
            property = QEGVAR(AI,unitPersistent);
            control = "UO_FW_AI_persistentControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
        };
        class EGVAR(AI,stance) {
            displayName = "Stance";
            tooltip = "Force the stance of the unit. Default: AUTO";
            property = QEGVAR(AI,stance);
            control = "UO_FW_AI_stanceControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            defaultValue = "'auto'";
            condition = "objectControllable";
        };
        class EGVAR(AI,Gear_UnitSystemType) {
            displayName = "Gear System Type";
            tooltip = "Set the gear system type for the unit.";
            control = "UO_FW_Gear_SystemType";
            typeName = "STRING";
            property = QEGVAR(AI,Gear_UnitSystemType);
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class EGVAR(AI,Gear_UnitGearType) {
            displayName = "Gear Type";
            tooltip = "Set the gear type for the unit. If set to ACE or Olsen gear mode, this corresponds to the types defined in the gear team settings.";
            control = "UO_FW_Gear_ComboGearLoad";
            GearSystems[] = {"ACEAR","OLSEN","NONE"};
            property = QEGVAR(AI,Gear_UnitGearType);
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class EGVAR(AI,Gear_UnitGearManualType) {
            property = QEGVAR(AI,Gear_UnitGearManualType);
            displayName = "Custom Gear Type";
            GearSystems[] = {"ACEAR","OLSEN"};
            tooltip = "Defines a custom gear class. If set to ACE gear system, this corresponds to the name of an ACE mission loadout. If set to Olsen gear system, this corresponds to the name of gear type in the team olsen gear script. Leave blank to disable.";
            control = "UO_FW_Gear_ManualGearEditShort";
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            defaultValue = "''";
        };
        class EGVAR(AI,Gear_VehicleSystemType) {
            displayName = "Gear System Type";
            tooltip = "Set the gear system type for the vehicle.";
            control = "UO_FW_Gear_SystemTypeVehicle";
            typeName = "STRING";
            property = QEGVAR(AI,Gear_VehicleSystemType);
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class EGVAR(AI,Gear_VehicleGearManualType) {
            property = QEGVAR(AI,Gear_VehicleGearManualType);
            displayName = "Custom Gear Type";
            GearSystems[] = {"OLSEN"};
            tooltip = "Defines a custom gear class. If set to Olsen gear system, this corresponds to the name of gear type in the team olsen gear script. Leave blank to disable.";
            control = "UO_FW_Gear_ManualGearEditShort";
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "''";
        };
        class EGVAR(AI,unitInit) {
            displayName = "Init";
            tooltip = "Pass custom parameters or code to the unit.( _this = unit ) Default: Nil";
            property = QEGVAR(AI,unitInit);
            control = "UO_FW_AI_codeunitControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            defaultValue = "";
        };
        class EGVAR(AI,unitFlying) {
            displayName = "Flying";
            tooltip = "Is the unit spawning in flight. Default: False";
            property = QEGVAR(AI,unitFlying);
            control = "UO_FW_AI_flyingControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(AI,unitFlyInHeight) {
            displayName = "Flight Height";
            tooltip = "Set the unit flying height. Default: 250";
            property = QEGVAR(AI,unitFlyInHeight);
            control = "UO_FW_AI_flyinheightControl";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = 250;
            typeName = "NUMBER";
        };
    };
};
class Init : Init {collapsed = 1;};
class Transformation : Transformation {collapsed = 1;};
class Control : Control {collapsed = 1;};
class State : State {collapsed = 1;};
