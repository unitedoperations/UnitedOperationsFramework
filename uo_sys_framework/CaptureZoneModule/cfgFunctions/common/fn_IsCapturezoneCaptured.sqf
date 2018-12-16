
private ["_return"];
if(markerType _this == "") then
{
	["Capturezone " + (str _this) + "does not exist!",""] call UO_FW_fnc_DebugMessageDetailed;
};
if (isNil "CZMARKERCOLLECTION") then { CZMARKERCOLLECTION = []; };
_return = "NONE";
{
	if( _this == _x select 1 && (_x select 2)) then
	{

		_return = _x select 0;
		if(_return == "GUER") then
		{
			_return = "RESISTANCE";
		};
	}
}forEach CZMARKERCOLLECTION;

_return
