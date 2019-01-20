class UO_FW_ACRE_Folder {
    text = "Configure ACRE";
	//items[] = {"UO_FW_Blufor_ACRE_Configure","UO_FW_Opfor_ACRE_Configure","UO_FW_Indfor_ACRE_Configure","UO_FW_CIV_ACRE_Configure","UO_FW_ACRE_MainSettings_Configure"};
	items[] = {"UO_FW_Blufor_ACRE_Configure","UO_FW_Opfor_ACRE_Configure","UO_FW_Indfor_ACRE_Configure","UO_FW_CIV_ACRE_Configure","UO_FW_ACRE_MainSettings_Configure"};
	//picture = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\talk_ca.paa";
	picture = "x\UO_FW\addons\Main\ACREModule\resources\RadioIcon_Radio.paa";
};

class UO_FW_Blufor_ACRE_Configure {
    text = "Configure Blufor ACRE";
	action = "edit3DENMissionAttributes 'UO_FW_Blufor_ACRE';";
};

class UO_FW_Opfor_ACRE_Configure {
    text = "Configure Opfor ACRE";
	action = "edit3DENMissionAttributes 'UO_FW_Opfor_ACRE';";
};

class UO_FW_Indfor_ACRE_Configure {
    text = "Configure Indfor ACRE";
	action = "edit3DENMissionAttributes 'UO_FW_Indfor_ACRE';";
};

class UO_FW_CIV_ACRE_Configure {
    text = "Configure Civilian ACRE";
	action = "edit3DENMissionAttributes 'UO_FW_CIV_ACRE';";
};

class UO_FW_ACRE_MainSettings_Configure {
    text = "Configure ACRE Settings";
	action = "edit3DENMissionAttributes 'UO_FW_ACRE_MainSettings';";
};
