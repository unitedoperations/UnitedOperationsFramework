/*
	Author: Bohemia Interactive, edited by Revo

	Description:
	Saves the values of the combo box when pressing OK. Additionally a 3DEN history is created

	Parameter(s):
	-
	Returns:
	_value
*/

private _ctrl = param [0,controlNull,[controlNull]];
private _config = param [1,configNull,[configNull]];

_ctrl lbData lbCurSel _ctrl;
