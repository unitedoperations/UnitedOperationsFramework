/*	Description: Displays Shot Count on End Screen
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		TinfoilHate & PiZZADOX
 */

waitUntil{count (missionNamespace getVariable ["Blufor_Shotcount_Data",[""]]) != 1};
waitUntil{count (missionNamespace getVariable ["Opfor_Shotcount_Data",[""]]) != 1};
waitUntil{count (missionNamespace getVariable ["Independent_Shotcount_Data",[""]]) != 1};
waitUntil{count (missionNamespace getVariable ["Civilian_Shotcount_Data",[""]]) != 1};
aCount_textBLU = "BLUFOR Munitions Expended:<br/>";
aCount_textOPF = "OPFOR Munitions Expended:<br/>";
aCount_textRES = "RESISTANCE Munitions Expended:<br/>";
aCount_textCIV = "CIVILIAN Munitions Expended:<br/>";

_arrayBLU = missionNamespace getVariable "Blufor_Shotcount_Data";
_arrayOPF = missionNamespace getVariable "Opfor_Shotcount_Data";
_arrayRES = missionNamespace getVariable "Independent_Shotcount_Data";
_arrayCIV = missionNamespace getVariable "Civilian_Shotcount_Data";
for [{ _i = 0}, {_i < count _arrayBLU}, {_i = _i + 2}] do
{
	_label = _arrayBLU select (_i);
	_count = _arrayBLU select (_i + 1);
	aCount_textBLU = aCount_textBLU + _label + ": " + str(_count) + " Rounds" + "<br/>";
};

for [{ _i = 0}, {_i < count _arrayOPF}, {_i = _i + 2}] do
{
	_label = _arrayOPF select (_i);
	_count = _arrayOPF select (_i + 1);
	aCount_textOPF = aCount_textOPF + _label + ": " + str(_count) + " Rounds" + "<br/>";
};

for [{ _i = 0}, {_i < count _arrayRES}, {_i = _i + 2}] do
{
	_label = _arrayRES select (_i);
	_count = _arrayRES select (_i + 1);
	aCount_textRES = aCount_textRES + _label + ": " + str(_count) + " Rounds" + "<br/>";
};

for [{ _i = 0}, {_i < count _arrayCIV}, {_i = _i + 2}] do
{
	_label = _arrayCIV select (_i);
	_count = _arrayCIV select (_i + 1);
	aCount_textCIV = aCount_textCIV + _label + ": " + str(_count) + " Rounds" + "<br/>";
};

