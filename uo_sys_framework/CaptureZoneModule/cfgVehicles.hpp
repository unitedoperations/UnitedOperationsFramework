class EGVAR(CaptureZone,CaptureZoneModule): EGVAR(Core,BaseModule) {
    displayName = "Capture Zone (Circle)"; // Name displayed in the menu
    // Name of function triggered once conditions are met
    function = QEFUNC(CaptureZone,CaptureZone);
    // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
    functionPriority = 0;
    scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
    isGlobal = 0;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    curatorInfoType = "RscDisplayAttributeModuleNuke";
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\x\UO_FW\addons\Main\CaptureZoneModule\resources\capzonemodule_ca.paa";

    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 0;
      };

    class Attributes {
        class EGVAR(CaptureZone,ZoneName) {
            displayName = "Zone name";
            tooltip = "Name of CaptureZone used in End Conditions reference and in automated message mode. Also a variable that gets set to true once the CaptureZone is captured.";
            property = QEGVAR(CaptureZone,ZoneName);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'CaptureZone'";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,RadiusX) {
            displayName = "Activation Radius X";
            tooltip = "The size of the X value of the capture zone. Default: 100";
            property = QEGVAR(CaptureZone,RadiusX);
            control = QEGVAR(Core,RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,RadiusY) {
            displayName = "Activation Radius Y";
            tooltip = "The size of the Y value of the capture zone. Default: 100";
            property = QEGVAR(CaptureZone,RadiusY);
            control = QEGVAR(Core,RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,RatioNeeded) {
            displayName = "Ratio Needed";
            tooltip = "Ratio needed to capture the zone. Larger team / team in second place.";
            property = QEGVAR(CaptureZone,RatioNeeded);
            control = QMGVAR(1To100Step5_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "75";
            validate = "NUMBER";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Cap_Blufor) {
            displayName = "Blufor";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_Blufor);
            control = QEGVAR(CaptureZone,TeamAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Blufor) {
            displayName = "Blufor Time";
            tooltip = "Time needed for Blufor to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_Blufor);
            control = QMGVAR(0To600Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,MessageCapturing_Blufor) {
            displayName = "Blufor Capturing Message";
            tooltip = "Message to display when Blufor is capturing the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCapturing_Blufor);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'BLUFOR is capturing the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,MessageCaptured_Blufor) {
            displayName = "Blufor Capturing Message";
            tooltip = "Message to display when Blufor captures the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCaptured_Blufor);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'BLUFOR has captured the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colour_Blufor) {
            displayName = "Blufor Colour";
            tooltip = "Blufor Colour";
            property = QEGVAR(CaptureZone,Colour_Blufor);
            control = QEGVAR(CaptureZone,ColourCombo);
            expression = MODULE_EXPRESSION;
            defaultValue = "'colorBLUFOR'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Cap_Opfor) {
            displayName = "Opfor";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_Opfor);
            control = QEGVAR(CaptureZone,TeamAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Opfor) {
            displayName = "Opfor Time";
            tooltip = "Time needed for Opfor to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_Opfor);
            control = QMGVAR(0To600Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,MessageCapturing_Opfor) {
            displayName = "Opfor Capturing Message";
            tooltip = "Message to display when Opfor is capturing the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCapturing_Opfor);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'Opfor is capturing the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,MessageCaptured_Opfor) {
            displayName = "Opfor Captured Message";
            tooltip = "Message to display when Opfor captures the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCaptured_Opfor);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'Opfor has captured the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colour_Opfor) {
            displayName = "Opfor Colour";
            tooltip = "Opfor Colour";
            property = QEGVAR(CaptureZone,Colour_Opfor);
            control = QEGVAR(CaptureZone,ColourCombo);
            expression = MODULE_EXPRESSION;
            defaultValue = "'colorOPFOR'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Cap_Indfor) {
            displayName = "Independent";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_Indfor);
            control = QEGVAR(CaptureZone,TeamAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Indfor) {
            displayName = "Independent Time";
            tooltip = "Time needed for Independent to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_Indfor);
            control = QMGVAR(0To600Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,MessageCapturing_Indfor) {
            displayName = "Indfor Capturing Message";
            tooltip = "Message to display when Indfor is capturing the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCapturing_Indfor);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'Indfor is capturing the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,MessageCaptured_Indfor) {
            displayName = "Indfor Captured Message";
            tooltip = "Message to display when Indfor captures the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCaptured_Indfor);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'Indfor has captured the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colour_Indfor) {
            displayName = "Indfor Colour";
            tooltip = "Indfor Colour";
            property = QEGVAR(CaptureZone,Colour_Indfor);
            control = QEGVAR(CaptureZone,ColourCombo);
            expression = MODULE_EXPRESSION;
            defaultValue = "'colorIndependent'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Cap_Civ) {
            displayName = "Civilian";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_Civ);
            control = QEGVAR(CaptureZone,TeamAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Civ) {
            displayName = "Civilian Time";
            tooltip = "Time needed for Civilian to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_Civ);
            control = QMGVAR(0To600Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,MessageCapturing_Civ) {
            displayName = "Civilian Capturing Message";
            tooltip = "Message to display when Civilian is capturing the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCapturing_Civ);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'Civilian is capturing the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,MessageCaptured_Civ) {
            displayName = "Civilian Captured Message";
            tooltip = "Message to display when Civilian captures the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,MessageCaptured_Civ);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'Civilian has captured the zone!'";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colour_Civ) {
            displayName = "Civilian Colour";
            tooltip = "Civilian Colour";
            property = QEGVAR(CaptureZone,Colour_Civ);
            control = QEGVAR(CaptureZone,ColourCombo);
            expression = MODULE_EXPRESSION;
            defaultValue = "'colorCivilian'";
            validate = "none";
        };
        class EGVAR(CaptureZone,ContestedMessage) {
            displayName = "Contested Message";
            tooltip = "Message to display when the zone is contested. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,ContestedMessage);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'The zone is contested!'";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colour_Contested) {
            displayName = "Contested Colour";
            tooltip = "Contested Colour";
            property = QEGVAR(CaptureZone,Colour_Contested);
            control = QEGVAR(CaptureZone,ColourCombo);
            expression = MODULE_EXPRESSION;
            defaultValue = "'ColorYellow'";
            validate = "none";
        };
        class EGVAR(CaptureZone,UncontestedMessage) {
            displayName = "Uncontested Message";
            tooltip = "Message to display when the zone is uncontested. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,UncontestedMessage);
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "'The zone is uncontested!'";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colour_Uncontested) {
            displayName = "Uncontested Colour";
            tooltip = "Uncontested Colour";
            property = QEGVAR(CaptureZone,Colour_Uncontested);
            control = QEGVAR(CaptureZone,ColourCombo);
            expression = MODULE_EXPRESSION;
            defaultValue = "'ColorGrey'";
            validate = "none";
        };
        class EGVAR(CaptureZone,AutoMessages) {
            displayName = "Automated Messages";
            tooltip = "Enables automated messages based off of zone name. eg. For a zone named 'Everon' and a team called 'USMC', message would be 'USMC is capturing Everon!'";
            property = QEGVAR(CaptureZone,AutoMessages);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Hidden) {
            displayName = "Hidden";
            tooltip = "Hides the CaptureZone on the map. No markers are displayed if setting is enabled.";
            property = QEGVAR(CaptureZone,Hidden);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Silent) {
            displayName = "Silent";
            tooltip = "Does not show CaptureZone hints to players. No hints are displayed if this setting is enabled.";
            property = QEGVAR(CaptureZone,Silent);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Mode) {
            displayName = "Recapture";
            tooltip = "Can this area be recaptured? If disabled, zone will deactivate once a CaptureZone team captures it.";
            property = QEGVAR(CaptureZone,Mode);
            control = QEGVAR(CaptureZone,ModeAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
            validate = "none";
        };
        class EGVAR(CaptureZone,Condition) {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this zone to be captured. Default: true";
            property = QEGVAR(CaptureZone,Condition);
            control = "EditCode";
            expression = MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};

class EGVAR(CaptureZone,CaptureZoneModule_R) : EGVAR(CaptureZone,CaptureZoneModule) {
    displayName = "Capture Zone (Rectangle)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};
