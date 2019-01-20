class UO_FW_RespawnTemplates {
    respawnTemplatesNone[] = {"TestSetting0"};
    respawnTemplatesUnlimited[] = {"TestSetting0"};
    respawnTemplatesIndTick[] = {"TestSetting2","TestSetting4"};
    respawnTemplatesTeamTick[] = {"TestSetting3","TestSetting4"};
    respawnTemplatesWave[] = {"TestSetting5"};
    respawnTemplatesTriggered[] = {"TestSetting6","TestSetting7"};
    class TestSetting0 {
        displayName = "Test Setting all";
    };
    class TestSetting1 {
        displayName = "Test Setting Unlimited";
        respawnTypes[] = {1};
    };
    class TestSetting2 {
        displayName = "Test Setting Individual Tickets";
        respawnTypes[] = {2};
    };
    class TestSetting3 {
        displayName = "Test Setting Team Tickets";
        respawnTypes[] = {3};
    };
    class TestSetting4 {
        displayName = "Test Setting Any Tickets";
        respawnTypes[] = {2,3};
    };
    class TestSetting5 {
        displayName = "Wave Setting";
        respawnTypes[] = {4};
    };
    class TestSetting6 {
        displayName = "Triggered Setting";
        respawnTypes[] = {5};
    };
    class TestSetting7 {
        displayName = "Secondary Triggered Setting";
        respawnTypes[] = {5};
    };
};
