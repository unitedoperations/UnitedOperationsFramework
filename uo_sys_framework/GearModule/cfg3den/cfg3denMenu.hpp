class UO_FW_Gear_Settings
{
    displayName = "Gear Settings";
    class AttributeCategories
    {
        class UO_FW_Gear
        {
            displayName = "Gear Settings";
            collapsed = 1;
            class Attributes
            {
                 class UO_FW_Gear_Enabled
                {
                    property = "UO_FW_Gear_Enabled";
                    displayName = "Enable Gear";
                    tooltip = "Should Gear be enabled";
                    control = "CheckboxState";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "false";
                };
                class UO_FW_GearOverfillEnabled
                {
                    property = "UO_FW_GearOverfillEnabled";
                    displayName = "Enable Gear overfill";
                    tooltip = "Forces adding an item to inventory. Works only if container is specified!";
                    control = "Checkbox";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "false";
                };
                class UO_FW_GearFaceRemovalEnabled
                {
                    property = "UO_FW_GearFaceRemovalEnabled";
                    displayName = "Force remove facewear";
                    tooltip = "When set to false, facewear types that are whitelisted will not be removed";
                    control = "Checkbox";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "false";
                };
                class UO_FW_Gear_PathToGear
                {
                    property = "UO_FW_Gear_PathToGear";
                    displayName = "Path to Gearscript";
                    tooltip = "Path to the gearscript file in your mission folder";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "'GearScript.sqf'";
                };
                /*class UO_FW_GearPath_1
                {
                    property = "UO_FW_GearPath_1";
                    displayName = "Gear 1";
                    tooltip = "Path to Orbat file of Gear 1";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_2
                {
                    property = "UO_FW_GearPath_2";
                    displayName = "Gear 2";
                    tooltip = "Path to Orbat file of Gear 2";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_3
                {
                    property = "UO_FW_GearPath_3";
                    displayName = "Gear 3";
                    tooltip = "Path to Orbat file of Gear 3";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_4
                {
                    property = "UO_FW_GearPath_4";
                    displayName = "Gear 4";
                    tooltip = "Path to Orbat file of Gear 4";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_5
                {
                    property = "UO_FW_GearPath_5";
                    displayName = "Gear 5";
                    tooltip = "Path to Orbat file of Gear 5";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_6
                {
                    property = "UO_FW_GearPath_6";
                    displayName = "Gear 6";
                    tooltip = "Path to Orbat file of Gear 6";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_7
                {
                    property = "UO_FW_GearPath_7";
                    displayName = "Gear 7";
                    tooltip = "Path to Orbat file of Gear 7";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_8
                {
                    property = "UO_FW_GearPath_8";
                    displayName = "Gear 8";
                    tooltip = "Path to Orbat file of Gear 8";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_9
                {
                    property = "UO_FW_GearPath_9";
                    displayName = "Gear 9";
                    tooltip = "Path to Orbat file of Gear 9";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };
                class UO_FW_GearPath_10
                {
                    property = "UO_FW_GearPath_10";
                    displayName = "Gear 10";
                    tooltip = "Path to Orbat file of Gear 10";
                    control = "EditShort";
                    expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
                    defaultValue = "''";
                };*/
            };
        };

    };
};
