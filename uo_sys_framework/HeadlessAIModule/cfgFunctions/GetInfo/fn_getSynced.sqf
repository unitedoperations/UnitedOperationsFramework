/*    Description: Gets all synced objects, vehicles and units to a module. Including passengers or units in vehicles.
 *    Arguments:
 *         ARRAY    - Module (name, _logic)
 *    Return Value:
 *         ARRAY     - Entities linked to object
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_logic"];
private _synced = synchronizedObjects _logic;
{
    private _obj = _x;
    if (_obj isKindOf "StaticWeapon"
        || _obj isKindOf "Static"
        || _obj isKindOf "Air"
        || _obj isKindOf "Ship"
        || _obj isKindOf "LandVehicle"
    ) then {
        _synced = _synced + (units _obj);
        _synced = _synced + (assignedCargo _obj);
    };
} foreach _synced;
_synced = _synced arrayIntersect _synced;
_synced
