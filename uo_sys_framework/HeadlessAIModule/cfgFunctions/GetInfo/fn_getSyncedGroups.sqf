/*    Description: Gets synced group to a module.
 *    Arguments:
 *         OBJECT    - Module
 *     Return Value:
 *         GROUP     - Synchronised Groups
 */
params [["_logic",objNull,[objNull]],["_grp",[],[[]]],["_syncedUnits",[],[[]]],["_syncedGroups",[],[[]]]];
if (!isNull _logic) then {
    private _synced = synchronizedObjects _logic;
    {
        private _unit = _x;
        if (!(_unit isKindOf "Logic")) then {
            if (_unit isKindOf "Man") then {
                _syncedUnits pushBack _unit;
            };
            if (_unit isKindOf "Air" || _unit isKindOf "Ship" || _unit isKindOf "LandVehicle") then {
                _syncedUnits pushBack (driver _unit);
            };
            if (_unit isKindOf "StaticWeapon" || _unit isKindOf "Static") then {
                _syncedUnits pushBack (gunner _unit);
            };
        };
    } foreach _synced;
    if !(_syncedUnits isEqualTo []) then {
        {
            _syncedGroups pushBack (group _x);
        } forEach _syncedUnits;
        _grp = _syncedGroups arrayIntersect _syncedGroups;
    };
};
_grp
