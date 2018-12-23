/*	Description: Gives players custom self actions
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		Olsen & Starfox64 & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"


if (isServer) then {
	if (2 in [UO_FW_JIP_TypeBLUFOR,UO_FW_JIP_TypeOPFOR,UO_FW_JIP_TypeINDFOR,UO_FW_JIP_TypeCIVILIAN]) then {
		[] spawn {
			waitUntil {!isNil "UO_FW_JIP_DENYTIME"};
			waitUntil {sleep 1; time > UO_FW_JIP_DENYTIME};

			missionNamespace setVariable ["UO_FW_JIPDenied", true];
			publicVariable "UO_FW_JIPDenied";
		};
	};
	[] spawn {
		waitUntil {!isNil "UO_FW_JIP_EXPIRETIME"};
		waituntil {sleep 1; time > (UO_FW_JIP_EXPIRETIME * 60)};
		missionNamespace setVariable ["UO_FW_JIPExpired", true];
		publicVariable "UO_FW_JIPExpired";
	};
};

if (!isDedicated && hasInterface && !(side player isEqualto "LOGIC")) then {
	if ((((UO_FW_JIP_TypeBLUFOR == 2) && (side player == west)) || ((UO_FW_JIP_TypeOPFOR == 2) && (side player == east)) || ((UO_FW_JIP_TypeINDFOR == 2) && (side player == independent)) || ((UO_FW_JIP_TypeCIVILIAN == 2) && (side player == civilian))) && (missionNamespace getVariable ["UO_FW_JIPDenied", false])) exitWith {
		[] spawn {
			sleep 5;
			player call UO_FW_fnc_UntrackUnit;
			player setDamage 1;

			sleep 8;
			_layer1 = "JipLayer" cutText ["This mission does not support JIP.", "PLAIN DOWN"];
			sleep 8;
			_layer1fade = "JipLayer" cutFadeOut 5;
		};
	};

	if (missionNamespace getVariable ["UO_FW_JIPExpired", false]) exitwith {
		sleep 5;
		player call UO_FW_fnc_UntrackUnit;
		player setDamage 1;

		sleep 8;
		_layer2 = "JipLayer2" cutText ["You have spawned in past the mission JiP cutoff timer.", "PLAIN DOWN"];
		sleep 8;
		_layer2fade = "JipLayer2" cutFadeOut 5;
	};

	_target = leader player;

	if (player == _target || !(_target call UO_FW_fnc_Alive)) then {

		_rank = -1;

		{
			if (rankId _x > _rank && (_target call UO_FW_fnc_Alive)) then {
				_rank = rankId _x;
				_target = _x;
			};
		} forEach ((units group player) - [player]);
	};

	switch (side player) do {
		case west: {
			if ((_target distance player) >  UO_FW_JIP_DistanceBLUFOR) then {

				switch (UO_FW_JIP_TypeBLUFOR) do {

					case 0: {

						_teleportAction = player addAction ["Teleport to Squad", "x\UO_FW\addons\main\JipModule\scripts\teleportAction.sqf", _target];

						[_teleportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceBLUFOR) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP teleport option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceBLUFOR], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

					case 1: {

						_transportAction = player addAction ["Request Transport", "x\UO_FW\addons\main\JipModule\scripts\transportAction.sqf"];

						[_transportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceBLUFOR) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP transport request option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceBLUFOR], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

				};
			};
		};
		case east: {
			if ((_target distance player) >  UO_FW_JIP_DistanceOPFOR) then {

				switch (UO_FW_JIP_TypeOPFOR) do {

					case 0: {

						_teleportAction = player addAction ["Teleport to Squad", "x\UO_FW\addons\main\JipModule\scripts\teleportAction.sqf", _target];

						[_teleportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceOPFOR) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP teleport option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceOPFOR], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

					case 1: {

						_transportAction = player addAction ["Request Transport", "x\UO_FW\addons\main\JipModule\scripts\transportAction.sqf"];

						[_transportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceOPFOR) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP transport request option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceOPFOR], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

				};
			};
		};
		case independent: {
			if ((_target distance player) >  UO_FW_JIP_DistanceINDFOR) then {

				switch (UO_FW_JIP_TypeINDFOR) do {

					case 0: {

						_teleportAction = player addAction ["Teleport to Squad", "x\UO_FW\addons\main\JipModule\scripts\teleportAction.sqf", _target];

						[_teleportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceINDFOR) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP teleport option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceINDFOR], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

					case 1: {

						_transportAction = player addAction ["Request Transport", "x\UO_FW\addons\main\JipModule\scripts\transportAction.sqf"];

						[_transportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceINDFOR) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP transport request option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceINDFOR], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

				};
			};
		};
		case civilian: {
			if ((_target distance player) >  UO_FW_JIP_DistanceCIVILIAN) then {

				switch (UO_FW_JIP_TypeCIVILIAN) do {

					case 0: {

						_teleportAction = player addAction ["Teleport to Squad", "x\UO_FW\addons\main\JipModule\scripts\teleportAction.sqf", _target];

						[_teleportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceCIVILIAN) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP teleport option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceCIVILIAN], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

					case 1: {

						_transportAction = player addAction ["Request Transport", "x\UO_FW\addons\main\JipModule\scripts\transportAction.sqf"];

						[_transportAction] spawn { //Spawns code running in parallel

							_spawnPos = getPosATL player;

							while {true} do {

								if ((player distance _spawnPos) > UO_FW_JIP_SpawnDistanceCIVILIAN) exitWith { //Exitwith ends the loop

									player removeAction (_this select 0);
									cutText [format ["JIP transport request option lost, you went beyond %1 meters from your spawn location", UO_FW_JIP_SpawnDistanceCIVILIAN], 'PLAIN DOWN'];

								};

								sleep (60); //Runs every min

							};
						};

					};

				};
			};
		};
	};
};
