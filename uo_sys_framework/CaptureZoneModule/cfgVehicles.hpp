class UO_FW_CaptureZoneModule: OlsenModule {
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
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "''";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,RadiusX) {
            displayName = "Activation Radius X";
            tooltip = "The size of the X value of the capture zone. Default: 100";
            property = QEGVAR(CaptureZone,RadiusX);
            control = "UO_FW_AI_moduleradiusControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,RadiusY) {
            displayName = "Activation Radius Y";
            tooltip = "The size of the Y value of the capture zone. Default: 100";
            property = QEGVAR(CaptureZone,RadiusY);
            control = "UO_FW_AI_moduleradiusControl2";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,RatioNeeded) {
            displayName = "Ratio Needed";
            tooltip = "Ratio needed to capture the zone. Larger team / team in second place.";
            property = QEGVAR(CaptureZone,RatioNeeded);
            control = "UO_FW_1To100Step5_Slider";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "75";
            validate = "NUMBER";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Cap_Blufor) {
            displayName = "Blufor";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_Blufor);
            control = "UO_FW_CaptureZone_TeamAttribute";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Blufor) {
            displayName = "Blufor Time";
            tooltip = "Time needed for Blufor to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_Blufor);
            control = "UO_FW_0To600Step1_Slider";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,Message_Blufor) {
            displayName = "Blufor Message";
            tooltip = "Message to display when Blufor is capturing the zone and when they capture the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,Message_Blufor);
            control = "EditStringArray";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "['BLUFOR is capturing the zone!','BLUFOR has captured the zone!']";
            validate = "none";
        };
        class EGVAR(CaptureZone,Cap_Opfor) {
            displayName = "Opfor";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_Opfor);
            control = "UO_FW_CaptureZone_TeamAttribute";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Opfor) {
            displayName = "Opfor Time";
            tooltip = "Time needed for Opfor to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_Opfor);
            control = "UO_FW_0To600Step1_Slider";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,Message_Opfor) {
            displayName = "Opfor Message";
            tooltip = "Message to display when Opfor is capturing the zone and when they capture the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,Message_Opfor);
            control = "EditStringArray";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "['OPFOR is capturing the zone!','OPFOR has captured the zone!']";
            validate = "none";
        };
        class EGVAR(CaptureZone,Cap_INDFOR) {
            displayName = "Independent";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_INDFOR);
            control = "UO_FW_CaptureZone_TeamAttribute";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_INDFOR) {
            displayName = "Independent Time";
            tooltip = "Time needed for Independent to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_INDFOR);
            control = "UO_FW_0To600Step1_Slider";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,Message_INDFOR) {
            displayName = "Independent Message";
            tooltip = "Message to display when Independent is capturing the zone and when they capture the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,Message_INDFOR);
            control = "EditStringArray";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "['Independent is capturing the zone!','Independent has captured the zone!']";
            validate = "none";
        };
        class EGVAR(CaptureZone,Cap_Civilian) {
            displayName = "Civilian";
            tooltip = "Whether or not the team can capture the zone, and whether they are checked in the player count.";
            property = QEGVAR(CaptureZone,Cap_CIV);
            control = "UO_FW_CaptureZone_TeamAttribute";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };
        class EGVAR(CaptureZone,Time_Civilian) {
            displayName = "Civilian Time";
            tooltip = "Time needed for Civilian to capture the zone in seconds. Set to 0 for instant capture";
            property = QEGVAR(CaptureZone,Time_CIV);
            control = "UO_FW_0To600Step1_Slider";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(CaptureZone,Message_Civilian) {
            displayName = "Civilian Message";
            tooltip = "Message to display when Civilian is capturing the zone and when they capture the zone. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,Message_CIV);
            control = "EditStringArray";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "['Civilian is capturing the zone!','Civilian has captured the zone!']";
            validate = "none";
        };
        class EGVAR(CaptureZone,ContestedMessage) {
            displayName = "Contested Message";
            tooltip = "Message to display when the zone is contested. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,ContestedMessage);
            control = "Edit";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'The zone is contested!'";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,UncontestedMessage) {
            displayName = "Uncontested Message";
            tooltip = "Message to display when the zone is uncontested. Leave empty to disable this hint";
            property = QEGVAR(CaptureZone,UncontestedMessage);
            control = "Edit";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'The zone is uncontested!'";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,AutoMessages) {
            displayName = "Automated Messages";
            tooltip = "Enables automated messages based off of zone name. eg. For a zone named 'Everon' and a team called 'USMC', message would be 'USMC is capturing Everon!'";
            property = QEGVAR(CaptureZone,AutoMessages);
            control = "CheckBox";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Colours) {
            displayName = "Colours";
            tooltip = "Array of colours used for the map markers when zone status changes. Colours are respective with BLUFOR, OPFOR, INDFOR, Civilian, Uncontrolled, and Contested.";
            property = QEGVAR(CaptureZone,Colours);
            control = "EditStringArray";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "['ColorBlue','ColorRed','ColorGreen','ColorYellow','ColorWhite','ColorKhaki']";
            typeName = "STRING";
            validate = "none";
        };
        class EGVAR(CaptureZone,Hidden) {
            displayName = "Hidden";
            tooltip = "Hides the CaptureZone on the map. No markers are displayed if setting is enabled.";
            property = QEGVAR(CaptureZone,Hidden);
            control = "CheckBox";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Silent) {
            displayName = "Silent";
            tooltip = "Does not show CaptureZone hints to players. No hints are displayed if this setting is enabled.";
            property = QEGVAR(CaptureZone,Silent);
            control = "CheckBox";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Repeatable) {
            displayName = "Recapture";
            tooltip = "Can this area be recaptured? If disabled, zone will deactivate once a CaptureZone team captures it.";
            property = QEGVAR(CaptureZone,Repeatable);
            control = "CheckBox";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(CaptureZone,Condition) {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this zone to be captured. Default: true";
            property = QEGVAR(CaptureZone,Condition);
            control = "UO_FW_AI_codeControl";
            expression = UO_FW_MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};

class UO_FW_CaptureZoneModule_R : UO_FW_CaptureZoneModule {
    displayName = "Capture Zone (Rectangle)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};
