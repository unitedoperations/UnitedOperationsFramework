/*    Description: Check stance of player is allowed.
 *     Arguments:
 *        OBJECT    - Unit
 *         ARRAY     - Allowed Stance
 *     Return Value:
 *        BOOL     - True or False
 */
params [
    ["_unit",objNull,[objNull]],
    ["_Allowed",[],[[]]],
    ["_return",false,[false]]
];
if !(_Allowed isEqualto []) then {
    if ((stance _unit) in _Allowed) then {
        _return    = false;
    } else {
        _return    = true;
    };
};
_return
