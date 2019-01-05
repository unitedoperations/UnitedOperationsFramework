class UO_FW_GearSettings_ACE_Arsenal_Blufor
{
    displayName = "Blufor ACE Gear Settings";
    collapsed = 0;
    class Attributes
    {
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_RFL_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_RFL_Blufor";
          displayName = "Rifleman Loadout";
          tooltip = "Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_RFLAT_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_RFLAT_Blufor";
          displayName = "Rifleman AT Loadout";
          tooltip = "Rifleman AT Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AR_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AR_Blufor";
          displayName = "Automatic Rifleman Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_GRN_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_GRN_Blufor";
          displayName = "Grenadier Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_TL_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_TL_Blufor";
          displayName = "Team Leader Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_SQL_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_SQL_Blufor";
          displayName = "Squad Leader Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AT_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AT_Blufor";
          displayName = "Anti Tank Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AAT_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AT_Blufor";
          displayName = "Assistant Anti Tank Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_MG_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_MG_Blufor";
          displayName = "Machinegunner Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AMG_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_AMG_Blufor";
          displayName = "Assistant Machinegunner Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_VCRW_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_VCRW_Blufor";
          displayName = "Vehicle Crewman Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_VCMD_Blufor
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_VCRW_Blufor";
          displayName = "Vehicle Commander Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "''";
      };
		};
};

class UO_FW_GearSettings_Olsen_Blufor
{
    displayName = "Blufor Olsen Gear Settings";
    collapsed = 0;
    class Attributes
    {
			class UO_FW_GearSettings_Olsen_CustomFile_Blufor
			{
					property = "UO_FW_GearSettings_Olsen_CustomFile_Blufor";
					displayName = "Custom File";
					tooltip = "Custom Gear defines file";
					control = "Edit";
					expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
					defaultValue = "''";
			};
		};
};
