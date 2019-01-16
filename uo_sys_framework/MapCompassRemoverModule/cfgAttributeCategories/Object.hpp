class UO_FW_MapCompassRemoverOptions_AI {
	displayName = "Remove Compass and Map Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_KeepMapAI {
			displayName = "Keep map after briefing";
			tooltip = "If ticked the map for the unit will be kept even if the module setting to remove all AI maps is enabled";
			property = "UO_FW_KeepMapAI";
			control = "UO_FW_CheckBoxAIOnlyCategory";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_KeepCompassAI {
			displayName = "Keep compass after briefing";
			tooltip = "If ticked the compass for the unit will be kept even if the module setting to remove all AI compasses is enabled";
			property = "UO_FW_KeepCompassAI";
			control = "Checkbox";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
			condition = "objectControllable";
			defaultValue = "false";
		};
	};
};


class UO_FW_MapCompassRemoverOptions_Player {
	displayName = "Remove Compass and Map Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_RemoveMap {
			displayName = "Remove map after briefing";
			tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveMap";
			control = "UO_FW_CheckBoxPlayerOnlyCategory";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar; if ((_value) && (UO_FW_Server_RemoverModule_Allowed)) then { [{(time > 1)}, {_this unlinkItem 'ItemMap';}] call CBA_fnc_waitUntilAndExecute;};};";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_RemoveCompass {
			displayName = "Remove compass after briefing";
			tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveCompass";
			control = "Checkbox";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar; if ((_value) && (UO_FW_Server_RemoverModule_Allowed)) then { [{(time > 1)}, {_this unlinkItem 'ItemCompass';}] call CBA_fnc_waitUntilAndExecute;};};";
			condition = "objectControllable";
			defaultValue = "false";
		};
	};
};
