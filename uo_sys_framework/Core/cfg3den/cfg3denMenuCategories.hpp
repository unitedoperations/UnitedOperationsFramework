class EGVAR(Respawn,Settings_BLUFOR) {
    displayName = "BLUFOR Respawn Settings";
    class AttributeCategories {
        #include "Respawn\BluforRespawn.hpp"
    };
};

class EGVAR(Respawn,Settings_OPFOR) {
    displayName = "OPFOR Respawn Settings";
    class AttributeCategories {
        #include "Respawn\OpforRespawn.hpp"
    };
};

class EGVAR(Respawn,Settings_Indfor) {
    displayName = "Indfor Respawn Settings";
    class AttributeCategories {
        #include "Respawn\IndforRespawn.hpp"
    };
};

class EGVAR(Respawn,Settings_Civilian) {
    displayName = "Civilian Respawn Settings";
    class AttributeCategories {
        #include "Respawn\CivilianRespawn.hpp"
    };
};

class EGVAR(Respawn,Settings_Main) {
    displayName = "General Respawn Settings";
    class AttributeCategories {
        #include "Respawn\MainRespawn.hpp"
    };
};

class EGVAR(EndConditions,Settings_Menu) {
    displayName = "End Condition Settings";
    class AttributeCategories {
      #include "EndConditions\TimelimitMenu.hpp"
      #include "EndConditions\CustomFileMenu.hpp"
      #include "EndConditions\SleepMenu.hpp"
    };
};

class EGVAR(EndConditions,Category_1_Menu) {
    displayName = "Category 1 Settings";
    class AttributeCategories {
        #include "EndConditions\Category1Menu.hpp"
    };
};

class EGVAR(EndConditions,Category_2_Menu) {
    displayName = "Category 2 Settings";
    class AttributeCategories {
        #include "EndConditions\Category2Menu.hpp"
    };
};

class EGVAR(EndConditions,Category_3_Menu) {
    displayName = "Category 3 Settings";
    class AttributeCategories {
        #include "EndConditions\Category3Menu.hpp"
    };
};

class EGVAR(EndConditions,Category_4_Menu) {
    displayName = "Category 4 Settings";
    class AttributeCategories {
        #include "EndConditions\Category4Menu.hpp"
    };
};

class EGVAR(EndConditions,Category_5_Menu) {
    displayName = "Category 5 Settings";
    class AttributeCategories {
        #include "EndConditions\Category5Menu.hpp"
    };
};

class EGVAR(EndConditions,Category_6_Menu) {
    displayName = "Category 6 Settings";
    class AttributeCategories {
        #include "EndConditions\Category6Menu.hpp"
    };
};

class EGVAR(Export,Menu) {
    displayName = "Export Settings";
    class AttributeCategories {
        class UO_FW_ExportAttributes {
            displayName = "Export Mission Settings";
            collapsed = 0;
            class Attributes {
                class EGVAR(EXPORT,ExportToProfile) {
                    property = QEGVAR(EXPORT,ExportToProfile);
                    displayName = "Export Settings to Profile";
                    tooltip = "Enter the name of the settings preset that will be saved to your profile";
                    control = "UO_FW_ExportToProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class EGVAR(EXPORT,ExportToClipboard) {
                    property = QEGVAR(EXPORT,ExportToClipboard);
                    displayName = "Export Settings to Clipboard";
                    tooltip = "Export Settings to Clipboard";
                    control = "UO_FW_ExportToClipboardAttribute";
                    expression = "";
                    defaultValue = "[]";
                };
                class EGVAR(EXPORT,ExportLoadoutToProfile) {
                    property = QEGVAR(EXPORT,ExportLoadoutToProfile);
                    displayName = "Export Loadouts to Profile";
                    tooltip = "Enter the name of the settings preset that will be saved to your profile";
                    control = "UO_FW_ExportLoadoutToProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class EGVAR(EXPORT,ExportLoadoutToClipboard) {
                    property = QEGVAR(EXPORT,ExportLoadoutToClipboard);
                    displayName = "Export Loadouts to Clipboard";
                    tooltip = "Export Loadouts to Clipboard";
                    control = "UO_FW_ExportLoadoutToClipboardAttribute";
                    expression = "";
                    defaultValue = "[]";
                };
            };
        };
    };
};

class EGVAR(Import,Menu) {
    displayName = "Import Settings";
    class AttributeCategories {
        class UO_FW_ImportAttributes {
            displayName = "Import Mission Settings";
            collapsed = 0;
            class Attributes {
                class EGVAR(Import,ImportfromProfile) {
                    property = QEGVAR(IMPORT,ImportfromProfile);
                    displayName = "Import Settings from Profile";
                    tooltip = "";
                    control = "UO_FW_ImportFromProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class EGVAR(Import,ImportFromClipboard) {
                    property = QEGVAR(Import,ImportFromClipboard);
                    displayName = "Import Settings from Clipboard";
                    tooltip = "Import Settings from Clipboard";
                    control = "UO_FW_ImportFromClipboardAttribute";
                    expression = "";
                    defaultValue = "[]";
                };
                class EGVAR(IMPORT,ImportLoadoutfromProfile) {
                    property = QEGVAR(IMPORT,ImportLoadoutfromProfile);
                    displayName = "Import Loadouts from Profile";
                    tooltip = "";
                    control = "UO_FW_ImportLoadoutFromProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class EGVAR(Import,ImportLoadoutFromClipboard) {
                    property = QEGVAR(Import,ImportLoadoutFromClipboard);
                    displayName = "Import Loadouts from Clipboard";
                    tooltip = "";
                    control = "UO_FW_ImportLoadoutFromClipboardAttribute";
                    expression = "";
                    defaultValue = "[]";
                };
            };
        };
    };
};

class EGVAR(Core,Version_DummyCategory) {
    displayName = "Dummy attribute, should never show up";
    class AttributeCategories {
        class EGVAR(Core,Version_Attributes) {
            displayName = "Dummy attribute, should never show up";
            collapsed = 0;
            class Attributes {
                class EGVAR(Core,Version_Created) {
                    property = QEGVAR(Core,Version_Created);
                    displayName = "";
                    tooltip = "";
                    control = "EditShort";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "''";
                };
                class EGVAR(Core,Version_Updated) {
                    property = QEGVAR(Core,Version_Updated);
                    displayName = "";
                    tooltip = "";
                    control = "EditShort";
                    expression = UO_FW_SCENARIO_EXPRESSION;
                    defaultValue = "''";
                };
            };
        };
    };
};
