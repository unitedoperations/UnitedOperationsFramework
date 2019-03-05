#define COMPONENT SetupTimer
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

//[_logic,_area,_selectedSide,_time] passed array

["UO_FW_RegisterModuleEvent", ["Setup Timer", "Allows the mission maker to restrict players to an area for a set amount of time.", "Olsen, Sacher and PiZZADOX"]] call CBA_fnc_localEvent;

[{(!isNull player)}, {

    //params ["_logic","_area","_selectedSide","_waittime"];
    _this params ["","_area","_selectedSide","_waittime"];

    if (CBA_missionTime > _waittime) exitwith {};

    if (!((side player) isEqualto _selectedSide) || !((vehicle player) inArea _area)) exitwith {};

    private _alreadyInATimer = GETMVAR(InSetupTimer,false);
    if (_alreadyInATimer) exitwith {};
    if !(_alreadyInATimer) then {
        SETMVAR(InSetupTimer,true);
    };

    "UO_FW_SetupTimer_Layer" cutRsc ["UO_FW_RscSetupTimer", "PLAIN", 0.5, false];
    SETMVAR(WaitTime,_waittime);

    LOG("Starting Setup Timer");

    GVAR(PFHhandle) = [{
        params ["_argNested", "_idPFH"];
        _argNested params ["_unit","_area","_endTime","_pos"];

        private _timeLeft = (_endTime - CBA_missionTime);
        if (_timeLeft <= 0) exitwith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        if ((vehicle _unit) inArea _area) then {
            _pos = getPosATL (vehicle _unit);
            _argNested set [3,_pos];
        } else {
            (vehicle _unit) setVelocity [0,0,0];
            (vehicle _unit) setPosATL _pos;
        };

    }, 0, [player,_area,(CBA_missionTime + _waittime)]] call CBA_fnc_addPerFrameHandler;
}, _this] call CBA_fnc_waitUntilAndExecute;
