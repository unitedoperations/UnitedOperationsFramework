
if (!isDedicated) then {

	if (FW_DebugMessagesEnabled) then
	{

		100 cutRsc ["DIA_DEBUG", "PLAIN"];

		private ["_someText", "_text"];

		_someText = 4001;

		_text = "";

		{

			_text = _text + _x + "<br></br><br></br>";

		} forEach FW_DebugMessages;

		(400 displayCtrl _someText) ctrlSetStructuredText parseText _text;

	};
};
