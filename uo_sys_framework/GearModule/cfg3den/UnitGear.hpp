class UO_FW_Gear
{
    displayName = "Gear Options";
    collapsed = 0;
    class Attributes
    {
        class UO_FW_Gear_UnitGearType
        {
            property = "UO_FW_UnitGearType";
            displayName = "Gear Type";
            tooltip = "Name of the gear to load for this unit. Ex.: 2000MSV_RF. Gearscript needs to be specified in the UO Gear Options. This works the same as [this, 2000MSV_RF] call UO_FW_FNC_GearScript;";
            control = "EditShort";
            expression="_this setVariable ['%s', _value,true];";
            defaultValue = "''";
        };
        class UO_FW_Gear_Groupname
        {
            property = "UO_FW_Gear_Groupname";
            displayName = "Group name";
            tooltip = "Name of the group for this unit";
            control = "EditShort";
            expression="_this setVariable ['%s', _value,true];";
            defaultValue = "''";
        };
    };
};
