class UO_FW_Gear
{
    displayName = "Gear Options";
    collapsed = 1;
    class Attributes
    {
				class UO_FW_Gear_UnitGearType {
					displayName = "Gear Type";
					tooltip = "Set the gear type for the unit that corresponds to the types defined in the gear team settings.";
					control = "ComboGearLoad";
					typeName = "NUMBER";
					property = "UO_FW_Gear_UnitGearType";
					expression = "_this setVariable ['%s',_value,true];";
					validate = "none";
					class values {
						 class RFL    {name = "Rifleman"; value = 0;};
						 class RFLAT    {name = "Rifleman AT"; value = 1;};
						 class AR    {name = "Automatic Rifleman"; value = 2;};
						 class GRN    {name = "Grenadier"; value = 3;};
						 class TL    {name = "Team Leader"; value = 4;};
						 class SQL    {name = "Squad Leader"; value = 5;};
						 class AT    {name = "Anti Tank"; value = 6;};
						 class MG    {name = "Machinegunner"; value = 7;};
						 class AMG    {name = "Assistant Machinegunner"; value = 8;};
						 class VCRW    {name = "Vehicle Crewman"; value = 9;};
						 class VCMD    {name = "Vehicle Commander"; value = 10;};
						 class CUS    {name = "Custom Type"; value = 11;};
						 class NONE    {name = "Not Defined"; value = 12;};
					};
					defaultValue = "12";
				};
				class UO_FW_Gear_UnitGearCustomType
        {
            property = "UO_FW_Gear_UnitGearCustomType";
            displayName = "Gear Type";
            tooltip = "Defines a custom gear type for the unit. Leave blank to disable.";
            control = "EditShort";
            expression="_this setVariable ['%s', _value,true];";
            defaultValue = "''";
        };
        //class UO_FW_Gear_UnitGearType
        //{
        //    property = "UO_FW_UnitGearType";
        //    displayName = "Gear Type";
        //    tooltip = "Name of the gear to load for this unit. Ex.: 2000MSV_RF. Gearscript needs to be specified in the UO Gear Options. This works the same as [this, 2000MSV_RF] call UO_FW_FNC_GearScript;";
        //    control = "EditShort";
        //    expression="_this setVariable ['%s', _value,true];";
        //    defaultValue = "''";
        //};
        //class UO_FW_Gear_Groupname
        //{
        //    property = "UO_FW_Gear_Groupname";
        //    displayName = "Group name";
        //    tooltip = "Name of the group for this unit";
        //    control = "EditShort";
        //    expression="_this setVariable ['%s', _value,true];";
        //    defaultValue = "''";
        //};
    };
};
