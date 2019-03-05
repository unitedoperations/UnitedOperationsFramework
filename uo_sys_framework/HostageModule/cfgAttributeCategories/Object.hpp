class EGVAR(Hostage,Attributes) {
    displayName = "Hostage Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(Hostage,State) {
            displayName = "Hostage";
            tooltip = "Makes this unit a hostage that starts bound/captive and must be rescued via player action.";
            property = QEGVAR(Hostage,State);
            control = "CheckboxState";
            expression = "\
                private _propertyName = '%s';\
                _this setVariable [_propertyName, _value];\
                diag_log format ['queued _fncName: %1','UO_FW_fnc_Hostage_Set'];\
                private _marker = _this getvariable ['UO_FW_Hostage_Rescue_Location','hostage_rescue'];\
                _marker setMarkerAlpha 0;\
                [{CBA_missionTime > 0},{\
                	params ['_object','_propertyName','_value','_fncName'];\
                	if (local _object) then {\
                        diag_log format ['_object: %1 calling %2',_object,'UO_FW_fnc_Hostage_Set'];\
                		[_object,_value] call UO_FW_fnc_Hostage_Set;\
                	};\
                },[_this,_propertyName,_value]] call CBA_fnc_WaitUntilAndExecute;\
            ";
            condition = "objectControllable ";
            defaultValue = "false";
        };
        class EGVAR(Hostage,Rescue_Location) {
            displayName = "Hostage Rescue Zone";
            tooltip = "Marker that determines the hostage rescue zone. (Default: 'hostage_rescue' marker)";
            property = QEGVAR(Hostage,Rescue_Location);
            control = "EditShort";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable ";
            defaultValue = "'hostage_rescue'";
        };
         class EGVAR(Hostage,Freed_JoinSquad) {
            displayName = "Hostage Joins Squad";
            tooltip = "Determine if the hostage will join the squad of the player who frees them. (Default: true)";
            property = QEGVAR(Hostage,Freed_JoinSquad);
            control = "Checkbox";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable ";
            defaultValue = "true";
        };
        class EGVAR(Hostage,Freed_Behavior_Modifier) {
            displayName = "Hostage Freed Behavior Change";
            tooltip = "Enable modifiers for hostage's behavior when they are freed. (False by default.)";
            property = QEGVAR(Hostage,Freed_Behavior_Modifier);
            control = "Checkbox";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable ";
            defaultValue = "false";
        };
        class EGVAR(Hostage,Freed_Behavior) {
            displayName = "Hostage Freed Behavior";
            tooltip = "Determine the hostages behavior when freed by the player.\nWill not function unless 'Hostage Freed Modifiers' is enabled. (Default: CARELESS)";
            property = QEGVAR(Hostage,Freed_Behavior);
            control = "UO_FW_HostageFreedBehaviorAttribute";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable ";
            defaultValue = "'Careless'";
        };
    };
};
