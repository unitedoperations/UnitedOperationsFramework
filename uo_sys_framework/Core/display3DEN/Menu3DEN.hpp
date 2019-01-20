class UO_FW_ExportImport_Folder {
	text = "Import/Export Framework Settings";
	items[] = {"UO_FW_Export_Configure","UO_FW_Import_Configure"};
	picture = "";
};

class UO_FW_Export_Configure {
	text = "Export Mission Settings";
	action = "edit3DENMissionAttributes 'UO_FW_Export_Menu';";
};

class UO_FW_Import_Configure {
	text = "Import Mission Settings";
	action = "edit3DENMissionAttributes 'UO_FW_Import_Menu';";
};
