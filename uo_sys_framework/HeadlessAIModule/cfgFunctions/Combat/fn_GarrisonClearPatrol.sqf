private ["_Locations", "_Unit", "_InCover", "_Enemy", "_RefinedBuildingArray", "_UnitPosition", "_AcceptableRange", "_ClosestPos"];
params ["_Locations","_Unit","_InCover","_InCover","_Enemy"];

sleep (random 5);

            //Define this array so the original reMains intact in case needed latter.
            _RefinedBuildingArray = _Locations;

            //Remove any positions below or above the player.
            _UnitPosition = getposATL _Enemy;
            _AcceptableRange = _UnitPosition select 2;
            {
                if ((_x select 2) < (_AcceptableRange - 1) || (_x select 2) > (_AcceptableRange + 1)) then {
                    _RefinedBuildingArray = _RefinedBuildingArray - [_x];
                };

            } foreach _RefinedBuildingArray;


            //Define the closest position to be edited
            if (_RefinedBuildingArray isEqualTo []) then {_ClosestPos = [_Locations,_Enemy] call EFUNC(AI,ClosestObject);} else {_ClosestPos = [_RefinedBuildingArray,_Enemy] call EFUNC(AI,ClosestObject);};


if (isNil "_closestpos") exitWith {};
while {(_Unit distance _ClosestPos) > 3 && alive _Unit} do {

            _Unit doMove _ClosestPos;
            sleep 5;

            //Define this array so the original reMains intact in case needed latter.
            _RefinedBuildingArray = _Locations;

            //Remove any positions below or above the player.
            _UnitPosition = getposATL _Enemy;
            _AcceptableRange = _UnitPosition select 2;
            {
                if ((_x select 2) < (_AcceptableRange - 1) || (_x select 2) > (_AcceptableRange + 1)) then {
                    _RefinedBuildingArray = _RefinedBuildingArray - [_x];
                };

            } foreach _RefinedBuildingArray;


            //Define the closest position to be edited
            if (_RefinedBuildingArray isEqualTo []) then {_ClosestPos = [_Locations,_Enemy] call EFUNC(AI,ClosestObject);} else {_ClosestPos = [_RefinedBuildingArray,_Enemy] call EFUNC(AI,ClosestObject);};


};
