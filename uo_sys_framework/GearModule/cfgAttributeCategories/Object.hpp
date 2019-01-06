class UO_FW_Gear
{
    displayName = "Gear Options";
    collapsed = 1;
    class Attributes
    {
				class UO_FW_Gear_UnitSystemType {
					displayName = "Gear System Type";
					tooltip = "Set the gear system type for the unit.";
					control = "UO_FW_Gear_SystemType";
					typeName = "STRING";
					property = "UO_FW_Gear_UnitSystemType";
					expression = "_this setVariable ['%s',_value,true];";
					condition = "ObjectControllable";
					validate = "none";
					defaultValue = "'NONE'";
				};
				class UO_FW_Gear_ACEAR_UnitGearType {
					displayName = "Gear Type";
					tooltip = "Set the gear type for the unit that sets the class for respawn and other functions. If set to ACE gear mode, this corresponds to the types defined in the gear team settings.";
					control = "UO_FW_Gear_ComboGearLoad";
					GearSystems[] = {"ACEAR","OLSEN","NONE"};
					property = "UO_FW_Gear_ACEAR_UnitGearType";
					typeName = "STRING";
					expression = "_this setVariable ['%s',_value,true];";
					condition = "ObjectControllable";
					validate = "none";
					defaultValue = "'NONE'";
				};
				class UO_FW_Gear_ACEAR_UnitGearCustomType {
					property = "UO_FW_Gear_ACEAR_UnitGearCustomType";
					displayName = "ACE Custom Gear Type";
					GearSystems[] = {"ACEAR","NONE"};
					tooltip = "Defines a custom gear class for respawn and other functions. If set to ACE gear mode, this corresponds to the name of an ACE mission loadout. Leave blank to disable.";
					control = "EditShort";
					typeName = "STRING";
					expression="_this setVariable ['%s', _value,true];";
					condition = "ObjectControllable";
					defaultValue = "''";
        };
        class UO_FW_Gear_Olsen_UnitGearType {
					property = "UO_FW_Gear_Olsen_UnitGearType";
					displayName = "Olsen Gear Type";
					GearSystems[] = {"OLSEN"};
					tooltip = "Name of the gear to load for this unit. Ex: 2000MSV_RF. Gearscript needs to be specified in the UO Gear Options. This works the same as [this, 2000MSV_RF] call UO_FW_FNC_OlsenGearScript;";
					control = "EditShort";
					typeName = "STRING";
					expression="_this setVariable ['%s', _value,true];";
					condition = "ObjectControllable";
					defaultValue = "''";
        };
    };
};
