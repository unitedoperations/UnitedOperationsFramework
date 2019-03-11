if (!isDedicated) then {
    private ["_respawnName", "_respawnPoint", "_temp", "_text"];

    if (UO_FW_RespawnTickets > 0) then {

        _respawnName = toLower(format ["UO_FW_%1_respawn", side player]);
        _respawnPoint = missionNamespace getVariable [_respawnName, objNull];

        if (isNull(_respawnPoint)) then {

            _temp = format ["Ticketed respawn feature:<br></br>Warning game logic ""%1"" does not exist.", _respawnName];
            _temp call EFUNC(Debug,DebugMessage);

        };

        _text = "respawns left";

        if (UO_FW_RespawnTickets == 1) then {

            _text = "respawn left";

        };

        _text spawn {

            sleep 5;
            cutText [format ['%1 %2', UO_FW_RespawnTickets, _this], 'PLAIN DOWN'];

        };

    };
};
