class JIPCategory
{
    displayName = "JiP Settings";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_JIP_DENYTIME
        {
            property = "UO_FW_JIP_DENYTIME";
            displayName = "Deny Time";
            tooltip = "After how many seconds should a player be considered JIP (this only applies if you are using DENY";
			control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "300";
        };
		class UO_FW_JIP_EXPIRETIME
        {
            property = "UO_FW_JIP_EXPIRETIME";
            displayName = "Expire Time";
            tooltip = "After how many minutes JiPs will no longer have teleport or transport actions.";
			control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "30";
        };
		class UO_FW_JIP_ENEMYDISTANCE
        {
            property = "UO_FW_JIP_ENEMYDISTANCE";
            displayName = "Nearby Enemy Distance";
            tooltip = "Denies teleport action if the distance between enemies and the intended teleport location is less than this value in metres";
			control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "100";
        };
		class UO_FW_JIP_TitleBLUFOR
        {
            property = "UO_FW_JIP_TitleBLUFOR";
            displayName = "BLUFOR";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_TypeBLUFOR
        {
            property = "UO_FW_JIP_TypeBLUFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_JIP_DistanceBLUFOR
        {
            property = "UO_FW_JIP_DistanceBLUFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "200";
        };
		class UO_FW_JIP_SpawnDistanceBLUFOR
        {
            property = "UO_FW_JIP_SpawnDistanceBLUFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "50";
        };
		class UO_FW_JIP_TitleOPFOR
        {
            property = "UO_FW_JIP_TitleOPFOR";
            displayName = "OPFOR";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_TypeOPFOR
        {
            property = "UO_FW_JIP_TypeOPFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_JIP_DistanceOPFOR
        {
            property = "UO_FW_JIP_DistanceOPFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "200";
        };
		class UO_FW_JIP_SpawnDistanceOPFOR
        {
            property = "UO_FW_JIP_SpawnDistanceOPFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "50";
        };
		class UO_FW_JIP_TitleINDFOR
        {
            property = "UO_FW_JIP_TitleINDFOR";
            displayName = "INDFOR";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_TypeINDFOR
        {
            property = "UO_FW_JIP_TypeINDFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_JIP_DistanceINDFOR
        {
            property = "UO_FW_JIP_DistanceINDFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "200";
        };
		class UO_FW_JIP_SpawnDistanceINDFOR
        {
            property = "UO_FW_JIP_SpawnDistanceINDFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "50";
        };
		class UO_FW_JIP_TitleCIVILIAN
        {
            property = "UO_FW_JIP_TitleCIVILIAN";
            displayName = "CIVILIAN";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_TypeCIVILIAN
        {
            property = "UO_FW_JIP_TypeCIVILIAN";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "0";
        };
		class UO_FW_JIP_DistanceCIVILIAN
        {
            property = "UO_FW_JIP_DistanceCIVILIAN";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "200";
        };
		class UO_FW_JIP_SpawnDistanceCIVILIAN
        {
            property = "UO_FW_JIP_SpawnDistanceCIVILIAN";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "number";
            defaultValue = "50";
        };
    };
};