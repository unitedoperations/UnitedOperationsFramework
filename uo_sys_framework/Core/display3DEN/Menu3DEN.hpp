class EGVAR(ExportImport,Folder) {
    text = "Import/Export Framework Settings";
    items[] = {"UO_FW_Export_Configure","UO_FW_Import_Configure"};
    picture = "";
};

class EGVAR(Export,Configure) {
    text = "Export Mission Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Export_Menu';";
};

class EGVAR(Import,Configure) {
    text = "Import Mission Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Import_Menu';";
};
