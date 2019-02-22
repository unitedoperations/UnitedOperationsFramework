class UO_FW_Gear_Settings {
    displayName = "Gear Settings";
    class AttributeCategories {
        class UO_FW_Gear_Ace_Arsenal {
            displayName = "Ace Arsenal Gear Settings";
            collapsed = 0;
            class Attributes {
                class UO_FW_Gear_ACEAR_System_Enabled {
                    property = "UO_FW_Gear_ACEAR_System_Enabled";
                    displayName = "Enable ACE Arsenal System";
                    tooltip = "Should Gear System be enabled";
                    control = "CheckboxState";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
            };
        };
        class UO_FW_Gear_Olsen {
            displayName = "Olsen Gear Settings";
            collapsed = 0;
            class Attributes {
                class UO_FW_Gear_Olsen_Enabled {
                    property = "UO_FW_Gear_Olsen_Enabled";
                    displayName = "Enable Olsen System";
                    tooltip = "Should Olsen Gear be enabled";
                    control = "CheckboxState";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
                class UO_FW_Gear_Olsen_OverfillEnabled {
                    property = "UO_FW_Gear_Olsen_OverfillEnabled";
                    displayName = "Enable Gear overfill";
                    tooltip = "Forces adding an item to inventory. Works only if container is specified!";
                    control = "Checkbox";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
                class UO_FW_Gear_Olsen_FaceRemovalEnabled {
                    property = "UO_FW_Gear_Olsen_FaceRemovalEnabled";
                    displayName = "Force remove facewear";
                    tooltip = "When set to false, facewear types that are whitelisted will not be removed";
                    control = "Checkbox";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "false";
                };
                class UO_FW_Gear_Olsen_PathToGear {
                    property = "UO_FW_Gear_Olsen_PathToGear";
                    displayName = "Path to Gearscript";
                    tooltip = "Path to the gearscript file in your mission folder";
                    control = "EditShort";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "'GearScript.sqf'";
                };
            };
        };
    };
};

class UO_FW_GearSettings_Blufor {
    displayName = "Blufor Gear Settings";
    class AttributeCategories {
        #include "Gear\BluforMenu.hpp"
    };
};

class UO_FW_GearSettings_Opfor {
    displayName = "Opfor Gear Settings";
    class AttributeCategories {
        #include "Gear\OpforMenu.hpp"
    };
};

class UO_FW_GearSettings_Indfor {
    displayName = "Indfor Gear Settings";
    class AttributeCategories {
        #include "Gear\IndforMenu.hpp"
    };
};

class UO_FW_GearSettings_CIV {
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
