class UO_FW_GearSettings_ACE_Arsenal_Blufor
{
    displayName = "Blufor ACE Gear Settings";
    collapsed = 0;
    class Attributes
    {
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFL
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFL";
          displayName = "Rifleman Loadout";
          tooltip = "Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFL";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFLAT
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFLAT";
          displayName = "Rifleman AT Loadout";
          tooltip = "Rifleman AT Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_RFLAT";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AR
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AR";
          displayName = "Automatic Rifleman Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_AR";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_GRN
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_GRN";
          displayName = "Grenadier Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_GRN";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TL
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TL";
          displayName = "Team Leader Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_TL";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_SQL
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_SQL";
          displayName = "Squad Leader Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_SQL";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AT
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AT";
          displayName = "Anti Tank Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_AT";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AAT
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AAT";
          displayName = "Assistant Anti Tank Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_AAT";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MG
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MG";
          displayName = "Machinegunner Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_MG";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AMG
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AMG";
          displayName = "Assistant Machinegunner Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_AMG";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCRW
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCRW";
          displayName = "Vehicle Crewman Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_Blufor_VCRW";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
      };
			class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCMD
      {
          property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCMD";
          displayName = "Vehicle Commander Loadout";
          tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
          control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo_BLUFOR_VCMD";
					typeName = "STRING";
          expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
          defaultValue = "'None'";
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
