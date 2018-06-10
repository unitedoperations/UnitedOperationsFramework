_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["JIP Manager", "Handles JIPs in different ways depending on the module's settings.", "Olsen &amp; Starfox64"] call UO_FNC_RegisterModule;

    switch(side player) do
    {
        case west:
        {
            FW_JIPTYPE = _logic getVariable ["BluforTypeSelectArgument","JIPTELEPORT"];
    		FW_JIPDISTANCE = _logic getVariable ["BluforJipDistanceArgument",50];
    		FW_SPAWNDISTANCE = _logic getVariable ["BluforSpawnDistanceArgument",200];
        };
        case east:
        {
            FW_JIPTYPE = _logic getVariable ["OpforTypeSelectArgument","JIPTELEPORT"];
            FW_JIPDISTANCE = _logic getVariable ["OpforJipDistanceArgument",50];
            FW_SPAWNDISTANCE = _logic getVariable ["OpforSpawnDistanceArgument",200];
        };
        case resistance:
        {
            FW_JIPTYPE = _logic getVariable ["IndforTypeSelectArgument","JIPTELEPORT"];
            FW_JIPDISTANCE = _logic getVariable ["IndforJipDistanceArgument",50];
            FW_SPAWNDISTANCE = _logic getVariable ["IndforSpawnDistanceArgument",200];
        };
        case civilian:
        {
            FW_JIPTYPE = _logic getVariable ["DivilianTypeSelectArgument","JIPTELEPORT"];
            FW_JIPDISTANCE = _logic getVariable ["DivilianJipDistanceArgument",50];
            FW_SPAWNDISTANCE = _logic getVariable ["DivilianSpawnDistanceArgument",200];
        };
    };

    if (isServer) then {
    [] spawn {

        waitUntil {time > FW_JIPDENYTIME};

        missionNamespace setVariable ["FW_JIPDenied", true];
        publicVariable "FW_JIPDenied";

    };
    };

    if (!isDedicated) then {

        if (FW_JIPTYPE == "DENY" && missionNamespace getVariable ["FW_JIPDenied", false]) exitWith {

            [] spawn {
                sleep 5;
                player call UO_FNC_UntrackUnit;
                player setDamage 1;

                sleep 8;
                cutText ["This mission does not support JIP.", "PLAIN DOWN"];
            };

        };

        _target = leader player;

        if (player == _target || !(_target call UO_FNC_Alive)) then {

            _rank = -1;

            {

                if (rankId _x > _rank && (_target call UO_FNC_Alive)) then {
                    _rank = rankId _x;
                    _target = _x;
                };

            } forEach ((units group player) - [player]);
        };

        if ((_target distance player) >  FW_JIPDISTANCE) then {

            switch (FW_JIPTYPE) do {

                case "TELEPORT": {

                    _teleportAction = player addAction ["Teleport to Squad", {_this call UO_fnc_TeleportAction;}, _target];

                    [_teleportAction] spawn { //Spawns code running in parallel

                        _spawnPos = getPosATL player;

                        while {true} do {

                            if (player distance _spawnPos > FW_SPAWNDISTANCE) exitWith { //Exitwith ends the loop

                                player removeAction (_this select 0);
                                cutText [format ["JIP teleport option lost, you went beyond %1 meters from your spawn location", FW_SPAWNDISTANCE], 'PLAIN DOWN'];

                            };

                            sleep (60); //Runs every min

                        };
                    };

                };

                case "TRANSPORT": {

                    _transportAction = player addAction ["Request Transport", {_this call UO_fnc_TransportAction;}];

                    [_transportAction] spawn { //Spawns code running in parallel

                        _spawnPos = getPosATL player;

                        while {true} do {

                            if (player distance _spawnPos > FW_SPAWNDISTANCE) exitWith { //Exitwith ends the loop

                                player removeAction (_this select 0);
                                cutText [format ["JIP transport request option lost, you went beyond %1 meters from your spawn location", FW_SPAWNDISTANCE], 'PLAIN DOWN'];

                            };

                            sleep (60); //Runs every min

                        };
                    };

                };

            };
        };
    };
};
