class UO_FW_GroupBehaviour {
	displayName = "AI Group Behavour Options";
	collapsed = 0;
	class Attributes {
		class UO_FW_behaviour {
			displayName = "Behaviour";
			tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
			property = "UO_FW_behaviour";
			control = "UO_FW_behaviourControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'safe'";
		};
		class UO_FW_combatMode {
			displayName = "CombatMode";
			tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
			property = "UO_FW_combatMode";
			control = "UO_FW_combatModeControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'red'";
		};
		class UO_FW_speed {
			displayName = "Speed";
			tooltip = "Speed of the group or unit on activation. Default: Limited";
			property = "UO_FW_speed";
			control = "UO_FW_speedControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'limited'";
		};
		class UO_FW_formation {
			displayName = "Formation";
			tooltip = "Formation of the group or unit on activation. Default: WEDGE";
			property = "UO_FW_formation";
			control = "UO_FW_formationControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'wedge'";
		};
		class UO_FW_groupStance {
			displayName = "Group Stance";
			tooltip = "Force the stance of the group. Default: AUTO";
			property = "UO_FW_groupStance";
			control = "UO_FW_stanceControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'auto'";
		};
		class UO_FW_forceLights {
			displayName = "Force Flashlights";
			tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
			property = "UO_FW_forceLights";
			control = "UO_FW_forcelightsControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class UO_FW_surrender {
			displayName = "Will Surrender";
			tooltip = "This group will surrender if there team leader dies or they take greater than 50% casualties. Default: False";
			property = "UO_FW_surrender";
			control = "UO_FW_boolControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		/*class UO_FW_Tracker {
			displayName = "Can Track Players";
			tooltip = "This group can track the nearby players (within 600), if no player to track or player moves out of range the group will continue assigned task. Default: False";
			property = "UO_FW_tracker";
			control = "UO_FW_boolControl2";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};*/
		class UO_FW_groupInit {
			displayName = "Group Init";
			tooltip = "Pass custom parameters or code to the group of units. ( _this = GROUP ) Default: Nil";
			property = "UO_FW_groupInit";
			control = "UO_FW_codeControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'true'";
		};
	};
};
class UO_FW_GroupTask {
	displayName = "AI Group Task Options";
	collapsed = 0;
	class Attributes {
		class UO_FW_createRadius {
			displayName = "Creation Radius";
			tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
			property = "UO_FW_createRadius";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_patrolRadius {
			displayName = "Task Radius";
			tooltip = "Radius that Group will conduct the assigned task in. Default: 100m";
			property = "UO_FW_patrolRadius";
			control = "UO_FW_patrolradiusControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_waypointWait {
			displayName = "Waypoint Wait Time";
			tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
			property = "UO_FW_waypointWait";
			control = "UO_FW_waypointwaitControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "3";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_startBuilding {
			displayName = "Start in Building";
			tooltip = "Group will start inside nearest building then move out to conduct set task. Building Occupy tasks overide this setting. Default: Off";
			property = "UO_FW_startBuilding";
			control = "UO_FW_startbuildingControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class UO_FW_task {
			displayName = "Task";
			tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
			property = "UO_FW_task";
			control = "UO_FW_taskControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "4";
		};
		class UO_FW_TaskTimer {
			displayName = "Time";
			tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
			property = "UO_FW_TaskTimer";
			control = "UO_FW_standardNumberAltControl";
			expression = "_this setVariable ['%s',_value,true];";
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
		class UO_FW_multiplier {
			displayName = "Group Multiplier";
			tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
			property = "UO_FW_multiplier";
			control = "UO_FW_multiplierControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "1";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_multiOccupy {
			displayName = "Multiplied Groups Occupy Options";
			tooltip = "How many generated groups from the group muliplier will use the occupy options below. Default: NO CHANGE";
			property = "UO_FW_multiOccupy";
			control = "UO_FW_multioccupyControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
		};
		class UO_FW_occupyOption {
			displayName = "Occupy Building Options";
			tooltip = "Should the group occupy a building or buildings. Default: OFF";
			property = "UO_FW_occupyOption";
			control = "UO_FW_occupyoptionControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
		};
	};
};

//class UO_FW_ParaOptions {
//	displayName = "AI Para Options";
//	collapsed = 1;
//	class Attributes {
//		class UO_FW_paraEnable {
//			displayName = "Enable Para Drop";
//			tooltip = "Set to ON to enable para drop insertion of this group when they spawn.";
//			property = "UO_FW_paraEnable";
//			control = "UO_FW_paraenableControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "false";
//			typeName = "BOOL";
//		};
//		class UO_FW_paraHeight {
//			displayName = "Height";
//			tooltip = "Height that the parachuter's will start falling from. Default: 3000m.";
//			property = "UO_FW_paraHeight";
//			control = "UO_FW_paraheightControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "3000";
//			typeName = "NUMBER";
//			validate = "number";
//		};
//		class UO_FW_paraDirection {
//			displayName = "Direction";
//			tooltip = "The direction the entities will face to form the drop column when parachuting. Default: Random 360 (-1)";
//			property = "UO_FW_paraDirection";
//			control = "UO_FW_paradirectionControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "-1";
//			typeName = "NUMBER";
//			validate = "number";
//		};
//		class UO_FW_paraColMaxLength {
//			displayName = "Column Max Length";
//			tooltip = "The maximum length a column will be before another one is started. Default: 100m";
//			property = "UO_FW_paraColMaxLength";
//			control = "UO_FW_paralengthControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "100";
//			typeName = "NUMBER";
//			validate = "number";
//		};
//		class UO_FW_paraSpacing {
//			displayName = "Spacing";
//			tooltip = "The spacing between each entity in the column. Default: 25m";
//			property = "UO_FW_paraSpacing";
//			control = "UO_FW_paraspacingControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "25";
//			typeName = "NUMBER";
//			validate = "number";
//		};
//		class UO_FW_paraSpread {
//			displayName = "Spread";
//			tooltip = "Spread of each column side by side. Default: 25m";
//			property = "UO_FW_paraSpread";
//			control = "UO_FW_paraspreadControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "25";
//			typeName = "NUMBER";
//			validate = "number";
//		};
//		class UO_FW_paraSmoke {
//			displayName = "Vehicle Smoke";
//			tooltip = "Vehicle deploys smoke to indicate its position on the ground. Default: Off";
//			property = "UO_FW_paraSmoke";
//			control = "UO_FW_parasmokeControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "false";
//			typeName = "BOOL";
//		};
//		class UO_FW_paraRealism {
//			displayName = "Realism";
//			tooltip = "Turn realism off to enable parachuting of all vehicles otherwise limited by realistic weight limits. Default: On (Weight Limit: 25000)";
//			property = "UO_FW_paraRealism";
//			control = "UO_FW_pararealsmControl";
//			expression = "_this setVariable ['%s',_value,true];";
//			defaultValue = "true";
//			typeName = "BOOL";
//		};
//	};
//};
class Init : Init {collapsed = 1;};
class State : State {collapsed = 1;};
