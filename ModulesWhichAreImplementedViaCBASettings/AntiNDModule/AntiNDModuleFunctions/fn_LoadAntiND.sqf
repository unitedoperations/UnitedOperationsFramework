

_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{

    ["Anti ND", "Prevents negligent discharges at spawn.", "Starfox64"] call UO_FNC_RegisterModule;

	ANTI_ND_DIST = (_logic getVariable ["NDDistanceArgument",1]);
	ANTI_ND_TIME = (_logic getVariable ["NDTimeArgument",1]);

	if (isServer) then {

		missionNamespace setVariable ["FW_ND_Active", true];
		publicVariable "FW_ND_Active";

		[] spawn {

			waitUntil {time > ANTI_ND_TIME};

			missionNamespace setVariable ["FW_ND_Active", false];
			publicVariable "FW_ND_Active";

		};

	};

	if (!isDedicated) then {

		[] spawn {

			waitUntil {!isNull player};

			FW_SpawnPos = getPos player;

			FW_FiredEh = player addEventHandler ["Fired", {
				private ["_p"];

				_p = _this select 6;

				if ((FW_SpawnPos distance player) <= ANTI_ND_DIST || missionNamespace getVariable ["FW_ND_Active", false]) then {
					deleteVehicle _p;
					_msg1 = "";
					_msg2 = "";
					if (missionNamespace getVariable ["FW_ND_Active", false]) then {
						_msg1 = "\nTime remaining: " + str round (ANTI_ND_TIME - time) + " seconds.";
					};
					if ((FW_SpawnPos distance player) <= ANTI_ND_DIST) then {
						_msg2 = "\nDistance from base: " + str round (FW_SpawnPos distance player) + " out of " + str (round ANTI_ND_DIST) + " meters.";
					};
					hintC format ["Anti-ND protection active!%1%2", _msg1, _msg2];
					if ((_this select 5) call BIS_fnc_isThrowable) then {
						player addMagazine (_this select 5);
					}
					else {
						player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
					};
				};
			}];

		};

	};

};
