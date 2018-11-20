class UO_FW_Hostage_Attributes
{
    displayName = "Hostage Options";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_Hostage_State
        {
            displayName = "Hostage State";
            tooltip = "Wether or not this unit is a hostage. (False by default.)";
            property = "UO_FW_Hostage_State";
            control = "CheckboxState";
            expression="_this setVariable ['%s', _value,true];";
            condition = "objectBrain";
            defaultValue = "false";
        };
        class UO_FW_Hostage_Rescue_Location
        {
            displayName = "Hostage Rescue Zone";
            tooltip = "Location where a hostage is marked as rescued. (marker_0 by default.)";
            property = "UO_FW_Hostage_Rescue_Location";
            control = "Edit";
            expression="_this setVariable ['%s', _value,true];";
            condition = "objectBrain";
            defaultValue = "'marker_0'";
        };
         class UO_FW_Hostage_Freed_JoinSquad
        {
            displayName = "Hostage Joins Squad";
            tooltip = "Determine wether the hostage will join the squad of the freeing player. (Default: true)";
            property = "UO_FW_Hostage_Freed_JoinSquad";
            control = "Checkbox";
            expression="_this setVariable ['%s', _value,true];";
            condition = "objectBrain";
            defaultValue = "true";
        };
        class UO_FW_Hostage_Freed_Modifier
        {
            displayName = "Hostage Freed Modifiers";
            tooltip = "Enable modifiers for hostage's behavior when they are freed. (False by default.)";
            property = "UO_FW_Hostage_Freed_Modifier";
            control = "Checkbox";
            expression="_this setVariable ['%s', _value,true];";
            condition = "objectBrain";
            defaultValue = "false";
        };
        class UO_FW_Hostage_Freed_Behavior
        {
            displayName = "Hostage Freed Behavior";
            tooltip = "Determine the hostages behavior when freed by the player.\nWill not function unless 'Hostage Freed Modifiers' is enabled. (Default: CARELESS)";
            property = "UO_FW_Hostage_Freed_Behavior";
            control = "Edit";
            expression="_this setVariable ['%s', _value,true];";
            condition = "objectBrain";
            defaultValue = "'CARELESS'";
        };
    };
};