class UO_FW_CoverMapUnitSettings {
	displayName = "Cover Map Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_CoverMap_UnitAONameArray {
        	property = "UO_FW_CoverMap_UnitAONameArray";
        	displayName = "CoverMap AO List";
        	tooltip = "List of AO Names that this unit can access via ace interact on map if CoverMap setting is enabled. Leave blank to disable.";
        	control = "EditStringArray";
			condition = "ObjectControllable";
        	expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
        	defaultValue = "[]";
    	};
		class UO_FW_CoverMap_UnitDefaultAO {
        	property = "UO_FW_CoverMap_UnitDefaultAO";
        	displayName = "CoverMap Default AO";
        	tooltip = "AO that the unit will be set to upon mission start. Leave blank to set AO to side default set in the module settings.";
        	control = "UO_FW_EditShortPlayerOnlyCategory";
        	validate = "STRING";
			condition = "ObjectControllable";
        	expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
        	defaultValue = "''";
    	};
	};
};
