/*    Description: Looksup class name and returns array selector.
 *     Arguments:
 *         CLASSNAME    - Variable to lookup
 *         ARRAY        - Array to lookup
 *         Optional:
 *            NUMBER     - Selection to make in Array.
 *     Return Value:
 *         NUMBER         - Array Selector
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params [
    "_classname",
    "_array",
    ["_keycolumn",0,[0]],
    ["_value",-1,[0]]
];
{
    if ((_x select _keycolumn) isEqualTo _classname) exitwith {
        _value = _foreachIndex;
    };
} foreach _array;
_value
