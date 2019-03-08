class EGVAR(CoverMap,CoverMapModule): EGVAR(Core,BaseModule) {
    displayName = "Cover Map Module"; // Name displayed in the menu
    scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
    // Name of function triggered once conditions are met
    function = QEFUNC(CoverMap,CoverMap);
    // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;

    class AttributeValues {
    size2[] = {100,100};
        IsRectangle = 1;
  };

    // Categories collapsible in "Edit Attributes" window
        // Category class, can be anything
        class Attributes {
            class EGVAR(CoverMap,AOName) {
                displayName = "AO Name";
                tooltip = "AO name displayed in ace actions and referenced in module settings";
                control = "EditShort";
                typeName = "STRING";
                property = QEGVAR(CoverMap,AOName);
                expression = MODULE_EXPRESSION;
                validate = "STRING";
                defaultValue = "'Area0'";
            };
            class EGVAR(CoverMap,RadiusX) {
                displayName = "Radius X";
                tooltip = "The size of the X value of the setup zone. Default: 100";
                property = QEGVAR(CoverMap,RadiusX);
                control = QMGVAR(RadiusAttribute);
                expression = MODULE_EXPRESSION;
                defaultValue = "100";
                typeName = "NUMBER";
                validate = "number";
            };
            class EGVAR(CoverMap,RadiusY) {
                displayName = "Radius Y";
                tooltip = "The size of the Y value of the setup zone. Default: 100";
                property = QEGVAR(CoverMap,RadiusY);
                control = QMGVAR(RadiusAttribute);
                expression = MODULE_EXPRESSION;
                defaultValue = "100";
                typeName = "NUMBER";
                validate = "number";
            };
            class EGVAR(CoverMap,ZoomLevel) {
                displayName = "Zoomlevel";
                tooltip = "Map zoom level of the AO. Default: 0.2";
                property = QEGVAR(CoverMap,ZoomLevel);
                control = "EditShort";
                expression = MODULE_EXPRESSION;
                defaultValue = "0.2";
                typeName = "NUMBER";
                validate = "number";
            };
        };
};
