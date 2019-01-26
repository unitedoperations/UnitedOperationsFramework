/*    Description: Looksup class name and returns array at that class name.
 *     Arguments:
 *         CLASSNAME    - Variable to lookup
 *         ARRAY        - Array to lookup
 *         Optional:
 *            NUMBER     - Selection to make in Array.
 *     Return Value:
 *         ARRAY         - Returned Array
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params [
    "_classname",
    "_array",
    ["_keycolumn",0,[0]],
    ["_value",[],[[]]]
];
for "_i" from 0 to (count _array) step 1 do {
    if ((_array select _i select _keycolumn) == _classname) exitwith {
        _value = _array select _i;
    };
};
_value
