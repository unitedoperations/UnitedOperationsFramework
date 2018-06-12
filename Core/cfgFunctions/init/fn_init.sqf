/*	Description: Main UO Framework Init. Declares needed vars, calls core functions
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		N/A 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

//Universal init
#include "\x\UO_FW\addons\main\Core\defines\mainSettings.hpp"

if (isServer) then
{
	//Server init
	#include "\x\UO_FW\addons\main\Core\defines\serverSettings.hpp"
	
	"" call UO_FW_fnc_teamsInit;

	"" call UO_FW_fnc_StartingCount; //DO NOT REMOVE
};

if (!isDedicated) then
{
	//non server init
	//Anything done using "player" must be past this line for JIP compatibility
	//waitUntil {!(isNull player)};

	if (!isServer && hasinterface) then {
		//MP player init
		//Tells the server the player has spawned
		["UO_FW_PlayerSpawned", player] call CBA_fnc_serverEvent;

		["endMission",
		{
			private _msg = "Mission ended by admin";
			if (count (_this select 0) > 0) then
			{
				_msg = _msg + ": " + _this select 0;
			};
			_msg call UO_FW_fnc_EndMission;
		}, "admin"] call CBA_fnc_registerChatCommand;
	};
	
	if (!isServer && !hasinterface) then {
		//HC init
	};


	//Player settings
	#include "\x\UO_FW\addons\main\Core\defines\playerSettings.hpp"
	//#include "\x\UO_FW\addons\main\Core\defines\RespawnInit.hpp"

	"" call UO_FW_fnc_Menu;

	UO_FW_RespawnTickets = 0; //Initialize respawn tickets to 0
	
	//switch (side player) do
	//{ //Checks what team the player is on
 	//	case west:
	//	{
 	//		UO_FW_RespawnTickets = (_logic getVariable ["BluforRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format UO_FW_side_respawn. Example: UO_FW_west_respawn
 	//	};
	//	case east:
	//	{
 	//		UO_FW_RespawnTickets = (_logic getVariable ["OpforRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format UO_FW_side_respawn. Example: UO_FW_west_respawn
 	//	};
	//	case resistance:
	//	{
 	//		UO_FW_RespawnTickets = (_logic getVariable ["IndforRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format UO_FW_side_respawn. Example: UO_FW_west_respawn
 	//	};
	//	case civilian:
	//	{
 	//		UO_FW_RespawnTickets = (_logic getVariable ["CivilianRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format UO_FW_side_respawn. Example: UO_FW_west_respawn
 	//	};
 	//	//add more cases for other factions here
 	//};
};