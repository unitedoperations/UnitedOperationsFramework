// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];


//from core/init.sqf
if (_activated) then
{
	enableSaving [false, false];

	if (isServer) then
	{

		"west" call UO_fnc_CreateRespawnMarker;
		"east" call UO_fnc_CreateRespawnMarker;
		"guer" call UO_fnc_CreateRespawnMarker;
		"civ" call UO_fnc_CreateRespawnMarker;

		FW_Teams = []; //DO NOT REMOVE
		FW_MissionEnded = false; //Mission has not ended

		FW_EventPlayerSpawnedHandle = ["FW_PlayerSpawned", {_this call UO_fnc_EventPlayerSpawned;}] call CBA_fnc_addEventHandler;
		FW_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {_this call UO_fnc_EventRespawned;}];
		FW_EventKilledHandle = addMissionEventHandler ["EntityKilled", {_this call UO_fnc_EventKilled;}];

		FW_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {_this call UO_fnc_EventDisconnect;}];

	};

	if (!isDedicated) then
	{

		//Anything done using "player" must be past this line for JIP compatibility
		waitUntil {!(isNull player)};

		if (!isServer) then
		{

			//Tells the server the player has spawned
			["FW_PlayerSpawned", player] call CBA_fnc_serverEvent;

			["endMission",
			{
				private _msg = "Mission ended by admin";
				if (count (_this select 0) > 0) then
				{
					_msg = _msg + ": " + _this select 0;
				};
				_msg call UO_fnc_EndMission;
			}, "admin"] call CBA_fnc_registerChatCommand;
		};

		//"FW_EndMission" player event sends the received variables to the end screen
		FW_EndMissionEh = ["FW_EndMission", {_this call UO_fnc_dia_endscreen;}] call CBA_fnc_addEventHandler;

		//Various settings
		enableEngineArtillery false; //Disable Arma 3 artillery computer
		enableRadio false; //Disable Arma 3 regular radio
		enableSentences false; //Disable Arma 3 regular radio chatter
		0 fadeRadio 0; //Lower radio volume to 0

		"" call UO_fnc_Menu;

		FW_RespawnTickets = 0; //Initialize respawn tickets to 0

		player setVariable ["FW_Dead", false, true]; //Tells the framework the player is alive
		player setVariable ["FW_Spectating", false, true]; //Player is not spectating
		player setVariable ["FW_Body", player, true]; //Remembers his old body for spectating his dead body

		//Makes the player go into spectator mode when dead or respawn if he has respawn tickets
		FW_KilledEh = player addEventHandler ["Killed", {"" spawn UO_fnc_SpectateCheck;}];
		FW_RespawnEh = player addEventHandler ["Respawn", {_this call UO_fnc_SpectatePrep;}];

		//Various settings
		player addRating 100000; //Makes sure ai doesnt turn hostile when teamkilling
		player setVariable ["BIS_noCoreConversations", true]; //Disable scroll wheel conversations

	};


	//load Basic Server Settings

	//From customization/settings.sqf



	 if (isServer) then
	 {


	 	setViewDistance (_logic getVariable ["ViewDistanceAIArgument",""]); //View distance for the server (the ai's)

		#define ADD_TEAM(SIDE,NAME,PLAYER)\
		_name = _logic getVariable [NAME,""];\
		if(_name != "") then\
		{\
			[SIDE, _name, PLAYER] call UO_fnc_AddTeam;\
		};

		ADD_TEAM(west,"BluforPlayerFactionNameArgument","player");
		ADD_TEAM(west,"BluforAIFactionNameArgument","ai");
		ADD_TEAM(east,"OpforPlayerFactionNameArgument","player");
		ADD_TEAM(east,"OpforAIFactionNameArgument","ai");
		ADD_TEAM(guer,"ResistancePlayerFactionNameArgument","player");
		ADD_TEAM(guer,"ResistanceAIFactionNameArgument","ai");
		ADD_TEAM(civilian,"CivilianPlayerFactionNameArgument","player");
		ADD_TEAM(civilian,"CivilianAIFactionNameArgument","ai");
	 	// [resistance, "Local Militia", "player"] call UO_fnc_AddTeam; //Adds a player team called Local Militia on side resistance (aka independent)

	 };

	 if (!isDedicated) then
	 {

	 	FW_DebugMessagesEnabled = (_logic getVariable ["EnableDebugArgument",true]); //Only disable debug messages when the mission is released

	 	setViewDistance (_logic getVariable ["ViewDistancePlayerArgument",""]); //View distance for the player

	 	//call UO_fnc_forceTerrainGrid; //uncomment this to force high terrain setting. This will prevent faraway objects from appearing as floating. Useful for missions with long sightlines.

	 	switch (side player) do
		{ //Checks what team the player is on
	 		case west:
			{
	 			FW_RespawnTickets = (_logic getVariable ["BluforRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_west_respawn
	 		};
			case east:
			{
	 			FW_RespawnTickets = (_logic getVariable ["OpforRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_west_respawn
	 		};
			case resistance:
			{
	 			FW_RespawnTickets = (_logic getVariable ["IndforRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_west_respawn
	 		};
			case civilian:
			{
	 			FW_RespawnTickets = (_logic getVariable ["CivilianRespawnTicketsArgument",0]); //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_west_respawn
	 		};
	 		//add more cases for other factions here
	 	};
	 };

	 //from init.sqf
 	if (isServer) then
 	{
 		"" call UO_fnc_StartingCount; //DO NOT REMOVE

 	};
};
