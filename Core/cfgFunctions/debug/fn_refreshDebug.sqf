/*
 * Author: PiZZADOX
 *
 * Refreshes text in debug display
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */
 
private _text = "<br></br><br></br>";

{
	_text = _text + _x + "<br></br><br></br>";
} forEach UO_FW_DebugMessages;

((uiNamespace getVariable "UO_FW_Debug_Control") displayCtrl 4001) ctrlSetStructuredText parsetext _text;
	