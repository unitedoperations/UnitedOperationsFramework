/*    Description: Assign units to a vehicle.
 *    Arguments:
 *        ARRAY    - Position of Vehicle
 *         STRING    - Vehicle Class Name
 *        ARRAY    - Units Role and Turret  (assignedVehicleRole)
 *        OBJECT    - Unit
 *    Return Value:
 *        TRUE
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
    params [["_pos",[],[[]]],["_vc","",[""]],["_vr",[],[[]]],["_u",objNull,[objNull]]];
    private _veh = _pos nearestObject _vc;
    _vr params [["_role","",[""]],["_turret",[],[[]]]];
    switch (tolower _role) do {
        case "driver": {
            _u assignAsDriver _veh;
        };
        case "cargo": {
            _u assignAsCargo _veh;
        };
        case "turret": { 
            _u assignAsTurret [_veh,_turret];
        };
        default {};
    };
    true