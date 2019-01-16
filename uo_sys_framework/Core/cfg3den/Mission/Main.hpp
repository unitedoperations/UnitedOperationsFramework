class UO_FW_MainSettings {
    displayName = "Main Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_Enabled {
            property = "UO_FW_Enabled";
            displayName = "Enable UO Framework";
            tooltip = "Enable UO Framework";
            control = "Checkbox";
            expression="if (is3DEN) then {if (_value) then {[] call UO_FW_fnc_BasicSettings3Den;};}; missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";

        };
        class UO_FW_Type {
            property = "UO_FW_Type";
            displayName = "Mission Type";
            tooltip = "Determines Mission Type";
            control = "MissionType";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "0";
        };
    };
};
