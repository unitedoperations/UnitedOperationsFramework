/*
 * Author: Sacher
 *
 * Converts a string array to a normal array.
 *
 * Arguments:
 * 0: String <string>
 *
 * Return Value:
 * Array
 *
 * Public: Yes
 */

params["_string"];

if(typeName _string == "STRING" && ((count _string) > 0) ) then
{
    if(_string select [0,1] != "[") then {_string = "["+_string;};
    if(_string select [count _string -1,1] != "[") then {_string = _string + "]";};
    call compile  _string
}else
{
    []
}
