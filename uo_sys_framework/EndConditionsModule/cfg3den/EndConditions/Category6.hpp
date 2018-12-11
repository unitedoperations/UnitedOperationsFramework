class EndConditionMainSettings_Category6
{
    displayName = "Category Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_Enabled_6
        {
            property = "UO_FW_EndCondition_Enabled_6";
            displayName = "Enable Category";
            tooltip = "Toggle Activation of the End Condition Category";
			control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_Mode_6
        {
            property = "UO_FW_EndCondition_Mode_6";
            displayName = "Category Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true";
			control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_Message_6
        {
            property = "UO_FW_EndCondition_Message_6";
            displayName = "Category Message";
            tooltip = "Message displayed when end condition category is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'End condition 1 fired!'";
        };
	};
};

class EndConditionCasualtySettings_Category6
{
    displayName = "Casualty Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_6";
            displayName = "BLUFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_6";
            displayName = "OPFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_6";
            displayName = "INDFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_6";
            displayName = "CIVILIAN Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_6
        {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "75";
        };
    };
};

class EndConditionEntitySettings_Category6
{
    displayName = "Entity Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_EntitiesAlive_Array_6
        {
            property = "UO_FW_EndCondition_EntitiesAlive_Array_6";
            displayName = "Alive Entities";
            tooltip = "Array of entities checked for alive status. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "[]";
        };
		class UO_FW_EndCondition_EntitiesDead_Array_6
        {
            property = "UO_FW_EndCondition_EntitiesDead_Array_6";
            displayName = "Dead Entities";
            tooltip = "Array of entities checked for dead status. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "[]";
        };
		class UO_FW_EndCondition_EntitiesDamaged_Array_6
        {
            property = "UO_FW_EndCondition_EntitiesDamaged_Array_6";
            displayName = "Damaged Entities";
            tooltip = "Array of entities checked for over 50 percent damage or immobilized status. Includes dead state. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "[]";
        };
	};
};

class EndConditionHostageSettings_Category6
{
    displayName = "Hostage Settings";
    collapsed = 0;
    class Attributes
    {
        class UO_FW_EndCondition_HostageRescued_Array_6
        {
            property = "UO_FW_EndCondition_HostageRescued_Array_6";
            displayName = "Hostage(s) Rescued";
            tooltip = "Array of hostages checked for there rescued status. Leaves blank to disable.";
            control = "EditArray";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "[]";
        };
    };
};

class EndConditionVariableSettings_Category6
{
    displayName = "Custom Variable Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_CustomVariables_Array_6
        {
            property = "UO_FW_EndCondition_CustomVariables_Array_6";
            displayName = "Custom Variables";
            tooltip = "Array of variables to check for true status. Leave blank to disable";
			control = "EditArray";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "[]";
        };
	};
};

class EndConditionExtractionSettings_Category6
{
    displayName = "Extraction Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_ExtractionEnabled_6
        {
            property = "UO_FW_EndCondition_ExtractionEnabled_6";
            displayName = "Require Extraction";
            tooltip = "Require Extraction in addition to end conditions for this category.";
			control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "false";
        };
		class UO_FW_EndCondition_ExtractionTeam_6
        {
            property = "UO_FW_EndCondition_ExtractionTeam_6";
            displayName = "Team";
            tooltip = "Team required to be in extract area.";
			control = "UO_FW_ENDCONDITIONS_EXTRACTTEAM";
            expression="missionNamespace setVariable ['%s',_value];";
			defaultValue = "0";
        };
		class UO_FW_EndCondition_ExtractionMarker_6
        {
            property = "UO_FW_EndCondition_ExtractionMarker_6";
            displayName = "Extraction Marker";
            tooltip = "Marker name of extraction area.";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
		class UO_FW_EndCondition_ExtractionRatio_6
        {
            property = "UO_FW_EndCondition_ExtractionRatio_6";
            displayName = "Ratio";
            tooltip = "Percentage of alive personnel inside the marker to be considered extracted. Default 75";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            validate = "number";
			defaultValue = "75";
        };
	};
};

class EndConditionCapturezoneSettings_Category6
{
    displayName = "Capturezone Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_CapturezoneEnabled_6
        {
            property = "UO_FW_EndCondition_CapturezoneEnabled_6";
            displayName = "Enable Capturezone";
            tooltip = "Add Capturezone capture to end conditions for this category.";
			control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "false";
        };
	
		class UO_FW_EndCondition_CapturezoneMarker_6
        {
            property = "UO_FW_EndCondition_CapturezoneMarker_6";
            displayName = "Capturezone name";
            tooltip = "Which capturezone should be checked. Default empty";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
		class UO_FW_EndCondition_CapturezoneTeam_6
        {
            property = "UO_FW_EndCondition_CapturezoneTeam_6";
            displayName = "Captured by";
            tooltip = "End condition will trigger if TEAM captures the zone. Default Noone Zone needs to be defined via the Capturezone module.";
			control = "UO_FW_ENDCONDITIONS_CAPTUREZONETEAM";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "0";
        };
        
	};
};
