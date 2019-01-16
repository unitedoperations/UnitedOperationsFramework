class UO_FW_StartInParachuteOptions  {
	displayName = "Start in Parachute Options";
	collapsed = 1;
	class Attributes  {
		class UO_FW_StartInParachute {
			displayName = "Start in Parachute";
			tooltip = "Set Parachute Type of a unit";
			property = "UO_FW_StartInParachute";
			control = "UO_FW_StartInParachuteAttribute";
			expression = "if !(is3DEN) then {_propertyName = '%s'; _parachuteValue = ['NONE','NONSTEERABLE','STEERABLE'] select _value; [_this, _propertyName, _parachuteValue, false] call UO_FW_fnc_setInitVar;};";
			condition = "objectControllable";
			defaultValue = "0";
		};
		class UO_FW_ParachuteAltitude {
			displayName = "Parachute Altitude";
			tooltip = "Altitude at which unit is parachuted";
			property = "UO_FW_ParachuteAltitude";
			control = "EditShort";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
			condition = "objectControllable";
			validate = "number";
			defaultValue = "300";
		};
		class UO_FW_ParachuteRandomAltitude {
			displayName = "Parachute Randomized Altitude";
			tooltip = "Adds a random height to the normal parachute altitude";
			property = "UO_FW_ParachuteRandomAltitude";
			control = "EditShort";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
			condition = "objectControllable";
			validate = "number";
			defaultValue = "100";
		};
	};
};
