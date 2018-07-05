_isEnabled = missionNamespace getVariable ["UO_FW_Jip_Enabled",false];
if(!_isEnabled) exitWith {};

    ["JIP Manager", "Handles JIPs in different ways depending on the module's settings.", "Olsen &amp; Starfox64"] call UO_FW_FNC_RegisterModule;
    FW_JIPDENYTIME = missionNamespace getVariable ["UO_FW_Jip_JipDenyTime",300];
    switch(side player) do
    {
        case west:
        {
            FW_JIPTYPE = missionNamespace getVariable ["UO_FW_Jip_BluforTypeSelect","JIPTELEPORT"];
        };
        case east:
        {
            FW_JIPTYPE = missionNamespace getVariable ["UO_FW_Jip_OpforTypeSelect","JIPTELEPORT"];
          
        };
        case resistance:
        {
            FW_JIPTYPE = missionNamespace getVariable ["UO_FW_Jip_IndependentTypeSelect","JIPTELEPORT"];
        };
        case civilian:
        {
            FW_JIPTYPE = missionNamespace getVariable ["UO_FW_Jip_CivilianTypeSelect","JIPTELEPORT"];
        };
        default
        {
            FW_JIPTYPE = "JIPTELEPORT";
        };
    };
    FW_JIPDISTANCE = missionNamespace getVariable ["UO_FW_Jip_JipDistance",50];
    FW_SPAWNDISTANCE = missionNamespace getVariable ["UO_FW_Jip_SpawnDistance",200];
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
                player call UO_FW_FNC_UntrackUnit;
                player setDamage 1;

                sleep 8;
                cutText ["This mission does not support JIP.", "PLAIN DOWN"];
            };

        };

        _target = leader player;

        if (player == _target || !(_target call UO_FW_FNC_Alive)) then {

            _rank = -1;

            {

                if (rankId _x > _rank && (_target call UO_FW_FNC_Alive)) then {
                    _rank = rankId _x;
                    _target = _x;
                };

            } forEach ((units group player) - [player]);
        };

        if ((_target distance player) >  FW_JIPDISTANCE) then {

            switch (FW_JIPTYPE) do {

                case "TELEPORT": {

                    _teleportAction = player addAction ["Teleport to Squad", {_this call UO_FW_fnc_TeleportAction;}, _target];

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

                    _transportAction = player addAction ["Request Transport", {_this call UO_FW_fnc_TransportAction;}];

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