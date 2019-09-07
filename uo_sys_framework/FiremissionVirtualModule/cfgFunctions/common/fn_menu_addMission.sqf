#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
	_insertChildren = {
		params ["_target", "_player", "_params"];
		//hint format ["_insertChildren [%1]", _params];

		// Add children to this action
		private _actions = [];

		private _childStatement = {
			params ["_target", "_player", "_array"];

			_array params ["_id","_cancel","_subArray"];
			_subArray params ["_obs","_name","_selectedAmmo","_selectedGrid","_selectedMils","_selectedDist","_selectedRnds","_selectedGuns"];

			_subArray set [0,_player];

			_array = [_id,_cancel,_subArray];

			[QGVAR(Event_PolarFiremissionRepeat), _array] call CBA_fnc_serverEvent;
		};
		private _action = ["RepeatMission", "Repeat Mission", "", _childStatement, {true}, {}, _this # 2] call ace_interact_menu_fnc_createAction;
		_actions pushBack [_action, [], _target]; // NEW ACTION, CHILDREN, TARGET

		private _childStatement = {
			params ["_target", "_player", "_array"];

			[_array # 0,true,side _player] call FUNC(array_setMissionCancel);
		};
		private _action = ["CancelMission", "Cancel Mission", "", _childStatement, {true}, {}, _this # 2] call ace_interact_menu_fnc_createAction;
		_actions pushBack [_action, [], _target]; // NEW ACTION, CHILDREN, TARGET

		_actions
	};

	_addFnc = {
		_modifierFunc = {
			params ["_target", "_player", "_params", "_actionData"];
			//hint format ["_modifierFunc [%1]", _params];

			_actionData set [1, format ["%1", (_params # 0)]];	//#1 Display Name #2 Icon
		};

		_action = [
			(_this # 0) + "_" + str(_this # 2 # 13),
			"?",
			"",
			{true},
			{true},
			_insertChildren,
			_this,
			"",
			4,
			[false, false, false, true, false],
			_modifierFunc
		] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","Virtual_Artillery_Menu","CompletedFiremission"], _action] call ace_interact_menu_fnc_addActionToObject;
	};

	if (!isDedicated && hasInterface && side player == (_this # 2 # 14)) then {
		_this call _addFnc;
	};