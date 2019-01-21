/*    Description: Sends display text event to group leader requesting transport for JiP player
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        Olsen & Starfox64 & PiZZADOX
 */

#define COMPONENT JiP
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

params ["_target", "_args"];
private _targets = [];
{
    if ((side player) isEqualto (side _x) && {(leader _x isEqualto _x)}) then {
        _targets set [count _targets, _x];
    };
} forEach playableUnits;
["ace_common_displayTextStructured", [["%1 joined the mission and is requesting transport.", name player], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
[player,1,["ACE_SelfActions","Jip_Transport_Action"]] call ace_interact_menu_fnc_removeActionFromObject;
