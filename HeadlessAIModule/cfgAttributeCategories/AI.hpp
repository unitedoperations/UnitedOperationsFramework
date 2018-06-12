class Group {
	class AttributeCategories {
		class UO_FW_GroupBehaviour {
			displayName = "AI Group Behavour Options"; 
			collapsed = 0;
			class Attributes {
				class aeBehaviour {
					displayName = "Behaviour";
					tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
					property = "UO_FW_behaviour";
					control = "UO_FW_behaviourControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "'safe'";
				};
				class aeCombatMode {
					displayName = "CombatMode";
					tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
					property = "UO_FW_combatMode";
					control = "UO_FW_combatModeControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "'red'";
				};
				class aeSpeed {
					displayName = "Speed";
					tooltip = "Speed of the group or unit on activation. Default: Limited";
					property = "UO_FW_speed";
					control = "UO_FW_speedControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "'limited'";
				};
				class aeFormation {
					displayName = "Formation";
					tooltip = "Formation of the group or unit on activation. Default: WEDGE";
					property = "UO_FW_formation";
					control = "UO_FW_formationControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "'wedge'";
				};
				class aeGroupStance {
					displayName = "Group Stance";
					tooltip = "Force the stance of the group. Default: AUTO";
					property = "UO_FW_groupStance";
					control = "UO_FW_stanceControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "'auto'";
				};
				class aeForceLights {
					displayName = "Force Flashlights";
					tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
					property = "UO_FW_forceLights";
					control = "UO_FW_forcelightsControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "false";
					typeName = "BOOL";
				};
				class aeSurrender {
					displayName = "Will Surrender";
					tooltip = "This group will surrender if there team leader dies or they take greater than 50% casualties. Default: False";
					property = "UO_FW_surrender";
					control = "UO_FW_boolControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "false";
					typeName = "BOOL";
				};
				/*class aeTracker {
					displayName = "Can Track Players";
					tooltip = "This group can track the nearby players (within 600), if no player to track or player moves out of range the group will continue assigned task. Default: False";
					property = "UO_FW_tracker";
					control = "UO_FW_boolControl2";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "false";
					typeName = "BOOL";
				};*/
				class aeGroupInit {
					displayName = "Group Init";
					tooltip = "Pass custom parameters or code to the group of units. ( _this = GROUP ) Default: Nil";
					property = "UO_FW_groupInit";
					control = "UO_FW_codeControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "'true'";
				};					
			};
		};
		class UO_FW_GroupTask {
			displayName = "AI Group Task Options"; 
			collapsed = 0;
			class Attributes {
				class aeCreateRadius {
					displayName = "Creation Radius";
					tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
					property = "UO_FW_createRadius";
					control = "UO_FW_standardNumberControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "0";
					typeName = "NUMBER";
					validate = "number";
				};
				class aePatrolRadius {
					displayName = "Task Radius";
					tooltip = "Radius that Group will conduct the assigned task in. Default: 100m";
					property = "UO_FW_patrolRadius";
					control = "UO_FW_patrolradiusControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "100";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeWaypointWait {
					displayName = "Waypoint Wait Time";
					tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
					property = "UO_FW_waypointWait";
					control = "UO_FW_waypointwaitControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "3";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeStartBuilding {
					displayName = "Start in Building";
					tooltip = "Group will start inside nearest building then move out to conduct set task. Building Occupy tasks overide this setting. Default: Off";
					property = "UO_FW_startBuilding";
					control = "UO_FW_startbuildingControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "false";
					typeName = "BOOL";
				};
				class aeTask {
					displayName = "Task";
					tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
					property = "UO_FW_task";
					control = "UO_FW_taskControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "4";
				};
				class aeTaskTimer {
					displayName = "Time";
					tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
					property = "UO_FW_TaskTimer";
					control = "UO_FW_standardNumberAltControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "0";
					typeName = "NUMBER";
					validate = "number";
				};
			};
		};
		class UO_FW_GroupPopulate {
			displayName = "AI Populate Options"; 
			collapsed = 0;
			class Attributes {
				class aeMultiplier {
					displayName = "Group Multiplier";
					tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
					property = "UO_FW_multiplier";
					control = "UO_FW_multiplierControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "1";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeMultiOccupy {
					displayName = "Multiplied Groups Occupy Options";
					tooltip = "How many generated groups from the group muliplier will use the occupy options below. Default: NO CHANGE";
					property = "UO_FW_multiOccupy";
					control = "UO_FW_multioccupyControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "0";
				};
				class aeOccupyOption {
					displayName = "Occupy Building Options";
					tooltip = "Should the group occupy a building or buildings. Default: OFF";
					property = "UO_FW_occupyOption";
					control = "UO_FW_occupyoptionControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "0";
				};	
			};
		};
		
		class UO_FW_ParaOptions {
			displayName = "AI Para Options"; 
			collapsed = 1;
			class Attributes {
				class aeParaEnable {
					displayName = "Enable Para Drop";
					tooltip = "Set to ON to enable para drop insertion of this group when they spawn.";
					property = "UO_FW_paraEnable";
					control = "UO_FW_paraenableControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "false";
					typeName = "BOOL";
				};
				class aeParaHeight {
					displayName = "Height";
					tooltip = "Height that the parachuter's will start falling from. Default: 3000m.";
					property = "UO_FW_paraHeight";
					control = "UO_FW_paraheightControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "3000";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeParaDirection {
					displayName = "Direction";
					tooltip = "The direction the entities will face to form the drop column when parachuting. Default: Random 360 (-1)";
					property = "UO_FW_paraDirection";
					control = "UO_FW_paradirectionControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "-1";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeParaColMaxLength {
					displayName = "Column Max Length";
					tooltip = "The maximum length a column will be before another one is started. Default: 100m";
					property = "UO_FW_paraColMaxLength";
					control = "UO_FW_paralengthControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "100";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeParaSpacing {
					displayName = "Spacing";
					tooltip = "The spacing between each entity in the column. Default: 25m";
					property = "UO_FW_paraSpacing";
					control = "UO_FW_paraspacingControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "25";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeParaSpread {
					displayName = "Spread";
					tooltip = "Spread of each column side by side. Default: 25m";
					property = "UO_FW_paraSpread";
					control = "UO_FW_paraspreadControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "25";
					typeName = "NUMBER";
					validate = "number";
				};
				class aeParaSmoke {
					displayName = "Vehicle Smoke";
					tooltip = "Vehicle deploys smoke to indicate its position on the ground. Default: Off";
					property = "UO_FW_paraSmoke";
					control = "UO_FW_parasmokeControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "false";
					typeName = "BOOL";
				};
				class aeParaRealism {
					displayName = "Realism";
					tooltip = "Turn realism off to enable parachuting of all vehicles otherwise limited by realistic weight limits. Default: On (Weight Limit: 25000)";
					property = "UO_FW_paraRealism";
					control = "UO_FW_pararealsmControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "true";
					typeName = "BOOL";
				};
			};
		};
		
		class Init : Init {collapsed = 1;};
		class State : State {collapsed = 1;};
	};		
};
class Object {
	 class Draw
    {
        class 3D
        {

            fadeDistance = "(getObjectViewDistance select 0)";
        };
    };
	class AttributeCategories {
		class UO_FW_UnitOptions {
			displayName = "AI Unit Options"; 
			collapsed = 0;
			class Attributes {
				class aeUnitName					{
					displayName = "Name";
					tooltip = "Pass custom name to the unit. Default: Nil";
					property = "UO_FW_unitName";
					control = "UO_FW_unitnameControl";
					expression = "_this setVariable ['%s',_value];";
					defaultValue = "''";
				};
				class aeUnitIdentity					{
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
	};
};

class Logic {
	class AttributeCategories {
		class Type : Type {collapsed = 1;};
		class Init : Init {collapsed = 1;};
		class Transformation : Transformation {collapsed = 1;};
		class Control : Control {collapsed = 1;};
		class Presence : Presence {collapsed = 1;};
	};
};