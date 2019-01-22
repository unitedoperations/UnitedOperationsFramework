class UO_FW_Gear_Folder
{
    text = "Configure Gear";
		items[] = {"UO_FW_Gear_Settings","UO_FW_Blufor_Gear_Configure","UO_FW_Opfor_Gear_Configure","UO_FW_Indfor_Gear_Configure","UO_FW_CIV_Gear_Configure"};
    picture = "\a3\3DEN\Data\Cfg3DEN\Comment\texture_ca.paa";
};

class UO_FW_Gear_Settings
{
    text = "Configure Gear Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Gear_Settings';";
    picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
};

class UO_FW_Blufor_Gear_Configure
{
    text = "Configure Blufor Gear";
		action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Blufor';";
};

class UO_FW_Opfor_Gear_Configure
{
    text = "Configure Opfor Gear";
		action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Opfor';";
};

class UO_FW_Indfor_Gear_Configure
{
    text = "Configure Indfor Gear";
		action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Indfor';";
};

class UO_FW_CIV_Gear_Configure
{
    text = "Configure Civilian Gear";
		action = "edit3DENMissionAttributes 'UO_FW_GearSettings_CIV';";
};
