class UO_FW_RespawnTemplates {
	respawnTemplatesNone[] = {};
	respawnTemplatesIndTick[] = {};
	respawnTemplatesTeamTick[] = {};
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
