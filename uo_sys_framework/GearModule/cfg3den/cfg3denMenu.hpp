class UO_FW_Gear_Settings
{
    displayName = "Gear Settings";
    class AttributeCategories
    {
        class UO_FW_Gear
        {
            displayName = "Gear Settings";
            collapsed = 0;
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
            };
        };

    };
};
