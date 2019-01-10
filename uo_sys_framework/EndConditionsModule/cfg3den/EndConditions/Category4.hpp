class EndConditionMainSettings_Category4
{
    displayName = "Category Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_Enabled_4
        {
            property = "UO_FW_EndCondition_Enabled_4";
            displayName = "Enable Category";
            tooltip = "Toggle Activation of the End Condition Category";
						control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_Mode_4
        {
            property = "UO_FW_EndCondition_Mode_4";
            displayName = "Category Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true. Extract condition must be true in both cases.";
						control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
						validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_Message_4
        {
            property = "UO_FW_EndCondition_Message_4";
            displayName = "Category Message";
            tooltip = "Message displayed when end condition category is triggered";
            control = "Edit";
						validate = "string";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'End condition 1 fired!'";
        };
	};
};

class EndConditionCasualtySettings_Category4
{
    displayName = "Casualty Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_4";
            displayName = "BLUFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_4";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
						control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
						validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_4";
            displayName = "OPFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_4";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
						control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
						validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_4";
            displayName = "INDFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_4";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
						control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
						validate = "number";
            defaultValue = "75";
        };
		class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_4";
            displayName = "CIVILIAN Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_4
        {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_4";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
						control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
						validate = "number";
            defaultValue = "75";
        };
    };
};

class EndConditionEntitySettings_Category4
{
    displayName = "Entity Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_EntitiesAlive_Array_4
        {
            property = "UO_FW_EndCondition_EntitiesAlive_Array_4";
            displayName = "Alive Entities";
            tooltip = "Array of entities checked for alive status. Leave blank to disable";
						control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_EndCondition_EntitiesDead_Array_4
        {
            property = "UO_FW_EndCondition_EntitiesDead_Array_4";
            displayName = "Dead Entities";
            tooltip = "Array of entities checked for dead status. Leave blank to disable";
						control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_EndCondition_EntitiesDamaged_Array_4
        {
            property = "UO_FW_EndCondition_EntitiesDamaged_Array_4";
            displayName = "Damaged Entities";
            tooltip = "Array of entities checked for over 50 percent damage or immobilized status. Includes dead state. Leave blank to disable";
						control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
	};
};

class EndConditionHostageSettings_Category4
{
    displayName = "Hostage Settings";
    collapsed = 0;
    class Attributes
    {
        class UO_FW_EndCondition_HostageRescued_Array_4
        {
            property = "UO_FW_EndCondition_HostageRescued_Array_4";
            displayName = "Hostage(s) Rescued";
            tooltip = "Array of hostages that must be rescued for the end condition to fire. leave blank to disable.";
            control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
    };
};

class EndConditionVariableSettings_Category4
{
    displayName = "Custom Variable Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_CustomVariables_Array_4
        {
            property = "UO_FW_EndCondition_CustomVariables_Array_4";
            displayName = "Custom Variables";
            tooltip = "Array of variables to check for true status. Leave blank to disable";
						control = "EditArray";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "[]";
        };
	};
};

class EndConditionExtractionSettings_Category4
{
    displayName = "Extraction Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_EndCondition_ExtractionEnabled_4
        {
            property = "UO_FW_EndCondition_ExtractionEnabled_4";
            displayName = "Require Extraction";
            tooltip = "Require Extraction in addition to end conditions for this category.";
						control = "CheckBoxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_EndCondition_ExtractionTeam_4
        {
            property = "UO_FW_EndCondition_ExtractionTeam_4";
            displayName = "Team";
            tooltip = "Team required to be in extract area.";
						control = "UO_FW_ENDCONDITIONS_EXTRACTTEAM";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
						defaultValue = "0";
        };
		class UO_FW_EndCondition_ExtractionMarker_4
        {
            property = "UO_FW_EndCondition_ExtractionMarker_4";
            displayName = "Extraction Marker";
            tooltip = "Marker name of extraction area.";
						control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_EndCondition_ExtractionRatio_4
        {
            property = "UO_FW_EndCondition_ExtractionRatio_4";
            displayName = "Ratio";
            tooltip = "Percentage of alive personnel inside the marker to be considered extracted. Default 75";
						control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            validate = "number";
						defaultValue = "75";
        };
	};
};

class EndConditionCaptureZoneSettings_Category4
{
    displayName = "CaptureZone Settings";
    collapsed = 0;
    class Attributes
    {

		class UO_FW_EndCondition_CaptureZoneCaptured_Array_4
    {
        property = "UO_FW_EndCondition_CaptureZoneCaptured_Array_4";
        displayName = "CaptureZone Names";
        tooltip = "List of CaptureZones names that must be captured for the end condition to fire. Leave empty to disable.";
				control = "EditArray";
        expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
				defaultValue = "[]";
    };
		class UO_FW_EndCondition_CaptureZoneCaptured_Team_4
    {
        property = "UO_FW_EndCondition_CaptureZoneCaptured_Team_4";
        displayName = "CaptureZone Team";
        tooltip = "Team that must activate the CaptureZones for the condition to fire.";
				control = "UO_FW_ENDCONDITIONS_CaptureZoneTEAM";
        expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
        defaultValue = "1";
    };
	};
};
