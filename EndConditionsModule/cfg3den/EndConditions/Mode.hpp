class EndConditionCategories
{
    displayName = "Condition Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_EndCondition_1_Mode
        {
            property = "UO_FW_EndCondition_1_Mode";
            displayName = "Condition 1 Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true";
			control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_1_Message
        {
            property = "UO_FW_EndCondition_1_Message";
            displayName = "Condition Message";
            tooltip = "Message displayed when end condition is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'End condition fired!'";
        };
		class UO_FW_EndCondition_2_Mode
        {
            property = "UO_FW_EndCondition_2_Mode";
            displayName = "Condition 2 Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true";
			control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_2_Message
        {
            property = "UO_FW_EndCondition_2_Message";
            displayName = "Condition Message";
            tooltip = "Message displayed when end condition is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'End condition fired!'";
        };
		class UO_FW_EndCondition_3_Mode
        {
            property = "UO_FW_EndCondition_3_Mode";
            displayName = "Condition 3 Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true";
			control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_3_Message
        {
            property = "UO_FW_EndCondition_3_Message";
            displayName = "Condition Message";
            tooltip = "Message displayed when end condition is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'End condition fired!'";
        };
		class UO_FW_EndCondition_4_Mode
        {
            property = "UO_FW_EndCondition_4_Mode";
            displayName = "Condition 4 Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true";
			control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_4_Message
        {
            property = "UO_FW_EndCondition_4_Message";
            displayName = "Condition Message";
            tooltip = "Message displayed when end condition is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'End condition fired!'";
        };
		class UO_FW_EndCondition_5_Mode
        {
            property = "UO_FW_EndCondition_5_Mode";
            displayName = "Condition 5 Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true";
			control = "UO_FW_ENDCONDITIONS_MODEATTRIBUTE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_EndCondition_5_Message
        {
            property = "UO_FW_EndCondition_5_Message";
            displayName = "Condition Message";
            tooltip = "Message displayed when end condition is triggered";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'End condition fired!'";
        };
    };
};