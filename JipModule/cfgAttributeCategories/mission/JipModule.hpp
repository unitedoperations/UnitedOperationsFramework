class UO_FW_Jip
{
    displayName = "Jip Settings";
    collapsed = 0;
    class Attributes
    {
        class UO_FW_Jip_Enabled
        {
            property = "UO_FW_Jip_Enabled";
            displayName = "Jip";
            tooltip = "Enables Jip";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
            typeName = "BOOL";

        };
        class UO_FW_Jip_BluforTypeSelect
		{
			displayName = "Blufor Jip Type";
			tooltip = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
			control = "Combo";
			typeName = "STRING";
			property = "UO_FW_Jip_BluforTypeSelect";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			class values
            {
                class Teleport    {name = "Teleport"; value = "TELEPORT"; default = "TELEPORT";};
                class Transport    {name = "Transport"; value = "TRANSPORT";};
                class Deny    {name = "Deny"; value = "DENY";};
            };
            defaultValue = "'TELEPORT'";
		};
        class UO_FW_Jip_OpforTypeSelect
		{
			displayName = "Opfor Jip Type";
			tooltip = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
			control = "Combo";
			typeName = "STRING";
			property = "UO_FW_Jip_OpforTypeSelect";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			class values
            {
                class Teleport    {name = "Teleport"; value = "TELEPORT"; default = "TELEPORT";};
                class Transport    {name = "Transport"; value = "TRANSPORT";};
                class Deny    {name = "Deny"; value = "DENY";};
            };
              defaultValue = "'TELEPORT'";
		};
        class UO_FW_Jip_IndependentTypeSelect
		{
			displayName = "Independent Jip Type";
			tooltip = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
			control = "Combo";
			typeName = "STRING";
			property = "UO_FW_Jip_IndependentTypeSelect";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			class values
            {
                class Teleport    {name = "Teleport"; value = "TELEPORT"; default = "TELEPORT";};
                class Transport    {name = "Transport"; value = "TRANSPORT";};
                class Deny    {name = "Deny"; value = "DENY";};
            };
              defaultValue = "'TELEPORT'";
		};
        class UO_FW_Jip_CivilianTypeSelect
		{
			displayName = "Civilian Jip Type";
			tooltip = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
			control = "Combo";
			typeName = "STRING";
			property = "UO_FW_Jip_CivilianTypeSelect";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			class values
            {
                class Teleport    {name = "Teleport"; value = "TELEPORT"; default = "TELEPORT";};
                class Transport    {name = "Transport"; value = "TRANSPORT";};
                class Deny    {name = "Deny"; value = "DENY";};
            };
              defaultValue = "'TELEPORT'";
		};
        class UO_FW_Jip_SpawnDistance
        {
            property = "UO_FW_Jip_SpawnDistance";
            displayName = "Spawn Distance";
            tooltip = "If you move SPAWNDISTANCE away from your spawn position you loose the option to teleport or request transport.";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "300";
            typeName = "NUMBER";
        };
        class UO_FW_Jip_JipDistance
        {
            property = "UO_FW_Jip_JipDistance";
            displayName = "Jip Distance";
            tooltip = "When you spawn, if your squad members are more then JIPDISTANCE away, you get the option to teleport or request transport.";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "50";
            typeName = "NUMBER";
        };
        class UO_FW_Jip_JipDenyTime
        {
            property = "UO_FW_Jip_JipDenyTime";
            displayName = "Jip Deny Time";
            tooltip = "How long until JIPS are denied in seconds. Default 300.";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "300";
            typeName = "NUMBER";
        };
    };
};