/*	Description: Gets Magazine Displayname for Ammo Count
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		TinfoilHate
 */

private["_className","_displayName","_foundClass","_ret"];
_className = _this;
_ret = "Error";
_foundClass = aCount_classNames find _className;
if (_foundClass < 0) then {
	_cfg = (configFile >> "CfgMagazines" >> _className);
	_ret = 	getText(_cfg >> "displayName");
	aCount_classNames pushBack _className;
	aCount_classNames pushBack _ret;
} else {
	_ret = aCount_classNames select( _foundClass + 1);
};

_ret