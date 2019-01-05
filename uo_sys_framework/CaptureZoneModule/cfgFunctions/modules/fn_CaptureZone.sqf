#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params [["_mode","",[""]],["_input",[],[[]]]];
switch _mode do
{
	// Default object init
	case "init": {
		if (!is3DEN) then {
			_input params ["_logic",["_isActivated",true,[true]],["_isCuratorPlaced",false,[false]]];
			if !(_isActivated) exitWith {};

			_zoneName = _logic getVariable ["UO_FW_CaptureZone_ZoneName",""];
			_loc = getPosATL _logic;
			_radiusX = _logic getVariable ["UO_FW_CaptureZone_RadiusX",100];
			_radiusY = _logic getVariable ["UO_FW_CaptureZone_RadiusY",100];
			_direction = getdir _logic;
			_isRectangle = if((typeof _logic) isEqualTo "UO_FW_CaptureZoneModule_R") then {true} else {false};
			_area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
			_interval = _logic getVariable ["UO_FW_CaptureZone_SleepInterval",15];
			_repeatable = _logic getVariable ["UO_FW_CaptureZone_Repeatable",true];
			_ratioNeeded = _logic getVariable ["UO_FW_CaptureZone_RatioNeeded",0.75];
			_capArray = [];
			_capArray pushBack (_logic getVariable ["UO_FW_CaptureZone_BluforCap",0]);
			_capArray pushBack (_logic getVariable ["UO_FW_CaptureZone_OpforCap",0]);
			_capArray pushBack (_logic getVariable ["UO_FW_CaptureZone_IndependentCap",0]);
			_capArray pushBack (_logic getVariable ["UO_FW_CaptureZone_CivilianCap",0]);
			_timeArray = [];
			_timeArray pushBack (_logic getVariable ["UO_FW_CaptureZone_BluforTime",30]);
			_timeArray pushBack (_logic getVariable ["UO_FW_CaptureZone_OpforTime",30]);
			_timeArray pushBack (_logic getVariable ["UO_FW_CaptureZone_IndependentTime",30]);
			_timeArray pushBack (_logic getVariable ["UO_FW_CaptureZone_OpforTime",30]);
			_messagesArray = [];
			_messagesArray pushBack (_logic getVariable ["UO_FW_CaptureZone_BluforMessage",["BLUFOR is capturing the zone!","BLUFOR has captured the zone!"]]);
			_messagesArray pushBack (_logic getVariable ["UO_FW_CaptureZone_OpforMessage",["OPFOR is capturing the zone!","OPFOR has captured the zone!"]]);
			_messagesArray pushBack (_logic getVariable ["UO_FW_CaptureZone_IndependentMessage",["Independent is capturing the zone!","Independent has captured the zone!"]]);
			_messagesArray pushBack (_logic getVariable ["UO_FW_CaptureZone_CivilianMessage",["Civilian is capturing the zone!","Civilian has captured the zone!"]]);
			_messagesArray pushBack (_logic getVariable ["UO_FW_CaptureZone_ContestedMessage","The zone is contested!"]);
			_messagesArray pushBack (_logic getVariable ["UO_FW_CaptureZone_UncontestedMessage","The zone is uncontested!"]);
			_colours = _logic getVariable ["UO_FW_CaptureZone_Colours",["ColorBlue","ColorRed","ColorGreen","ColorYellow","ColorWhite","ColorKhaki"]];
			_hidden = _logic getVariable ["UO_FW_CaptureZone_Hidden",false];
			_silent = _logic getVariable ["UO_FW_CaptureZone_Silent",false];
			_automessages = _logic getVariable ["UO_FW_CaptureZone_AutoMessages",false];
			_cond = _logic getVariable ["UO_FW_CaptureZone_Condition","true"];
			[_logic,_zoneName,_area,_interval,_repeatable,_capArray,_timeArray,_messagesArray,_colours,_hidden,_silent,_automessages,_ratioNeeded,_cond] call UO_FW_FNC_CaptureZoneLoop;
		};

	};
	// When some attributes were changed (including position and rotation)
	case "attributesChanged3DEN": {
		private _logic = _input param [0,objNull,[objNull]];
		private _radiusX = _logic getVariable ["UO_FW_CaptureZone_RadiusX",_logic getVariable ["UO_FW_CaptureZone_RadiusX", 100]];
		private _radiusY = _logic getVariable ["UO_FW_CaptureZone_RadiusY",_logic getVariable ["UO_FW_CaptureZone_RadiusY", 100]];
		set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
	};
	default {};
};
true
