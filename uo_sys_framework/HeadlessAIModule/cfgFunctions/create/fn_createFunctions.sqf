/*    Description: Gets synced modules list and checks if correct modules linked.
 *    Displays error message in debug mode if wrong links exist.
 *     Arguments:
 *         OBJECT    - Module (name, _logic)
 *     Return Value:
 *         BOOL     - True
 *
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_functions","_delay"];
[{
    {
        private _logic = _x;
        private _posModules = [_logic,["UO_FW_AI_PositionModule"]] call EFUNC(AI,getSyncedModules);
        private _spos = [0,0,0];
        if ( count _posModules > 0) then {
            private _pos = getPosATL (_posModules select 0);
            if (((_posModules select 0) getVariable ['UO_FW_AI_PositionRadius',0]) > 0) then {
                _spos = [_pos,0,((_posModules select 0) getVariable ['UO_FW_AI_PositionRadius',0]),1] call EFUNC(AI,getRandomPositionCircle);
            } else {
                _spos = _pos;
            };
        };
        switch (typeof _logic) do {
            //Function Types - spawns at synced position module if found, if not found spawns at function module pos
            default {};
        };
    } forEach _functions;
}, [], _delay] call CBA_fnc_waitAndExecute;
