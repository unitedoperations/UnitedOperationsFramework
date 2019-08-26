class EGVAR(Respawn,RespawnZoneModule): EGVAR(Core,BaseModule) {
    displayName = "Respawn Zone (Circle)"; // Name displayed in the menu
    // Name of function triggered once conditions are met
    function = QEFUNC(Respawn,SetRespawnModule);
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
        class EGVAR(Respawn,RadiusX) {
            displayName = "Respawn Radius X";
            tooltip = "The size of the X value of the respawn zone. Units will respawn randomly in this area. Default: 100";
            property = QEGVAR(Respawn,RadiusX);
            control = QEGVAR(Core,RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(Respawn,RadiusY) {
            displayName = "Respawn Radius Y";
            tooltip = "The size of the Y value of the respawn zone. Units will respawn randomly in this area. Default: 100";
            property = QEGVAR(Respawn,RadiusY);
            control = QEGVAR(Core,RadiusAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
            typeName = "NUMBER";
            validate = "number";
        };
        class EGVAR(Respawn,ShowMarker) {
            property = QEGVAR(Respawn,ShowMarker);
            displayName = "Show Marker";
            tooltip = "Show marker for the selected side?";
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Respawn,SideSelect) {
            displayName = "Side";
            tooltip = "Side which will respawn in this location.";
            control = "Combo";
            typeName = "NUMBER";
            property = QEGVAR(Respawn,SideSelect);
            expression = MODULE_EXPRESSION;
            validate = "none";
            class values {
                class West {name = "West"; value = 0; default = 0;};
                class East {name = "East"; value = 1;};
                class Ind {name = "Independent"; value = 2;};
                class Civ {name = "Civilian"; value = 3;};
            };
            defaultValue = "0";
        };

    };
};

class EGVAR(Respawn,RespawnZoneModule_R) : EGVAR(Respawn,RespawnZoneModule) {
    displayName = "Respawn Zone (Rectangle)";
    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 1;
    };
};