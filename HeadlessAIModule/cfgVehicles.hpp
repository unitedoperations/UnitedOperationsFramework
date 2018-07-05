class UO_FW_AI_Module : OlsenModule 
{	
	scope = 1;
	category = "UO_FrameworkCategory_AI";
	icon = "\a3\3DEN\Data\CfgWaypoints\scripted_ca.paa";
};

class UO_FW_AI_ZoneModule : UO_FW_AI_Module 
{		
	scope = 2; 							
	displayName = "Zone (Circle)"; 	
	//icon = "\UO_FW\Resources\Icons\zonemodule_ca.paa"; 
	function = "UO_AI_fnc_zone";
	functionPriority = 0;		
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	curatorInfoType = "RscDisplayAttributeModuleNuke";
	canSetArea = 1;

	class AttributeValues {
        size2[] = {100,100};
		IsRectangle = 0;
    };
    class Attributes {
		class aeZoneInitial {
			displayName = "Initial Spawn";
			tooltip = "Enabling activates the zone on init, spawning units on the start of the mission. Default: disabled.";
			property = "UO_FW_zoneInitial";
			control = "CheckboxStateReversed";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "false";
		};
		class aeZoneRadiusX {
			displayName = "Activation Radius X";
			tooltip = "The size of the X value of the area the player will initiate this zone at in metres. Default: 100";
			property = "UO_FW_zoneRadiusX";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeZoneRadiusY {
			displayName = "Activation Radius Y";
			tooltip = "The size of the Y value of the area the player will initiate this zone at in metres. Default: 100";
			property = "UO_FW_zoneRadiusY";
			control = "UO_FW_moduleradiusControl2";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeZoneDelay {
			displayName = "Delay";
			tooltip = "Delay after zone is activated that actual spawning occurs. Default: 0secs";
			property = "UO_FW_zoneDelay";
			control = "UO_FW_zonedelayControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeZoneOn {
			displayName = "Suspension";
			tooltip = "Suspending the zone to be enabled later, suspended zones will not detect player is with in radius or that a custom condition is met until zone is enabled. Default: Enabled";
			property = "UO_FW_zoneOn";
			control = "UO_FW_zoneonControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeZoneSide {
			displayName = "Activating Unit Side";
			tooltip = "Side of the unit that activates the zone. Default: ANY";
			property = "UO_FW_zoneSide";
			control = "UO_FW_zonesideControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "4";
		};
		class aeZoneType {
			displayName = "Activating Unit Type";
			tooltip = "Type of unit the player is that activates the zone. Default: All Units";
			property = "UO_FW_zoneType";
			control = "UO_FW_zonetypeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeZoneCondition {
			displayName = "Custom Condition";
			tooltip = "Enter a custom condition that must be met for this zone to be activated, condition true will spawn the zone. Default: Nil";
			property = "UO_FW_zoneCondition";
			control = "UO_FW_moduleconditionControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'false'";
		};
		class aeZoneCode {
			displayName = "Custom Code";
			tooltip = "Pass custom code to be executed when zone is activated. Default: Nil";
			property = "UO_FW_zoneCode";
			control = "UO_FW_codeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'true'";
		};
		class aeHeadless {
			displayName = "Headless";
			tooltip = "Will the zone spawn on the headless client or the server? Default: Headless";
			property = "UO_FW_headless";
			control = "UO_FW_headlessControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "true";
			typeName = "BOOL";
		};
	};
};
class UO_FW_AI_ZoneModule_R : UO_FW_AI_ZoneModule {									
	displayName = "Zone (Square)"; 	
	class AttributeValues {
        size2[] = {100,100};
		IsRectangle = 1;
    };
};

class UO_FW_AI_ControlModule : UO_FW_AI_Module {	
	scope = 2; 									
	displayName = "Control (Circle)";		
	//icon = "\UO_FW\Resources\Icons\controlmodule_ca.paa"; 
	function = "UO_AI_fnc_control"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	curatorInfoType = "RscDisplayAttributeModuleNuke";
	canSetArea = 1;
	class AttributeValues {
		size2[] = {100,100};
		IsRectangle = 0;
	};
	class Attributes {
		class aeControlRadiusX {
			displayName = "Activation Radius X";
			tooltip = "The size of the X value of the area the player will initiate the control zone at in metres. Default: 100";
			property = "UO_FW_ControlRadiusX";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeControlRadiusY {
			displayName = "Activation Radius Y";
			tooltip = "The size of the Y value of the area the player will initiate the control zone at in metres. Default: 100";
			property = "UO_FW_ControlRadiusY";
			control = "UO_FW_moduleradiusControl2";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeControlOn {
			displayName = "Suspension";
			tooltip = "Suspending the control module to be enabled later, suspended control modules will not detect player is with in radius or that a custom condition is met until enabled. Default: Enabled";
			property = "UO_FW_controlOn";
			control = "UO_FW_zoneonControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeControlInitAction {
			displayName = "Initiate Action";
			tooltip = "The action the control module performs to linked zones when initiated, toggle Enable,Disable or Do Nothing. Default: Do Nothing";
			property = "UO_FW_ControlInitAction";
			control = "UO_FW_initActionControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeControlAction {
			displayName = "Activate Action";
			tooltip = "The action the control module performs to linked zones when activated, toggle Enable or Disable. Default: Enable";
			property = "UO_FW_ControlAction";
			control = "UO_FW_actionControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeControlDelay {
			displayName = "Delay";
			tooltip = "Delay after control module is activated that actual toggle of linked zones occurs. Default: 0secs";
			property = "UO_FW_ControlDelay";
			control = "UO_FW_zonedelayControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeControlSide {
			displayName = "Activating Player Side";
			tooltip = "Side of the player that activates the control module. Default: WEST";
			property = "UO_FW_ControlSide";
			control = "UO_FW_zonesideControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeControlType {
			displayName = "Activating Player Type";
			tooltip = "Type of unit the player is that activates the control module. Default: All Units";
			property = "UO_FW_ControlType";
			control = "UO_FW_zonetypeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeControlCondition {
			displayName = "Custom Condition";
			tooltip = "Enter a custom condition that must be met for this control module to be activated, condition true will initiate the control module. Default: Nil";
			property = "UO_FW_ControlCondition";
			control = "UO_FW_moduleconditionControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'false'";
			validate = "condition";
		};	
		class aeControlCode {
			displayName = "Custom Code";
			tooltip = "Pass custom code to be executed when the control module is activated. Default: Nil";
			property = "UO_FW_ControlCode";
			control = "UO_FW_codeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'true'";
		};
	};
};
class UO_FW_AI_ControlModule_R : UO_FW_AI_ControlModule {									
	displayName = "Control (Square)"; 	
	class AttributeValues {
		size2[] = {100,100};
		IsRectangle = 1;
	};
};

class UO_FW_AI_TaskModule : UO_FW_AI_Module {	
	scope = 2; 							
	displayName = "Task"; 			
	//icon = "\UO_FW\Resources\Icons\taskmodule_ca.paa"; 
	function = "UO_AI_fnc_task"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	curatorInfoType = "RscDisplayAttributeModuleNuke";
	canSetArea = 1;
	class AttributeValues {
        size2[] = {50,50};
    };
    class Attributes {			
		class aeTaskRadius {
			displayName = "Radius";
			tooltip = "The range the group will attempt to conduct the set task in. Default: 100";
			property = "UO_FW_taskRadius";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeTaskTime {
			displayName = "Time";
			tooltip = "How long the linked units will perform this task. Default: 0 (forever).";
			property = "UO_FW_TaskTime";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeTaskId {
			displayName = "Task ID";
			tooltip = "The order that the linked units will perform this task in when multiple tasks used. To use a priority order leave off. Default: OFF.";
			property = "UO_FW_TaskId";
			control = "UO_FW_numberSelect1Control";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeTaskSet {
			displayName = "Task";
			tooltip = "Task the unit or group will conduct on activation. Default: Hold Until";
			property = "UO_FW_taskSet";
			control = "UO_FW_taskControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "4";
		};
		class aeTaskOccupy {
			displayName = "Occupy Building Options";
			tooltip = "Should the group occupy a building or buildings. Default: OFF";
			property = "UO_FW_occupyOptionSet";
			control = "UO_FW_occupyoptionControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};
		class aeTaskWaypointWait {
			displayName = "Waypoint Wait Time";
			tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
			property = "UO_FW_changeWaypointWait";
			control = "UO_FW_waypointwaitControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "3";
			typeName = "NUMBER";
			validate = "number";
		};			
		class aeTaskBehaviour {
			displayName = "Change Behaviour";
			tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
			property = "UO_FW_behaviourChange";
			control = "UO_FW_behaviourchangeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'unchanged'";
		};
		class aeTaskCombatMode {
			displayName = "Change CombatMode";
			tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
			property = "UO_FW_combatMode";
			control = "UO_FW_combatmodechangeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'unchanged'";
		};
		class aeTaskSpeed {
			displayName = "Change Speed";
			tooltip = "Speed of the group or unit on activation. Default: Limited";
			property = "UO_FW_speed";
			control = "UO_FW_speedchangeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'unchanged'";
		};
		class aeTaskFormation {
			displayName = "Change Formation";
			tooltip = "Formation of the group or unit on activation. Default: WEDGE";
			property = "UO_FW_formation";
			control = "UO_FW_formationchangeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'unchanged'";
		};
		class aeTaskGroupStance {
			displayName = "Change Group Stance";
			tooltip = "Force the stance of the group. Default: AUTO";
			property = "UO_FW_groupStance";
			control = "UO_FW_stancechangeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'unchanged'";
		};			
		class aeTaskCondition {
			displayName = "Condition";
			tooltip = "Activate this task with a condition. Default: True";
			property = "UO_FW_taskCondition";
			control = "UO_FW_moduleconditionControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "";
			validate = "condition";
		};
		class aeTaskOnComplete {
			displayName = "On Completion";
			tooltip = "Pass custom parameters or code when the group completes this task. (_this = [GROUP,TASK Module]) Default: Nil";
			property = "UO_FW_taskOnComplete";
			control = "UO_FW_codeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "(true)";
		};				
		class aeTaskPriority {
			displayName = "Priority";
			tooltip = "Task priority allows the group to choose between two assigned tasks. Default: Medium";
			property = "UO_FW_TaskPriority";
			control = "UO_FW_taskpriorityControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "1";
			typeName = "NUMBER";
			validate = "number";
		};			
	};
};
class UO_FW_AI_PositionModule : UO_FW_AI_Module {		
	scope = 2; 							
	displayName = "Position (Circle)"; 	
	//icon = "\UO_FW\Resources\Icons\posmodule_ca.paa"; 
	function = "UO_AI_fnc_position"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	curatorInfoType = "RscDisplayAttributeModuleNuke";
	canSetArea = 1;
	class AttributeValues {
        size2[] = {0,0};
		IsRectangle = 0;
    };
    class Attributes {
		class aePositionType {
			displayName = "Type of Position";
			tooltip = "Sets the type of position other modules will identify this position as. Default: Standard";
			property = "UO_FW_positionType";
			control = "UO_FW_positiontypeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
		};	
		class aePositionRadiusX {
			displayName = "Radius X";
			tooltip = "The X radius the position will use to generate a random position. Default: 0";
			property = "UO_FW_positionRadiusX";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aePositionRadiusY {
			displayName = "Radius Y";
			tooltip = "The Y radius the position will use to generate a random position. Default: 0";
			property = "UO_FW_positionRadiusY";
			control = "UO_FW_moduleradiusControl2";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aePositionWarnRadius {
			displayName = "Warn Area Radius";
			tooltip = "Distance for player to be warned before entering area. Default: 20.";
			property = "UO_FW_positionWarnRadius";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "20";
			typeName = "NUMBER";
			validate = "number";
		};
	};
};
class UO_FW_AI_PositionModule_R : UO_FW_AI_PositionModule {									
	displayName = "Position (Square)"; 	
	class AttributeValues {
        size2[] = {0,0};
		IsRectangle = 1;
    };
};
class UO_FW_AI_FastAirStrikeModule : UO_FW_AI_Module {		
	scope = 2; 							
	displayName = "Fast Air Strike"; 	
	//icon = "\UO_FW\Resources\Icons\fastairmodule_ca.paa"; 
	function = "UO_AI_fnc_fas"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	curatorInfoType = "RscDisplayAttributeModuleNuke";
	canSetArea = 1;
	class AttributeValues {
        size2[] = {100,100};
		IsRectangle = 0;
    };
    class Attributes {
		class aeFASRadius {
			displayName = "Strike Radius";
			tooltip = "The air strike will use this radius to generate a random position for each bomber. Default: 0";
			property = "UO_FW_fasRadius";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeFASOrdnance {
			displayName = "Ordnance";
			tooltip = "The amount of bombs each aircraft will drop. Default: 3";
			property = "UO_FW_fasOrdinance";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "3";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeFASHeight {
			displayName = "Height";
			tooltip = "Height aircraft will fly at and release ordnance, higher the altitude the less accuracy. Default: 200.";
			property = "UO_FW_fasHeight";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "200";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeFASOrdnanceType {
			displayName = "Ordnance Type";
			tooltip = "Classname of the bomb type to be use. Default: 'Bo_GBU12_LGB_MI10'";
			property = "UO_FW_fasOrdnanceType";
			control = "UO_FW_standardStringOneControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'Bo_GBU12_LGB_MI10'";
		};
	};
};
class UO_FW_AI_ArtilleryStrikeModule : UO_FW_AI_Module {		
	scope = 2; 							
	displayName = "Artillery Strike"; 	
	//icon = "\UO_FW\Resources\Icons\artillerymodule_ca.paa"; 
	function = "UO_AI_fnc_art"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	curatorInfoType = "RscDisplayAttributeModuleNuke";
	canSetArea = 1;
	class AttributeValues {
        size2[] = {300,300};
		IsRectangle = 0;
    };
    class Attributes {
		class aeARTHold {
			displayName = "Fire Control";
			tooltip = "The artillery will spawn and either commence firing or hold fire. Default: Fire";
			property = "UO_FW_artHold";
			control = "UO_FW_artyfireControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class aeARTRadius {
			displayName = "Strike Radius";
			tooltip = "The artillery will use this radius to generate random position for each barrage. Default: 0";
			property = "UO_FW_artRadius";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "300";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeARTVolleys {
			displayName = "Volleys";
			tooltip = "The amount of fire missions each artillery gun will fire. How many barrages it will fire. (If zero will fire until it is killed) Default: 10 (-1 Random Amount 1-20)";
			property = "UO_FW_artVolleys";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "10";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeARTBarrages {
			displayName = "Barrages";
			tooltip = "The amount of barrages that will be fired with each volley. How many shots fired each time gun fires. Default: 1 (-1 Random Amount 1-10)";
			property = "UO_FW_artBarrages";
			control = "UO_FW_zonedelayControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "1";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeARTReload {
			displayName = "Reload Time";
			tooltip = "Time taken for the gun to reload for the next barrage. Default: 30 (-1 Random Time 30-120)";
			property = "UO_FW_artReload";
			control = "UO_FW_moduleradiusControl2";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "30";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeARTOffset {
			displayName = "Offset Time";
			tooltip = "Seperation time between each gun firing. Default: 3 (-1 Random Time 3-20)";
			property = "UO_FW_artOffset";
			control = "UO_FW_multiplierControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "3";
			typeName = "NUMBER";
			validate = "number";
		};
	};
};
class UO_FW_AI_AirDropModule : UO_FW_AI_Module {		
	scope = 2; 							
	displayName = "Air Drop"; 	
	//icon = "\UO_FW\Resources\Icons\supplydropmodule_ca.paa"; 
	function = "UO_AI_fnc_airdrop"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	canSetArea = 1;
	class AttributeValues {
        size2[] = {100,100};
		IsRectangle = 0;
    };
    class Attributes {
		class aeADRadius {
			displayName = "Drop Radius";
			tooltip = "The aircraft will use this radius to generate random position for air drop. Default: 0";
			property = "UO_FW_artRadius";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeADOrdnance {
			displayName = "Ordnance";
			tooltip = "The amount of items aircraft will drop. Default: 3";
			property = "UO_FW_adOrdinance";
			control = "UO_FW_zonedelayControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "3";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeADOrdnanceType {
			displayName = "Ordnance Type";
			tooltip = "Classname of the item type to be dropped. Default: 'ASOR_Ammo_Inf_Air'";
			property = "UO_FW_adOrdnanceType";
			control = "UO_FW_standardStringOneControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'ASOR_Ammo_Inf_Air'";
		};
		class aeADHeight {
			displayName = "Height";
			tooltip = "Height aircraft will fly at and release ordnance, higher the altitude the less accuracy. Default: 120.";
			property = "UO_FW_adHeight";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "120";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeADSmoke {
			displayName = "Drop Smoke";
			tooltip = "Item deploys smoke to indicate its position on the ground. Default: Off";
			property = "UO_FW_adSmoke";
			control = "UO_FW_parasmokeControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "false";
			typeName = "BOOL";
		};
		class aeADAircraftType {
			displayName = "Drop Aircraft Type";
			tooltip = "Classname of the aircraft to drop ordnance. Default: 'RHS_C130J'";
			property = "UO_FW_adAircraftType";
			control = "UO_FW_standardStringTwoControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'RHS_C130J'";
		};
		class aeADEscorted {
			displayName = "Fighter Escort";
			tooltip = "Does the drop vehicle have a fighter escort. Default: Off";
			property = "UO_FW_adEscorted";
			control = "UO_FW_pararealsmControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "false";
			typeName = "BOOL";
		};			
		class aeADEscortAircraftType {
			displayName = "Escort Aircraft Type";
			tooltip = "Classname of the aircraft type to be use. Default: 'B_Plane_CAS_01_F'";
			property = "UO_FW_adEscortAircraftType";
			control = "UO_FW_unitnameControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "'B_Plane_CAS_01_F'";
		};			
	};
};
class UO_FW_AI_HeloInsertModule : UO_FW_AI_Module {		
	scope = 2; 							
	displayName = "Helicopter Insertion"; 	
	//icon = "\UO_FW\Resources\Icons\heloinsertmodule_ca.paa"; 
	function = "UO_AI_fnc_heli"; 	
	functionPriority = 0; 				
	isGlobal = 0; 						
	isTriggerActivated = 0; 			
	isDisposable = 0; 	
	is3DEN = 1;
	canSetArea = 1;
	class AttributeValues {
        size2[] = {0,0};
		IsRectangle = 0;
    };
    class Attributes {
		class aeHIRadius {
			displayName = "Insert Radius";
			tooltip = "The aircraft will use this radius to generate random position for inserting units. Default: 0";
			property = "UO_FW_hiRadius";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeHIMultiplier {
			displayName = "Vehicle Multiplier";
			tooltip = "Multiplies the amount of helicopters and cargo linked to module to perform insetion. Default: 1";
			property = "UO_FW_hiMultiplier";
			control = "UO_FW_zonedelayControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "1";
			typeName = "NUMBER";
			validate = "number";
		};		
		class aeHIHeight {
			displayName = "Height";
			tooltip = "Height aircraft will fly in at before starting decent. Default: 200.";
			property = "UO_FW_hiHeight";
			control = "UO_FW_standardNumberControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "200";
			typeName = "NUMBER";
			validate = "number";
		};
		class aeHIInsertType {
			displayName = "Insertion Type";
			tooltip = "The type of insertion that will be performed at the insertion point. Default: Rappel";
			property = "UO_FW_hiInsertType";
			control = "UO_FW_heliControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
	};
};

class UO_FW_AI_RespawnModule : UO_FW_AI_Module {	
	scope = 2; 							
	displayName = "Respawn"; 			
	//icon = "\UO_FW\Resources\Icons\respawnmodule_ca.paa"; 
	function = "UO_AI_fnc_respawn"; 	
	functionPriority = 1; 				
	isGlobal = 2; 						
	isTriggerActivated = 0; 			
	isDisposable = 0;
	is3DEN = 1;		
	class Attributes {
		class aeRespawnSide {
			displayName = "Respawn Side";
			tooltip = "Side of the unit that will respawn at the new location. Default: WEST";
			property = "UO_FW_respawnSide";
			control = "UO_FW_zonesideControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
	};
};
class UO_FW_AI_TemplateModule : UO_FW_AI_Module {	
	scope = 2; 							
	displayName = "Group Template"; 			
	//icon = "\UO_FW\Resources\Icons\templatemodule_ca.paa"; 
	function = "UO_AI_fnc_temp"; 	
	functionPriority = 1; 				
	isGlobal = 2; 						
	isTriggerActivated = 0; 			
	isDisposable = 0;
	is3DEN = 1;		
};