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
    for "_j" from 0 to (count _synced) step 1 do {
        private _syncModule = _synced select _j;
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
    };
    _AllowedSynced
