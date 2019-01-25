/*    Description: Gets synced modules and return only allowed synced modules. All synced modules if allowed not passed.
 *     Arguments:
 *         ANY        - Module, Group, Object (name, _logic)
 *    Optional:
 *         ARRAY    - Allowed Modules
 *     Return Value:
 *         ARRAY    - ALL or Allowed Synchronised Modules
 */
params ["_logic",["_AllowedModules",[],[[]]],["_AllowedSynced",[],[[]]],["_Allowed",false,[false]]];
private _synced = synchronizedObjects _logic;
{
    private _syncModule = _x;
    if (_syncModule isKindOf "Logic") then {
        _Allowed = if (count _AllowedModules >= 1) then {
            (typeof _syncModule) in _AllowedModules
        } else {
            true
        };
        if (_Allowed) then {
            _AllowedSynced pushBack _syncModule;
        };
    };
} foreach _synced;
_AllowedSynced
