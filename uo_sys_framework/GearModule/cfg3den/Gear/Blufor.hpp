class UO_FW_GearSettings_Blufor_Category
{
    displayName = "Blufor Gear Settings";
    collapsed = 0;
    class Attributes
    {
      class UO_FW_GearSettings_CustomFile_Blufor
      {
          property = "UO_FW_GearSettings_CustomFile_Blufor";
          displayName = "Custom File";
          tooltip = "Custom Gear defines file";
          control = "Edit";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_LoadoutType_RFL_Blufor
      {
          property = "UO_FW_GearSettings_LoadoutType_RFL_Blufor";
          displayName = "Rifleman Loadout";
          tooltip = "Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "EditShort";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_LoadoutType_RFLAT_Blufor
      {
          property = "UO_FW_GearSettings_LoadoutType_RFLAT_Blufor";
          displayName = "Rifleman AT Loadout";
          tooltip = "Rifleman AT Loadout saved in ACE Arsenal mission loadouts";
          control = "EditShort";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_LoadoutType_AR_Blufor
      {
          property = "UO_FW_GearSettings_LoadoutType_AR_Blufor";
          displayName = "Automatic Rifleman Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "EditShort";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
		};
};
