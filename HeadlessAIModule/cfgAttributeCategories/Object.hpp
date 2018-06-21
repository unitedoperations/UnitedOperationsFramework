
class UO_FW_UnitOptions {
	displayName = "AI Unit Options"; 
	collapsed = 0;
	class Attributes {
		class aeUnitName {
			displayName = "Name";
			tooltip = "Pass custom name to the unit. Default: Nil";
			property = "UO_FW_unitName";
			control = "UO_FW_unitnameControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "''";
		};
		class aeUnitIdentity {
			displayName = "Identity";
			tooltip = "Set the custom name to appear when the units Identity is checked. Default: Nil";
			property = "UO_FW_unitIdentity";
			control = "UO_FW_standardStringOneControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "''";
		};
		class aePersistent {
			displayName = "Persistent";
			tooltip = "Is the unit persistent, will be it get cleaned up by the clean up script if it dies. Default: Not Persistent";
			property = "UO_FW_unitPersistent";
			control = "UO_FW_persistentControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "false";
			typeName = "BOOL";
		};					
		class aeStance {
			displayName = "Stance";
			tooltip = "Force the stance of the unit. Default: AUTO";
			property = "UO_FW_stance";
			control = "UO_FW_stanceControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'auto'";
			condition = "objectControllable";
		};
		class aeRemove {
			displayName = "Remove Menu";
			tooltip = "Select option to remove certain equipment from unit. Default: OFF";
			property = "UO_FW_remove";
			control = "UO_FW_removeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			condition = "objectControllable";
		};	/*
		class aeAddIntel {
			displayName = "Add Intel";
			tooltip = "Select an intel item to add to the unit. Default: None";
			property = "UO_FW_addIntel";
			control = "UO_FW_removeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			condition = "objectControllable";
		};*/
		class aeFlying {
			displayName = "Flying";
			tooltip = "Is the unit spawning in flight. Default: False";
			property = "UO_FW_unitFlying";
			control = "UO_FW_flyingControl";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectVehicle";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class aeVBIED {
			displayName = "Vehicle IED";
			tooltip = "Is this vehicle a Vehicle Born Improvised Explosive Device - VBIED. Default: False";
			property = "UO_FW_vbied";
			control = "UO_FW_boolControl";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectVehicle";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class aeFlyInHeight {
			displayName = "Flight Height";
			tooltip = "Set the unit flying height. Default: 250";
			property = "UO_FW_unitFlyInHeight";
			control = "UO_FW_flyinheightControl";
			expression = "_this setVariable ['%s',_value];";
			condition = "objectVehicle";
			defaultValue = 250;
			typeName = "NUMBER";
		}; /*
		class aeOnKilled {
			displayName = "On Killed Code";
			tooltip = "Execute a custom script when the unit is killed.( _this = unit ) Default: Nil";
			property = "UO_FW_unitOnKilled";
			control = "UO_FW_codeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "";
		}; */
		class aeUnitInit {
			displayName = "Init";
			tooltip = "Pass custom parameters or code to the unit.( _this = unit ) Default: Nil";
			property = "UO_FW_unitInit";
			control = "UO_FW_codeunitControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "";
		};	
	};
};
class Init : Init {collapsed = 1;};
class Transformation : Transformation {collapsed = 1;};
class Control : Control {collapsed = 1;};
class State : State {collapsed = 1;};


