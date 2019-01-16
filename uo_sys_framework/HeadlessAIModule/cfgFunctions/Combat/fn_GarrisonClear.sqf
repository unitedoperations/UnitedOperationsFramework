private ["_Enemy", "_nBuilding", "_Locations"];
params ["_Unit","_UO_FW_AI_MovedRecentlyCover","_UO_FW_AI_InCover","_UO_FW_AI_ActivelyClearing","_UO_FW_AI_StartedInside","_UO_FW_AI_GARRISONED"];

//Function to send AI to clear buildings
if (_UO_FW_AI_MovedRecentlyCover || {_UO_FW_AI_ActivelyClearing} || {_UO_FW_AI_StartedInside} || {_UO_FW_AI_GARRISONED}) exitWith {};
//Find the closest enemy (This should be the one that is in a building

//systemchat format ["F %1",_Unit];
_Enemy = _Unit call UO_FW_AI_fnc_ClosestEnemy;
if (isNil "_Enemy" || {(typeName _Enemy) isEqualTo "ARRAY"}) exitWith {};

//Find nearest building to the enemy
_nBuilding = nearestBuilding _Enemy;

//Find the locations of the buildings
_Locations = [_nBuilding] call BIS_fnc_buildingPositions;

//Stop the AI - and then tell them to move to the house
{
	//Set variable to true to prevent AI clearing buildings to often
	//_x spawn UO_FW_AI_fnc_StanceModifier;
	if (_Enemy distance _x < 200) then {
		[_Locations,_x,_UO_FW_AI_InCover,_UO_FW_AI_ActivelyClearing,_Enemy] spawn UO_FW_AI_fnc_GarrisonClearPatrol;
	};
} foreach units (group _Unit);
