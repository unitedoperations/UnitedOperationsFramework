#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);


[QGVAR(SettingsLoaded), {
    if (!(GETMVAR(Enabled,false))) exitWith {};

    [QGVAR(Event_FireMessage), FUNC(radio_fireMessage)] call CBA_fnc_addEventHandler;
		[QGVAR(Event_AddMission), FUNC(menu_addMission)] call CBA_fnc_addEventHandler;
		[QGVAR(Event_AddMarkers), FUNC(grid_addMarkers)] call CBA_fnc_addEventHandler;

	[{!isNil QGVAR(Firemissions_Blufor)}, {
		switch (side player) do {
			case west: {
				{
					[QGVAR(Event_AddMarkers), _x] call CBA_fnc_localEvent;
				} forEach GVAR(Firemissions_Blufor);
			};
			case east: {
				{
					[QGVAR(Event_AddMarkers), _x] call CBA_fnc_localEvent;
				} forEach GVAR(Firemissions_Opfor);
			};
			case independent: {
				{
					[QGVAR(Event_AddMarkers), _x] call CBA_fnc_localEvent;
				} forEach GVAR(Firemissions_Indfor);
			};
			case civilian: {
				{
					[QGVAR(Event_AddMarkers), _x] call CBA_fnc_localEvent;
				} forEach GVAR(Firemissions_Civfor);
			};
			default {false};
		};
	}] call CBA_fnc_waitUntilAndExecute;
	

	[{(!isNil QGVAR(Batteries)) && time > 0}, 
	{
		

		_action = ["Artillery_Menu", "Firemission", "", {true}, {
			_radioList = [] call acre_api_fnc_getCurrentRadioList;
			_ret = false;
			{
				switch (side player) do {
					case west: {
						_ret = ([_x] call acre_api_fnc_getRadioChannel == GETMVAR(CallChannel_Blufor,99)  && !([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf));
					};
					case east: {
						_ret = ([_x] call acre_api_fnc_getRadioChannel == GETMVAR(CallChannel_Opfor,99)  && !([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf));
					};
					case independent: {
						_ret = ([_x] call acre_api_fnc_getRadioChannel == GETMVAR(CallChannel_Indfor,99)  && !([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf));
					};
					case civilian: {
						_ret = ([_x] call acre_api_fnc_getRadioChannel == GETMVAR(CallChannel_Civfor,99)  && !([_x, "ACRE_PRC343"] call acre_api_fnc_isKindOf));
					};
				};
			} forEach _radioList;
			_ret = _ret;
			_ret
		}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

		_action = ["PolarFiremission", "New", "", {
			[] call FUNC(dia_PolarFiremissionOpenDialog);
		}, {true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","Artillery_Menu"], _action] call ace_interact_menu_fnc_addActionToObject;



		_action = ["CompletedFiremission", "Completed", "", {true}, {
			switch (side player) do {
				case west: {count GVAR(Firemissions_Blufor) > 0};
				case east: {count GVAR(Firemissions_Opfor) > 0};
				case independent: {count GVAR(Firemissions_Indfor) > 0};
				case civilian: {count GVAR(Firemissions_Civfor) > 0};
				default {false};
			};
		}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","Artillery_Menu"], _action] call ace_interact_menu_fnc_addActionToObject;

	}, [player]] call CBA_fnc_waitUntilAndExecute;



	//Generates the cancellation and repeat options for fired missions /////
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
			(_x # 0) + "_" + str(_x # 2 # 13),
			"?",
			"",
			{true},
			{true},
			_insertChildren,
			_x,
			"",
			4,
			[false, false, false, true, false],
			_modifierFunc
		] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","Artillery_Menu","CompletedFiremission"], _action] call ace_interact_menu_fnc_addActionToObject;
	};

	switch (side player) do {
		case west: {{_x call _addFnc} forEach GVAR(Firemissions_Blufor)};
		case east: {{_x call _addFnc} forEach GVAR(Firemissions_Opfor)};
		case independent: {{_x call _addFnc} forEach GVAR(Firemissions_Indfor)};
		case civilian: {{_x call _addFnc} forEach GVAR(Firemissions_Civfor)};
	};


}] call CBA_fnc_addEventHandler;
