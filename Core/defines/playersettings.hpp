enableEngineArtillery false; //Disable Arma 3 artillery computer
enableRadio false; //Disable Arma 3 regular radio
enableSentences false; //Disable Arma 3 regular radio chatter
0 fadeRadio 0; //Lower radio volume to 0

player addRating 100000; //Makes sure ai doesnt turn hostile when teamkilling
player setVariable ["BIS_noCoreConversations", true]; //Disable scroll wheel conversations

player setVariable ["UO_FW_Dead", false, true]; //Tells the framework the player is alive
player setVariable ["UO_FW_Spectating", false, true]; //Player is not spectating
player setVariable ["UO_FW_Body", player, true]; //Remembers his old body for spectating his dead body

//Makes the player go into spectator mode when dead or respawn if he has respawn tickets
UO_FW_KilledEh = player addEventHandler ["Killed", {"" spawn UO_FW_fnc_SpectateCheck;}];
UO_FW_RespawnEh = player addEventHandler ["Respawn", {_this call UO_FW_fnc_SpectatePrep;}];

_playerViewDistance = missionNamespace getvariable ["UO_FW_PlayerViewDistance",2000];
setViewDistance _playerViewDistance;

//"UO_FW_EndMission_Event" player event sends the received variables to the end screen
UO_FW_EndMission_EventEH = ["UO_FW_EndMission_Event", {_this call UO_FW_fnc_dia_endscreen;}] call CBA_fnc_addEventHandler;