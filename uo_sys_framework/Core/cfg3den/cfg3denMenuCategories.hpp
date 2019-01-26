class UO_FW_Respawn_Settings_BLUFOR {
    displayName = "BLUFOR Respawn Settings";
    class AttributeCategories {
        #include "Respawn\BluforRespawn.hpp"
    };
};

class UO_FW_Respawn_Settings_OPFOR {
    displayName = "OPFOR Respawn Settings";
    class AttributeCategories {
        #include "Respawn\OpforRespawn.hpp"
    };
};

class UO_FW_Respawn_Settings_INDFOR {
    displayName = "INDFOR Respawn Settings";
    class AttributeCategories {
        #include "Respawn\IndforRespawn.hpp"
    };
};

class UO_FW_Respawn_Settings_CIV {
    displayName = "Civilian Respawn Settings";
    class AttributeCategories {
        #include "Respawn\CivilianRespawn.hpp"
    };
};

class UO_FW_Respawn_Settings_Main {
    displayName = "General Respawn Settings";
    display = "Display3DENEditAttributesPreview";
    class AttributeCategories {
        #include "Respawn\MainRespawn.hpp"
    };
};

class UO_FW_EndConditions_Settings_Menu {
    displayName = "End Condition Settings";
    class AttributeCategories {
      #include "EndConditions\TimelimitMenu.hpp"
      #include "EndConditions\CustomFileMenu.hpp"
      #include "EndConditions\SleepMenu.hpp"
    };
};

class UO_FW_EndConditions_Category_1_Menu {
    displayName = "Category 1 Settings";
    class AttributeCategories {
        #include "EndConditions\Category1Menu.hpp"
    };
};

class UO_FW_EndConditions_Category_2_Menu {
    displayName = "Category 2 Settings";
    class AttributeCategories {
        #include "EndConditions\Category2Menu.hpp"
    };
};

class UO_FW_EndConditions_Category_3_Menu {
    displayName = "Category 3 Settings";
    class AttributeCategories {
        #include "EndConditions\Category3Menu.hpp"
    };
};

class UO_FW_EndConditions_Category_4_Menu {
    displayName = "Category 4 Settings";
    class AttributeCategories {
        #include "EndConditions\Category4Menu.hpp"
    };
};

class UO_FW_EndConditions_Category_5_Menu {
    displayName = "Category 5 Settings";
    class AttributeCategories {
        #include "EndConditions\Category5Menu.hpp"
    };
};

class UO_FW_EndConditions_Category_6_Menu {
    displayName = "Category 6 Settings";
    class AttributeCategories {
        #include "EndConditions\Category6Menu.hpp"
    };
};

class UO_FW_Export_Menu {
    displayName = "Export Settings";
    class AttributeCategories {
        class UO_FW_ExportAttributes {
            displayName = "Export Mission Settings";
            collapsed = 0;
            class Attributes {
                class UO_FW_EXPORT_ExportToProfile {
                    property = "UO_FW_EXPORT_ExportToProfile";
                    displayName = "Export Settings to Profile";
                    tooltip = "Enter the name of the settings preset that will be saved to your profile";
                    control = "UO_FW_ExportToProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class UO_FW_EXPORT_ExportToClipboard {
                    property = "UO_FW_EXPORT_ExportToClipboard";
                    displayName = "Export Settings to Clipboard";
                    tooltip = "Export Settings to Clipboard";
                    control = "UO_FW_ExportToClipboardAttribute";
                    expression = "";
                    defaultValue = "[]";
                };
                class UO_FW_EXPORT_ExportLoadoutToProfile {
                    property = "UO_FW_EXPORT_ExportLoadoutToProfile";
                    displayName = "Export Loadouts to Profile";
                    tooltip = "Enter the name of the settings preset that will be saved to your profile";
                    control = "UO_FW_ExportLoadoutToProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class UO_FW_EXPORT_ExportLoadoutToClipboard {
                    property = "UO_FW_EXPORT_ExportLoadoutToClipboard";
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

class UO_FW_Import_Menu {
    displayName = "Import Settings";
    class AttributeCategories {
        class UO_FW_ImportAttributes {
            displayName = "Import Mission Settings";
            collapsed = 0;
            class Attributes {
                class UO_FW_IMPORT_ImportfromProfile {
                    property = "UO_FW_IMPORT_ImportfromProfile";
                    displayName = "Import Settings from Profile";
                    tooltip = "";
                    control = "UO_FW_ImportFromProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class UO_FW_Import_ImportFromClipboard {
                    property = "UO_FW_Import_ImportFromClipboard";
                    displayName = "Import Settings from Clipboard";
                    tooltip = "Import Settings from Clipboard";
                    control = "UO_FW_ImportFromClipboardAttribute";
                    expression = "";
                    defaultValue = "[]";
                };
                class UO_FW_IMPORT_ImportLoadoutfromProfile {
                    property = "UO_FW_IMPORT_ImportLoadoutfromProfile";
                    displayName = "Import Loadouts from Profile";
                    tooltip = "";
                    control = "UO_FW_ImportLoadoutFromProfileAttribute";
                    expression = "";
                    defaultValue = "''";
                };
                class UO_FW_Import_ImportLoadoutFromClipboard {
                    property = "UO_FW_Import_ImportLoadoutFromClipboard";
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
