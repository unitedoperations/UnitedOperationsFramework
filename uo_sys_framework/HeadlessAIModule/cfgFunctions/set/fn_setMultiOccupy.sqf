/*    Description: Returns an occupy setting for multiplied groups.
 *    Arguments:
 *         NUMBER    - Occupy Option
 *    Return Value:
 *         NUMBER     - New Occupy Option
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
    params ["_multiOccupy"];
    private _return = switch (_multiOccupy) do {
        case 1: {floor(_gx*0.25);};
        case 2: {floor(_gx*0.5);};
        case 3: {floor(_gx*0.75);};
        case 4: {floor(_gx*(random 1));};
        case 5: {1};
        case 6: {2};
        case 7: {3};
        case 8: {4};
        case 9: {5};
        default {0};
    };
    _return