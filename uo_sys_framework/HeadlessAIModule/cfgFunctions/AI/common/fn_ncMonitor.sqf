/*  Non-Combatant Monitor monitors each Position Module linked to the Non-Combatant Module for players and initiates the activation of either warning or alert that the area is being breached (player in range).
 *	Also adds all units in mission to zues every 2mins (7secs in debug mode)
 * 	Arguments:
 * 		NIL
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_logic"];	
	sleep 3;
	private _syncedPositions = [_logic,["UO_FW_PositionModule","UO_FW_PositionModule_R"]] call UO_AI_fnc_getSyncedModules;
	[_syncedPositions] spawn {
		params["_syncedPositions"];
		while {true} do {
			{
				private _position = _x; 
				_area = [getPosATL _position,(_position getVariable ["aePositionRadiusX",0]),(_position getVariable ["aePositionRadiusY",0]),getDir _position,(if((typeof _position) isEqualTo "UO_FW_PositionModule_R") then {true} else {false})];
				_alert = allPlayers select { 
					_player = _x;
					!(_player isKindOf "HeadlessClient_F") && alive _player 
					&& (({(vehicle _player) isKindOf _x} count ["CAManBase","LandVehicle","Ship"]) > 0)
					&& (side _player) in [CIVILIAN]
					&& _player inArea _area
				};				
				if ( count _alert > 0 ) then { 
					{player setCaptive false;} remoteExec ["bis_fnc_call", _alert];
				} else { 
					_area = [getPosATL _position,((_position getVariable ["aePositionRadiusX",0])+(_position getVariable ["aePositionWarnRadius",20])),((_position getVariable ["aePositionRadiusY",0])+(_position getVariable ["aePositionWarnRadius",20])),getDir _position,(if((typeof _position) isEqualTo "UO_FW_PositionModule_R") then {true} else {false})];
					_warn = allPlayers select { 
						_player = _x;
						!(_player isKindOf "HeadlessClient_F") && alive _player 
						&& (({(vehicle _player) isKindOf _x} count ["CAManBase","LandVehicle","Ship"]) > 0)
						&& (side _player) in [CIVILIAN]
						&& _player inArea _area
					};
					if(count _warn > 0) then { 
						{hint "Guards are suspicious of your activity"} remoteExec ["bis_fnc_call", _warn];
					};
				};	
			} foreach _syncedPositions;						
			sleep 3;		
		};
	};