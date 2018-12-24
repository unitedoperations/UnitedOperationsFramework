/*	Description: Prevents negligent discharges at spawn
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		Starfox64 & PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"

if (!UO_FW_Anti_ND_Enabled) exitwith {};
["ANTI ND", "Extra Safety for mission start", "Starfox64 and PiZZADOX and Sacher"] call UO_FW_FNC_RegisterModule;

if (isServer) then {
	missionNamespace setVariable ["UO_FW_ND_Active", true];
	publicVariable "UO_FW_ND_Active";
	[] spawn {
		waitUntil {!isNil "UO_FW_Anti_ND_Time"};
		waitUntil {private _timecheck = serverTime; if (_timecheck isEqualto 0) then {_timecheck = time;}; (_timecheck > UO_FW_Anti_ND_Time)};
		missionNamespace setVariable ["UO_FW_ND_Active", false];
		publicVariable "UO_FW_ND_Active";
	};
};

if (!isDedicated && hasinterface) then {
	[] spawn {
		[{!isNull player}, {
			UO_FW_SpawnPos = getPos player;

			UO_FW_FiredEh = player addEventHandler ["Fired", {
				private ["_p"];

				_p = _this select 6;

				if (missionNamespace getVariable ["UO_FW_ND_Active", false]) then {
					if ((UO_FW_SpawnPos distance player) <= UO_FW_Anti_ND_Distance) then {
						deleteVehicle _p;
						_msg1 = "";
						_msg2 = "";
						if (missionNamespace getVariable ["UO_FW_ND_Active", false]) then {
							_msg1 = "\nTime remaining: " + str round (UO_FW_Anti_ND_Time - time) + " seconds.";
						};
						if ((UO_FW_SpawnPos distance player) <= UO_FW_Anti_ND_Distance) then {
							_msg2 = "\nDistance from base: " + str round (UO_FW_SpawnPos distance player) + " out of " + str (round UO_FW_Anti_ND_Distance) + " meters.";
						};
						hintC format ["Anti-ND protection active!%1%2", _msg1, _msg2];
						if ((_this select 5) call BIS_fnc_isThrowable) then {
							player addMagazine (_this select 5);
						}
						else {
							player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
						};
					};
				};


				waitUntil {!(isNil "UO_FW_FiredEh")};
				waitUntil {!(UO_FW_ND_Active)};
				player removeEventHandler ["Fired", UO_FW_FiredEh];
			}];
		}, []] call CBA_fnc_waitUntilAndExecute;
	};
};
