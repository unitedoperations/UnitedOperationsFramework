/*    Description: Main UO Framework Init. Declares needed vars, calls core functions
 *    Arguments:
 *         N/A
 *    Return Value:
 *         N/A
 *    Author
 *        Sacher
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EDEN_CHECK;

LOG("BasicSettings3Den called");

private _ctrlCheckbox = _this select 0;
private _state = [false,true] select (cbChecked _ctrlCheckbox);
LOG_2("onCheckedChanged _control: %1 _state: %2",_control,_state);
if (_state) then {
    [] call EFUNC(3DEN,BasicSettings3Den);
};
