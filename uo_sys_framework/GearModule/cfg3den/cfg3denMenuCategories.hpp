class EGVAR(Gear,Settings) {
    displayName = "Gear Settings";
    class AttributeCategories {
        class EGVAR(Gear,Ace_Arsenal) {
            displayName = "Ace Arsenal Gear Settings";
            collapsed = 0;
            class Attributes {
                class EGVAR(Gear,ACEAR_System_Enabled) {
                    property = QEGVAR(Gear,ACEAR_System_Enabled);
                    displayName = "Enable ACE Arsenal System";
                    tooltip = "Should Gear System be enabled";
                    control = "CheckboxState";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
            };
        };
        class EGVAR(Gear,Olsen) {
            displayName = "Olsen Gear Settings";
            collapsed = 0;
            class Attributes {
                class EGVAR(Gear,Olsen_Enabled) {
                    property = QEGVAR(Gear,Olsen_Enabled);
                    displayName = "Enable Olsen System";
                    tooltip = "Should Olsen Gear be enabled";
                    control = "CheckboxState";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
                class EGVAR(Gear,Olsen_OverfillEnabled) {
                    property = QEGVAR(Gear,Olsen_OverfillEnabled);
                    displayName = "Enable Gear overfill";
                    tooltip = "Forces adding an item to inventory. Works only if container is specified!";
                    control = "Checkbox";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
                class EGVAR(Gear,Olsen_FaceRemovalEnabled) {
                    property = QEGVAR(Gear,Olsen_FaceRemovalEnabled);
                    displayName = "Force remove facewear";
                    tooltip = "When set to false, facewear types that are whitelisted will not be removed";
                    control = "Checkbox";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
                class EGVAR(Gear,Olsen_PathToGear) {
                    property = QEGVAR(Gear,Olsen_PathToGear);
                    displayName = "Path to Gearscript";
                    tooltip = "Path to the gearscript file in your mission folder";
                    control = "EditShort";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "'Gear.sqf'";
                };
            };
        };
    };
};

#define GEAR_TYPECONFIG_OLSEN(TEAMNAME,SHORTNAME)  \
class PREFIX##_Gear_Olsen_LoadoutType_##TEAMNAME##_##SHORTNAME {\
    property = QUOTE(TRIPLES(PREFIX##_Gear_Olsen_LoadoutType,TEAMNAME,SHORTNAME));\
    displayName = CSTRING_2(Gear_DisplayName,SHORTNAME);\
    tooltip = CSTRING_2(Gear_ToolTip_Olsen,SHORTNAME);\
    control = QUOTE(Edit);\
    typeName = QUOTE(STRING);\
    expression = SCENARIO_EXPRESSION;\
    defaultValue = QUOTE('');\
}

#define GEAR_TYPECONFIG_ACEAR(TEAMNAME,SHORTNAME) \
class PREFIX##_Gear_ACE_Arsenal_LoadoutType_##TEAMNAME##_##SHORTNAME {\
    property = QUOTE(TRIPLES(PREFIX##_Gear_ACE_Arsenal_LoadoutType,TEAMNAME,SHORTNAME));\
    displayName = CSTRING_2(Gear_DisplayName,SHORTNAME);\
    tooltip = CSTRING_2(Gear_ToolTip_ACEAR,SHORTNAME);\
    control = QUOTE(TRIPLES(PREFIX,Gear,ACE_Arsenal_LoadoutClassCombo));\
    typeName = QUOTE(STRING);\
    expression = SCENARIO_EXPRESSION;\
    defaultValue = QUOTE('NONE');\
}

class EGVAR(Gear,Menu_Blufor) {
    displayName = "Blufor Gear Settings";
    class AttributeCategories {
        #include "Gear\BluforMenu.hpp"
    };
};

class EGVAR(Gear,Menu_Opfor) {
    displayName = "Opfor Gear Settings";
    class AttributeCategories {
        #include "Gear\OpforMenu.hpp"
    };
};

class EGVAR(Gear,Menu_Indfor) {
    displayName = "Indfor Gear Settings";
    class AttributeCategories {
        #include "Gear\IndforMenu.hpp"
    };
};

class EGVAR(Gear,Menu_Civ) {
    displayName = "Civilian Gear Settings";
    class AttributeCategories {
        #include "Gear\CivilianMenu.hpp"
    };
};

class ace_arsenal_DummyCategory {
    displayName="Dummy attribute, should never show up";
    class AttributeCategories {
        class ACE3_Arsenal {
            class Attributes {
                class ace_arsenal_DefaultLoadoutsListAttribute {
                    property="ace_arsenal_DefaultLoadoutsListAttribute";
                    value=0;
                    expression = "missionNamespace setvariable ['ace_arsenal_defaultLoadoutsList', _value, true];";
                    defaultValue="[]";
                    validate="none";
                    wikiType="[[Array]]";
                };
            };
        };
    };
};
