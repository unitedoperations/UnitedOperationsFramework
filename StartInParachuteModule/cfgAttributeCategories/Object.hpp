class UO_FW_StartInParachuteOptions 
{
	displayName = "Start in Parachute Options"; 
	collapsed = 1;
	class Attributes 
	{
		class UO_FW_StartInParachute
		{
			displayName = "Start in Parachute";
			tooltip = "Set Parachute Type of a unit";
			property = "UO_FW_StartInParachute";
			control = "UO_FW_StartInParachuteAttribute";
			expression = "_parachuteValue = ['NONE','NONSTEERABLE','STEERABLE'] select _value; _this setVariable ['%s',_parachuteValue,true];";
			condition = "objectControllable";
			defaultValue = "0";
		};
		class UO_FW_ParachuteAltitude
		{
			displayName = "Parachute Altitude";
			tooltip = "Altitude at which unit is parachuted";
			property = "UO_FW_ParachuteAltitude";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			validate = "number";
			defaultValue = "300";
		};
		class UO_FW_ParachuteRandomAltitude
		{
			displayName = "Parachute Randomized Altitude";
			tooltip = "Adds a random height to the normal parachute altitude";
			property = "UO_FW_ParachuteRandomAltitude";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			validate = "number";
			defaultValue = "100";
		};
	};
};
