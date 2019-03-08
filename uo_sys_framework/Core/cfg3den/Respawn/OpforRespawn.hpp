class EGVAR(TeamRespawnSettings,Opfor) {
    displayName = "OPFOR Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
        class EGVAR(Respawn,Type_Opfor) {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for OPFOR. Place down a GameLogic object with name UO_FW_RESPAWN_OPFOR to define respawn location.";
            control = "UO_FW_Respawn_Combo_Opfor";
            defaultValue = "0";
            property = QEGVAR(Respawn,Type_Opfor);
            expression = SCENARIO_EXPRESSION;
        };
        class EGVAR(Respawn,Templates_Opfor) {
            property = QEGVAR(Respawn,Templates_Opfor);
            displayName = "Respawn System Settings";
            tooltip = "";
            control = "UO_FW_RespawnTemplates_Opfor";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "['']";
        };
        class EGVAR(Respawn,NewTeam_Opfor) {
            property = QEGVAR(Respawn,NewTeam_Opfor);
            displayName = "Respawn Side";
            tooltip = "Determines what side the originally OPFOR players will spawn on. Enabling this setting requires respawned players to join a new group.";
            respawnTypes[] = {1,2,3};
            control = "UO_FW_RespawnSide_Combo";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "1";
        };
        class EGVAR(Respawn,Delay_Opfor) {
            property = QEGVAR(Respawn,Delay_Opfor);
            displayName = "Respawn Delay";
            tooltip = "Delay in seconds between a player being killed and respawning. Must be more than 5 seconds.";
            respawnTypes[] = {1,2,3,4,5};
            control = QMGVAR(5To20Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "5";
            validate = "number";
        };
        class EGVAR(Respawn,IndTickets_Opfor) {
            property = QEGVAR(Respawn,IndTickets_Opfor);
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = QMGVAR(1To10Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class EGVAR(Respawn,TeamTickets_Opfor) {
            property = QEGVAR(Respawn,TeamTickets_Opfor);
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = QMGVAR(10To100Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "30";
            validate = "number";
        };
    };
};

class EGVAR(Spectator,OPFOR) {
    displayName = "OPFOR Spectate Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Spectator,EnabledTeams_OPFOR) {
            property = QEGVAR(Spectate,EnabledTeams);
            displayName = "Spectate Teams";
            tooltip = "Teams that this team can spectate.";
            control = "UO_FW_SpectateTeams_Attribute";
            defaultValue = "['BLUFOR','OPFOR','Indfor','CIVILIAN']";
            expression = SCENARIO_EXPRESSION;
        };
        class EGVAR(Spectator,KillCam_OPFOR) {
            property = QEGVAR(Spectate,KillCam);
            displayName = "Killcam";
            tooltip = "This setting enables the specator killcam functionality.";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Spectator,AIEnabled_OPFOR) {
            property = QEGVAR(Spectate,AIEnabled_OPFOR);
            displayName = "Spectate AI";
            tooltip = "Enable Spectating AI Entities.";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Spectator,FreeCam_OPFOR) {
            property = QEGVAR(Spectate,FreeCam);
            displayName = "Spectator Freecam";
            tooltip = "Enable Freecam Ability in Spectator.";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Spectator,3rdPerson_OPFOR) {
            property = QEGVAR(Spectate,3rdPerson);
            displayName = "Spectator Third Person";
            tooltip = "Enable Third Person Ability in Spectator.";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};

class EGVAR(TeamJIPSettings,OPFOR) {
    displayName = "OPFOR JiP Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(JIP,Type_OPFOR) {
            property = QEGVAR(JIP,Type_OPFOR);
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class EGVAR(JIP,Distance_OPFOR) {
            property = QEGVAR(JIP,Distance_OPFOR);
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = QMGVAR(50To200Step50_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class EGVAR(JIP,SpawnDistance_OPFOR) {
            property = QEGVAR(JIP,SpawnDistance_OPFOR);
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = QMGVAR(50To200Step50_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
    };
};
