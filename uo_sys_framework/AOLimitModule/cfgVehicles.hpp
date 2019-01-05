
	class UO_FW_AOLimitModule: OlsenModule {
		displayName = "AO Limit Module"; // Name displayed in the menu
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Name of function triggered once conditions are met
		function = "UO_FW_fnc_AOLimit";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 1;
		canSetArea = 1;
		icon = "\x\UO_FW\addons\main\AOLimitModule\resources\aolimitmodule_ca.paa";

		class AttributeValues {
	    size2[] = {100,100};
			IsRectangle = 0;
	  };

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			class Attributes	{
				class UO_FW_AOLimit_RadiusX {
					displayName = "Radius X";
					tooltip = "The size of the X value of the setup zone. Default: 100";
					property = "UO_FW_AOLimit_RadiusX";
					control = "UO_FW_AI_moduleradiusControl";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "100";
					typeName = "NUMBER";
					validate = "number";
				};
				class UO_FW_AOLimit_RadiusY {
					displayName = "Radius Y";
					tooltip = "The size of the Y value of the setup zone. Default: 100";
					property = "UO_FW_AOLimit_RadiusY";
					control = "UO_FW_AI_moduleradiusControl2";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "100";
					typeName = "NUMBER";
					validate = "number";
				};
				class UO_FW_AOLimit_AOMode {
					displayName = "AO Mode";
					tooltip = "Set the AO as a Soft AO that gives players time to return to the area before killing them, or a hard AO which forces the player inside the AO.";
					property = "UO_FW_AOLimit_AOMode";
					control = "UO_FW_AOModeAttribute";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "0";
				};
				class UO_FW_AOLimit_Blufor {
					displayName = "Blufor";
					tooltip = "Restrict Blufor to this AO. Units that start outside of the AO will be not be restricted.";
					property = "UO_FW_AOLimit_Blufor";
					control = "CheckBox";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "true";
					typeName = "BOOL";
					validate = "none";
				};
				class UO_FW_AOLimit_Opfor {
					displayName = "Opfor";
					tooltip = "Restrict Opfor to this AO. Units that start outside of the AO will be not be restricted.";
					property = "UO_FW_AOLimit_Opfor";
					control = "CheckBox";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "true";
					typeName = "BOOL";
					validate = "none";
				};
				class UO_FW_AOLimit_Indfor {
					displayName = "Indfor";
					tooltip = "Restrict Indfor to this AO. Units that start outside of the AO will be not be restricted.";
					property = "UO_FW_AOLimit_Indfor";
					control = "CheckBox";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "true";
					typeName = "BOOL";
					validate = "none";
				};
				class UO_FW_AOLimit_Civilian {
					displayName = "Civilian";
					tooltip = "Restrict Civilian to this AO. Units that start outside of the AO will be not be restricted.";
					property = "UO_FW_AOLimit_Civilian";
					control = "CheckBox";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "true";
					typeName = "BOOL";
					validate = "none";
				};
				class UO_FW_AOLimit_EntryMode {
					displayName = "Entry Restriction";
					tooltip = "Enable to restrict players within AO if they spawned outside the area but entered it.";
					property = "UO_FW_AOLimit_EntryMode";
					control = "CheckBox";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "false";
					typeName = "BOOL";
					validate = "none";
				};
				class UO_FW_AOLimit_AirUnits {
					displayName = "Air unit exemption";
					tooltip = "Enable to exempt air units from AO restriction. Default: true";
					property = "UO_FW_AOLimit_AirUnits";
					control = "CheckBox";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "true";
					typeName = "BOOL";
					validate = "none";
				};
				//class UO_FW_AOLimit_SoftAOMode {
				//	displayName = "Soft AO";
				//	tooltip = "Enable to set the AO as a 'Soft AO' which will display a notification and countdown if player leaves the AO. Disable to have player contained in the AO via an invisible wall.";
				//	property = "UO_FW_AOLimit_SoftAOMode";
				//	control = "CheckBox";
				//	expression = "_this setVariable ['%s',_value,true];";
				//	defaultValue = "false";
				//	typeName = "BOOL";
				//	validate = "none";
				//};
				class UO_FW_AoLimit_SoftTimeOutside {
					displayName = "Max time outside of AO";
					tooltip = "The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)";
					property = "UO_FW_AoLimit_SoftTimeOutside";
					control = "EditShort";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "30";
					AOTypes[] = {0};
					typeName = "number";
					validate = "number";
				};
				class UO_FW_AoLimit_SoftTimeOutsideAir {
					displayName = "Max time outside of AO";
					tooltip = "The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)";
					property = "UO_FW_AoLimit_SoftTimeOutsideAir";
					control = "EditShort";
					expression = "_this setVariable ['%s',_value,true];";
					defaultValue = "120";
					AOTypes[] = {0};
					typeName = "number";
					validate = "number";
				};
			};
	};

	class UO_AOLimitModule : UO_FW_AOLimitModule {
		scope = 0;
	};

	class UO_FW_AOLimitModule_R : UO_FW_AOLimitModule {
		displayName = "AO Limit Module (Rectangle)"; // Name displayed in the menu
		class AttributeValues {
	      size2[] = {100,100};
				IsRectangle = 1;
	    };
	};

	class UO_AOLimitModule_R : UO_FW_AOLimitModule_R {
		scope = 0;
	};
