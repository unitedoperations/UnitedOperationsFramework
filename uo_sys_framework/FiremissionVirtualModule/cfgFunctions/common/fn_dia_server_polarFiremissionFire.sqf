// Function by TinfoilHate
// Actual bits that do the virtual FM
#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
_this spawn {
	///// Handle all the input ////////////////////////////////////////////////////////////////////////////////////////
	params ["_obs","_name","_selectedAmmo","_selectedGrid","_selectedMils","_selectedDist","_selectedRnds","_selectedGuns"];

	///// Set the battery as not ready
	[_name,false] call FUNC(array_setBatteryReady);
	///// Assemble the tracking array for the firemission tracking ////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	_batteryInfo = [_name] call FUNC(array_getBattery);

	_guns = _batteryInfo # 3;
	_disp = _batteryInfo # 4;
	_reloadTime = _batteryInfo # 5;
	_calcTime = _batteryInfo # 6;
	_flightTime = _batteryInfo # 7;
	_delayTime = _batteryInfo # 8;
	_side = _batteryInfo # 9;

	_id = "";
	_newFireArray = [_obs,_name,_selectedAmmo,_selectedGrid,_selectedMils,_selectedDist,_selectedRnds,_selectedGuns,_guns,_disp,_reloadTime,_calcTime,_flightTime,_delayTime,_side];

	_fncTrackArray = {
		_count = _count + 1;

		if (_count > 9) then {
			_id = "AF00" + str(_count);
		} else {
			_id = "AF000" + str(_count);
		};
		_newFireArray = [_id,false,_newFireArray];
	};

	_count = -1;
	switch (side _obs) do {
		case west: {
			_count = count GVAR(Firemissions_Blufor);

			call _fncTrackArray;

			GVAR(Firemissions_Blufor) pushBack _newFireArray;
			SETMPVAR(Firemissions_Blufor,GVAR(Firemissions_Blufor));
		};
		case east: {
			_count = count GVAR(Firemissions_Opfor);

			call _fncTrackArray;

			GVAR(Firemissions_Opfor) pushBack _newFireArray;
			SETMPVAR(Firemissions_Opfor,GVAR(Firemissions_Opfor));
		};
		case independent: {
			_count = count GVAR(Firemissions_Indfor);

			call _fncTrackArray;

			GVAR(Firemissions_Indfor) pushBack _newFireArray;
			SETMPVAR(Firemissions_Indfor,GVAR(Firemissions_Indfor));
		};
		case civilian: {
			_count = count GVAR(Firemissions_Civfor);

			call _fncTrackArray;

			GVAR(Firemissions_Civfor) pushBack _newFireArray;
			SETMPVAR(Firemissions_Civfor,GVAR(Firemissions_Civfor));
		};
	};

	//Adds new firemission to the tracking array, and adds a marker to the map
	[QGVAR(Event_AddMission), _newFireArray] call CBA_fnc_globalEvent;
	[QGVAR(Event_AddMarkers), _newFireArray] call CBA_fnc_globalEvent;
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	///// Calculate the target location
	private _target = [_selectedGrid,_selectedMils,_selectedDist] call FUNC(grid_mapGridToPos);

	///// Pull observer name information //////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	_obsName = "";
	{
		_x params ["_var","_name","_side"];

		if (_obs == _var) then {
			_obsName = _name
		};
	} forEach GVAR(ArtyObservers);

	if (_obsName == "") then {
		_obsName = toUpper(groupId (group _obs));
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	///// Randomized calculation time if desired by input
	if (_calcTime isEqualType []) then {
		_calcTime = (_calcTime # 0 + (random ((_calcTime # 1) - (_calcTime # 0))));
	};

	///// Calculate firing time
	_fireTime = (_selectedRnds * _reloadTime);

	///// Calculate splash time
	_splash = 0;
	if (_fireTime > _flightTime) then {
		_splash = ((_fireTime - _flightTime) - 10);
	} else {
		if (_flightTime >= _fireTime) then {
			_splash = ((_flightTime - _fireTime) - 10);
		};
	};

	///// Add a delay so events don't overlap, this is lazy and I don't give a god damn
	if (_splash < 3) then {_splash = 3};

	///// Messages used for simulated communication ///////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	_msg1 	= _obsName + ": " + _name + " THIS IS " + _obsName + ", FIRE FOR EFFECT, POLAR, OVER.";
	_msg2	= _name + ": " + "THIS IS " + _name + ", FIRE FOR EFFECT, POLAR, OUT.";
	_msg3	= _obsName + ": " + "LOCATION " + _selectedGrid + ", DIRECTION " + str(_selectedMils) + ", DISTANCE " + str(_selectedDist) + ", OVER.";
	_msg4	= _name + ": " + "LOCATION " + _selectedGrid + ", DIRECTION " + str(_selectedMils) + ", DISTANCE " + str(_selectedDist) + ", OUT.";
	_msg5	= _name + ": " + _obsName + ", " + str(_selectedRnds) + " ROUNDS, TARGET " + _id + ", OVER.";
	_msg6	= _obsName + ": " + _name + ", " + str(_selectedRnds) + " ROUNDS, TARGET " + _id + ", OUT.";
	_msg7	= _name + ": " + _obsName + ", SHOT, OVER";
	_msg8	= _obsName + ": " + _name + ", SHOT, OUT";
	_msg9	= _name + ": " + _obsName + ", SPLASH, OVER";
	_msg10	= _obsName + ": " + _name + ", SPLASH, OUT";
	_msg11	= _name + ": " + _obsName + ", ROUNDS COMPLETE, OVER";
	_msg12	= _obsName + ": " + _name + ", ROUNDS COMPLETE, OUT";
	_msg13	= _obsName + ": " + _name + ", " + _id + " CHECK FIRING, OVER";
	_msg14	= _name + ": " + _obsName + ", " + _id + " CHECK FIRING, OUT";
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	///// Initial call for fire
	[QGVAR(Event_FireMessage),
		[
			[1,_msg1,_side],
			[1,_msg2,_side],
			[1,_msg3,_side],
			[1,_msg4,_side],
			[1,_msg5,_side],
			[1,_msg6,_side]
		]
	] call CBA_fnc_globalEvent;

	sleep _calcTime;

	///// Check for mission cancellation pre-firing ///////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	_cancelMission = [_id] call FUNC(array_getMissionCancel);

	///// Check firing message
	if (_cancelMission) exitWith {
		[QGVAR(Event_FireMessage),
			[
				[1,_msg13,_side],
				[1,_msg14,_side]
			]
		] call CBA_fnc_globalEvent;

		sleep 2;

		[_name,true] call FUNC(array_setBatteryReady);
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	///// Shot message
	[QGVAR(Event_FireMessage),
		[
			[1,_msg7,_side],
			[1,_msg8,_side]
		]
	] call CBA_fnc_globalEvent;

	///// Separates out the splash call from the actual firing ////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	[_fireTime,_splash,_side,_msg9,_msg10,_name] spawn {
		params ["_fireTime","_splash","_side","_msg9","_msg10","_name"];

		sleep _fireTime;

		[_name,true] call FUNC(array_setBatteryReady);

		sleep _splash;

		[QGVAR(Event_FireMessage),	//Splash
			[
				[1,_msg9,_side],
				[1,_msg10,_side]
			]
		] call CBA_fnc_globalEvent;

		sleep 8;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	///// Get the available ammo count for the desired shells
	_batteryAmmoCount = 0;
	{
		_x params ["_class","_qty"];

		if (_selectedAmmo == _class) then {
			_batteryAmmoCount = _qty;
		};
	} forEach ([_name] call FUNC(array_getBatteryAmmo));

	///// Actually "fire" the guns
	_gunsFired = 0;

	for "_i" from 1 to _selectedRnds do {
		///// Checking for cancellation mid-firing
		_cancelMission = [_id] call FUNC(array_getMissionCancel);

		if (_cancelMission) exitWith {
			[QGVAR(Event_FireMessage),	//Cancelled
				[
					[1,_msg13,_side],
					[1,_msg14,_side]
				]
			] call CBA_fnc_globalEvent;

			sleep 2;

			[_name,true] call FUNC(array_setBatteryReady);
		};

		for "_i" from 1 to _selectedGuns do {
			if (_selectedRnds > 0 && _batteryAmmoCount > 0) then {
				_gunsFired = _gunsFired + 1;
				_batteryAmmoCount = _batteryAmmoCount - 1;
			};
		};

		if (_selectedRnds > 0) then {sleep _reloadTime};
	};

	///// Adjust battery ammo remaining
	[_name,_selectedAmmo,_batteryAmmoCount] call FUNC(array_setBatteryAmmo);

	///// Rounds complete message
	[QGVAR(Event_FireMessage),
		[
			[1,_msg11,_side],
			[1,_msg12,_side]
		]
	] call CBA_fnc_globalEvent;

	sleep (_splash + 8);

	_ammoClass = getText (configFile >> "CfgMagazines" >> _selectedAmmo >> "ammo");
	_rounds = 0;
	while {_rounds < _selectedRnds && _gunsFired > 0} do {
		for "_i" from 1 to _selectedGuns do {
			_fireTarget = [_target, _disp] call CBA_fnc_randPos;

			_random = random 1;
			if (_random >= 0.25 && _random < 0.5) then {
				_fireTarget = [_target, (_disp * .65)] call CBA_fnc_randPos;
			};
			if (_random >= 0.5 && _random < 0.75) then {
				_fireTarget = [_target, (_disp * .5)] call CBA_fnc_randPos;
			};
			if (_random >= 0.75) then {
				_fireTarget = [_target, (_disp * .25)] call CBA_fnc_randPos;
			};

			_newDelayTime = 0;
			if (_delayTime isEqualType []) then {
				_newDelayTime = (_delayTime # 0 + (random ((_delayTime # 1) - (_delayTime # 0))));
			};
			sleep _newDelayTime;
			_mortarStrike = _ammoClass createVehicle [_fireTarget # 0,_fireTarget # 1,450];
			_mortarStrike setVelocity [0, 0, -225];

			/*
			_mortarLogic = "Land_HelipadEmpty_F" createVehicle _strikeLocation;
			_mortarLogic setPosATL _strikeLocation;

			_sound = selectRandom ["mortar1","mortar2"];
			[_mortarLogic, [_sound,500]] remoteExec ["say3D"];
			*/

			_gunsFired = _gunsFired - 1;
		};

		_rounds = _rounds + 1;
		sleep _reloadTime;
	};
};