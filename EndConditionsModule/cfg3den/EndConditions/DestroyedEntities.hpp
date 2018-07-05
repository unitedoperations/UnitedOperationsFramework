class DestroyedEntities
{
    displayName = "Entity Status";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_DestroyedEntities_1_Name
        {
            property = "UO_FW_DestroyedEntities_1_Name";
            displayName = "Entity Var Name";
            tooltip = "Entity checked for alive status. Fires when setting below is triggered";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "string";
            defaultValue = "''";
        };
		class UO_FW_DestroyedEntities_1_Type
        {
            property = "UO_FW_DestroyedEntities_1_Type";
            displayName = "Trigger Type";
            tooltip = "Whether the condition should fire if object is destroyed/dead, damaged, or alive";
			control = "UO_FW_ENDCONDITIONS_DESTROYTYPE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_DestroyedEntities_1_EndCondition_Apply
        {
            property = "UO_FW_DestroyedEntities_1_EndCondition_Apply";
            displayName = "End Condition Categories";
            tooltip = "Apply this requirement to selected end conditions";
            control = "UO_FW_ENDCONDITIONS_SELECT";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_DestroyedEntities_2_Name
        {
            property = "UO_FW_DestroyedEntities_2_Name";
            displayName = "Entity Var Name";
            tooltip = "Entity checked for alive status. Fires when setting below is triggered";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "string";
            defaultValue = "''";
        };
		class UO_FW_DestroyedEntities_2_Type
        {
            property = "UO_FW_DestroyedEntities_2_Type";
            displayName = "Trigger Type";
            tooltip = "Whether the condition should fire if object is destroyed/dead, damaged, or alive";
			control = "UO_FW_ENDCONDITIONS_DESTROYTYPE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_DestroyedEntities_2_EndCondition_Apply
        {
            property = "UO_FW_DestroyedEntities_2_EndCondition_Apply";
            displayName = "End Condition Categories";
            tooltip = "Apply this requirement to selected end conditions";
            control = "UO_FW_ENDCONDITIONS_SELECT";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_DestroyedEntities_3_Name
        {
            property = "UO_FW_DestroyedEntities_3_Name";
            displayName = "Entity Var Name";
            tooltip = "Entity checked for alive status. Fires when setting below is triggered";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "string";
            defaultValue = "''";
        };
		class UO_FW_DestroyedEntities_3_Type
        {
            property = "UO_FW_DestroyedEntities_3_Type";
            displayName = "Trigger Type";
            tooltip = "Whether the condition should fire if object is destroyed/dead, damaged, or alive";
			control = "UO_FW_ENDCONDITIONS_DESTROYTYPE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_DestroyedEntities_3_EndCondition_Apply
        {
            property = "UO_FW_DestroyedEntities_3_EndCondition_Apply";
            displayName = "End Condition Categories";
            tooltip = "Apply this requirement to selected end conditions";
            control = "UO_FW_ENDCONDITIONS_SELECT";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "[]";
        };
		class UO_FW_DestroyedEntities_4_Name
        {
            property = "UO_FW_DestroyedEntities_4_Name";
            displayName = "Entity Var Name";
            tooltip = "Entity checked for alive status. Fires when setting below is triggered";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "string";
            defaultValue = "''";
        };
		class UO_FW_DestroyedEntities_4_Type
        {
            property = "UO_FW_DestroyedEntities_4_Type";
            displayName = "Trigger Type";
            tooltip = "Whether the condition should fire if object is destroyed/dead, damaged, or alive";
			control = "UO_FW_ENDCONDITIONS_DESTROYTYPE";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_DestroyedEntities_4_EndCondition_Apply
        {
            property = "UO_FW_DestroyedEntities_4_EndCondition_Apply";
            displayName = "End Condition Categories";
            tooltip = "Apply this requirement to selected end conditions";
            control = "UO_FW_ENDCONDITIONS_SELECT";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "[]";
        };
    };
};