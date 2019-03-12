class EGVAR(AOLimit,AOLimitModule): EGVAR(Core,BaseModule) {
    displayName = "AO Limit Module"; // Name displayed in the menu
    scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
    // Name of function triggered once conditions are met
    function = QEFUNC(AOLimit,AOLimit);
    // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    canSetArea = 1;
    icon = "\x\UO_FW\addons\Main\AOLimitModule\resources\aolimitmodule_ca.paa";

    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 0;
      };

    // Categories collapsible in "Edit Attributes" window
    // Category class, can be anything
    class Attributes {
        class EGVAR(AOLimit,RadiusX) {
            displayName = "Radius X";
            tooltip = "The size of the X value of the setup zone. Default: 100";
            property = QEGVAR(AOLimit,RadiusX);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AOLimit,RadiusY) {
            displayName = "Radius Y";
            tooltip = "The size of the Y value of the setup zone. Default: 100";
            property = QEGVAR(AOLimit,RadiusY);
            control = QMGVAR(RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(AOLimit,AOMode) {
            displayName = "AO Mode";
            tooltip = "Set the AO as a Soft AO that gives players time to return to the area before killing them, or a hard AO which forces the player inside the AO.";
            property = QEGVAR(AOLimit,AOMode);
            control = "UO_FW_AOModeAttribute";
            typeName = "STRING";
            expression = MODULE_EXPRESSION;
            defaultValue = "'HARD'";
        };
        class EGVAR(AOLimit,Blufor) {
            displayName = "Blufor";
            tooltip = "Restrict Blufor to this AO. Units that start outside of the AO will be not be restricted.";
            property = QEGVAR(AOLimit,Blufor);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(AOLimit,Opfor) {
            displayName = "Opfor";
            tooltip = "Restrict Opfor to this AO. Units that start outside of the AO will be not be restricted.";
            property = QEGVAR(AOLimit,Opfor);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(AOLimit,Indfor) {
            displayName = "Indfor";
            tooltip = "Restrict Indfor to this AO. Units that start outside of the AO will be not be restricted.";
            property = QEGVAR(AOLimit,Indfor);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(AOLimit,Civilian) {
            displayName = "Civilian";
            tooltip = "Restrict Civilian to this AO. Units that start outside of the AO will be not be restricted.";
            property = QEGVAR(AOLimit,CIV);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(AOLimit,EntryMode) {
            displayName = "Entry Restriction";
            tooltip = "Enable to restrict players within AO if they spawned outside the area but entered it.";
            property = QEGVAR(AOLimit,EntryMode);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(AOLimit,AirUnits) {
            displayName = "Air unit exemption";
            tooltip = "Enable to exempt air units from AO restriction. Default: true";
            property = QEGVAR(AOLimit,AirUnits);
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
            validate = "none";
        };
        class EGVAR(AoLimit,SoftTimeOutside) {
            displayName = "Max time outside of AO";
            tooltip = "The amount of time in seconds a land based unit is allowed to stay outside the AO";
            property = QEGVAR(AoLimit,SoftTimeOutside);
            control = QMGVAR(30To120Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
            AOTypes[] = {"SOFT"};
            typeName = "number";
            validate = "number";
        };
        class EGVAR(AoLimit,SoftTimeOutsideAir) {
            displayName = "Max time outside of AO";
            tooltip = "The amount of time in seconds an air based unit is allowed to stay outside the AO";
            property = QEGVAR(AoLimit,SoftTimeOutsideAir);
            control = QMGVAR(120To360Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "120";
            AOTypes[] = {"SOFT"};
            typeName = "number";
            validate = "number";
        };
    };
};


class EGVAR(AOLimit,AOLimitModule_R) : EGVAR(AOLimit,AOLimitModule) {
    displayName = "AO Limit Module (Rectangle)"; // Name displayed in the menu
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};
