class UO_FW_JIPCategory {
    displayName = "JiP Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_JIP_DENYTIME {
            property = "UO_FW_JIP_DENYTIME";
            displayName = "Deny Time";
            tooltip = "After how many seconds should a player be considered JIP (this only applies if you are using DENY";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "300";
        };
        class UO_FW_JIP_EXPIRETIME {
            property = "UO_FW_JIP_EXPIRETIME";
            displayName = "Expire Time";
            tooltip = "After how many minutes JiPs will no longer have teleport or transport actions.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "30";
        };
        class UO_FW_JIP_EnemyDISTANCE {
            property = "UO_FW_JIP_EnemyDISTANCE";
            displayName = "Nearby Enemy Distance";
            tooltip = "Denies teleport action if the distance between enemies and the intended teleport location is less than this value in metres";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "100";
        };
        class UO_FW_JIP_TitleBLUFOR {
            property = "UO_FW_JIP_TitleBLUFOR";
            displayName = "BLUFOR";
            control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_Type_BLUFOR {
            property = "UO_FW_JIP_Type_BLUFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_JIP_Distance_BLUFOR {
            property = "UO_FW_JIP_Distance_BLUFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class UO_FW_JIP_SpawnDistance_BLUFOR {
            property = "UO_FW_JIP_SpawnDistance_BLUFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
        class UO_FW_JIP_TitleOPFOR {
            property = "UO_FW_JIP_TitleOPFOR";
            displayName = "OPFOR";
            control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_Type_OPFOR {
            property = "UO_FW_JIP_Type_OPFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_JIP_Distance_OPFOR {
            property = "UO_FW_JIP_Distance_OPFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class UO_FW_JIP_SpawnDistance_OPFOR {
            property = "UO_FW_JIP_SpawnDistance_OPFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
        class UO_FW_JIP_TitleINDFOR {
            property = "UO_FW_JIP_TitleINDFOR";
            displayName = "INDFOR";
            control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_Type_INDFOR {
            property = "UO_FW_JIP_Type_INDFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_JIP_Distance_INDFOR {
            property = "UO_FW_JIP_Distance_INDFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class UO_FW_JIP_SpawnDistance_INDFOR {
            property = "UO_FW_JIP_SpawnDistance_INDFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
        class UO_FW_JIP_TitleCIVILIAN {
            property = "UO_FW_JIP_TitleCIVILIAN";
            displayName = "CIVILIAN";
            control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
        class UO_FW_JIP_Type_CIV {
            property = "UO_FW_JIP_Type_CIV";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_JIP_Distance_CIV {
            property = "UO_FW_JIP_Distance_CIV";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class UO_FW_JIP_SpawnDistance_CIV {
            property = "UO_FW_JIP_SpawnDistance_CIV";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
    };
};
