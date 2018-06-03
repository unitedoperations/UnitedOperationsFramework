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

if(typeName _string == "STRING") then
{
    call compile  _string
}else
{
    []
}
