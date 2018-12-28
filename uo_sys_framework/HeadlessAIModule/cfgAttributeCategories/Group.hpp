class UO_FW_AI_GroupBehaviour {
	displayName = "AI Group Behavour Options";
	collapsed = 0;
	class Attributes {
		class UO_FW_AI_behaviour {
			displayName = "Behaviour";
			tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
			property = "UO_FW_AI_behaviour";
			control = "UO_FW_AI_behaviourControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'safe'";
		};
		class UO_FW_AI_combatMode {
			displayName = "CombatMode";
			tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
			property = "UO_FW_AI_combatMode";
			control = "UO_FW_AI_combatModeControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'red'";
		};
		class UO_FW_AI_speed {
			displayName = "Speed";
			tooltip = "Speed of the group or unit on activation. Default: Limited";
			property = "UO_FW_AI_speed";
			control = "UO_FW_AI_speedControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'limited'";
		};
		class UO_FW_AI_formation {
			displayName = "Formation";
			tooltip = "Formation of the group or unit on activation. Default: WEDGE";
			property = "UO_FW_AI_formation";
			control = "UO_FW_AI_formationControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'wedge'";
		};
		class UO_FW_AI_groupStance {
			displayName = "Group Stance";
			tooltip = "Force the stance of the group. Default: AUTO";
			property = "UO_FW_AI_groupStance";
			control = "UO_FW_AI_stanceControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'auto'";
		};
		class UO_FW_AI_forceLights {
			displayName = "Force Flashlights";
			tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
			property = "UO_FW_AI_forceLights";
			control = "UO_FW_AI_forcelightsControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class UO_FW_AI_surrender {
			displayName = "Will Surrender";
			tooltip = "This group will surrender if there team leader dies or they take greater than 50% casualties. Default: False";
			property = "UO_FW_AI_surrender";
			control = "UO_FW_AI_boolControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class UO_FW_AI_groupInit {
			displayName = "Group Init";
			tooltip = "Pass custom parameters or code to the group of units. ( _this = GROUP ) Default: Nil";
			property = "UO_FW_AI_groupInit";
			control = "UO_FW_AI_codeControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'true'";
		};
	};
};
class UO_FW_AI_GroupTask {
	displayName = "AI Group Task Options";
	collapsed = 0;
	class Attributes {
		class UO_FW_AI_createRadius {
			displayName = "Creation Radius";
			tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
			property = "UO_FW_AI_createRadius";
			control = "UO_FW_AI_standardNumberControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_AI_patrolRadius {
			displayName = "Task Radius";
			tooltip = "Radius that Group will conduct the assigned task in. Default: 100m";
			property = "UO_FW_AI_patrolRadius";
			control = "UO_FW_AI_patrolradiusControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_AI_waypointWait {
			displayName = "Waypoint Wait Time";
			tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
			property = "UO_FW_AI_waypointWait";
			control = "UO_FW_AI_waypointwaitControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "3";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_AI_startBuilding {
			displayName = "Start in Building";
			tooltip = "Group will start inside nearest building then move out to conduct set task. Building Occupy tasks overide this setting. Default: Off";
			property = "UO_FW_AI_startBuilding";
			control = "UO_FW_AI_startbuildingControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class UO_FW_AI_task {
			displayName = "Task";
			tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
			property = "UO_FW_AI_task";
			control = "UO_FW_AI_taskControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "4";
		};
		class UO_FW_AI_TaskTimer {
			displayName = "Time";
			tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
			property = "UO_FW_AI_TaskTimer";
			control = "UO_FW_AI_standardNumberAltControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
	};
};
class UO_FW_AI_GroupPopulate {
	displayName = "AI Populate Options";
	collapsed = 0;
	class Attributes {
		class UO_FW_AI_multiplier {
			displayName = "Group Multiplier";
			tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
			property = "UO_FW_AI_multiplier";
			control = "UO_FW_AI_multiplierControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "1";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_AI_multiOccupy {
			displayName = "Multiplied Groups Occupy Options";
			tooltip = "How many generated groups from the group muliplier will use the occupy options below. Default: NO CHANGE";
			property = "UO_FW_AI_multiOccupy";
			control = "UO_FW_AI_multioccupyControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
		};
		class UO_FW_AI_occupyOption {
			displayName = "Occupy Building Options";
			tooltip = "Should the group occupy a building or buildings. Default: OFF";
			property = "UO_FW_AI_occupyOption";
			control = "UO_FW_AI_occupyoptionControl";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
		};
	};
};
//class Init : Init {collapsed = 1;};
//class State : State {collapsed = 1;};
