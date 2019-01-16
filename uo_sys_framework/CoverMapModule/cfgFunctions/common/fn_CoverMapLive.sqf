#define COMPONENT CoverMap
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);
//Covers Map outside marker and centers map on marker center in game map
if (!hasinterface) exitwith {};
//params ["_area",["_centered",true],["_zoomlevel",0.4],"_name",["_AOName",1]];
params ["_AONameCalled"];
private ["_areaCalled","_zoomlevelCalled","_found","_index"];

private _found = false;
{
	_x params ["_AOName","_area","_AOZoom","_logic"];
	if (_AONameCalled isEqualto _AOName) then {
		_areaCalled = _area;
		_logicCalled = _logic;
		_zoomlevelCalled = _AOZoom;
		_index = _forEachIndex;
		_found = true;
	};
} foreach UO_FW_CoverMap_AO_Array;

if !(_found) exitwith {
	ERROR_1("Live CoverMap area: %1 not found in array!",_AONameCalled);
};

if (isNil "UO_FW_CoverMap_MarkerArray") then {
	UO_FW_CoverMap_MarkerArray = [];
} else {
	{deletemarker _x;} foreach UO_FW_CoverMap_MarkerArray;
	UO_FW_CoverMap_MarkerArray = [];
};
//for self interact options and logging
UO_FW_CoverMap_currentAO = _AONameCalled;

_areaCalled params ["_pos","_radiusX","_radiusY","_dir"];
private ["_radiusXo","_radiusYo","_mainS","_mainBS"];

_pos params ["_posx","_posy"];
_radiusXo = _radiusX;
_radiusYo = _radiusY;
_mainS = 20000;
_mainBS = 50;

if ((_dir > 0 && _dir <= 90) || (_dir > 180 && _dir <= 270)) then {
	private _temp = _radiusX;
	_radiusX = _radiusY;
	_radiusY = _temp;
};

private _colorForest = "colorKhaki";
private _colors = ["colorBlack","colorBlack",_colorForest,"colorGreen",_colorForest,/**/"colorBlack"/**/,_colorForest,_colorForest];

{
	_x params ["_dir"];
	private _i = _forEachIndex;

	_dir = _dir mod 360;
	if (_dir < 0) then {_dir = _dir + 360};

	private _s = _radiusX;
	private _w = 2 * _mainS +_radiusY;
	private _bw = _radiusY + _mainBS;
	if !((_dir > 0 && _dir <= 90) || (_dir > 180 && _dir <= 270)) then {
		_s = _radiusY;
		_w = _radiusX + 2 * _mainBS;
		_bw = _radiusX + _mainBS;
	};
	private _posos_x = _posx + (sin _dir) * (_mainS + _s + _mainBS);
	private _posos_y = _posy + (cos _dir) * (_mainS + _s + _mainBS);

	{
		_x params ["_color"];

		private _markername1 = format ["UO_FW_CoverMap_Marker_C_%1_%2",_i,_forEachIndex];
		private _marker1 = createMarkerLocal [_markername1,[_posos_x, _posos_y]];
		UO_FW_CoverMap_MarkerArray pushBack _marker1;

		_marker1 setMarkerSizeLocal [_w,_mainS];
		_marker1 setMarkerDirLocal _dir;
		_marker1 setMarkerShapeLocal "rectangle";
		_marker1 setMarkerBrushLocal "solid";
		_marker1 setMarkerColorLocal _color;

		if (_forEachIndex isEqualto 5) then {
			_marker1 setMarkerBrushLocal "grid";
		};

	} forEach _colors;

	private _posos_x = _posx + (sin _dir) * (_mainBS / 2 + _s);
	private _posos_y = _posy + (cos _dir) * (_mainBS / 2 + _s);

	for "_m" from 0 to 7 do {
		private _markername2 = format ["UO_FW_CoverMap_Marker_W_%1_%2",_i,_m];
		private _marker2 = createMarkerLocal [_markername2,[_posos_x, _posos_y]];
		UO_FW_CoverMap_MarkerArray pushBack _marker2;

		_marker2 setMarkerSizeLocal [_bw, _mainBS / 2];
		_marker2 setMarkerDirLocal _dir;
		_marker2 setMarkerShapeLocal "rectangle";
		_marker2 setMarkerBrushLocal "solid";
		_marker2 setMarkerColorLocal "colorwhite";

	};

} forEach [_dir, (_dir + 90), (_dir + 180), (_dir + 270)];

private _markername3 = format ["UO_FW_CoverMap_Marker_b1_%1",_index];
private _marker3 = createMarkerLocal [_markername3,[_posx, _posy]];
UO_FW_CoverMap_MarkerArray pushBack _marker3;

_marker3 setMarkerSizeLocal [_radiusXo, _radiusYo];
_marker3 setMarkerDirLocal _dir;
_marker3 setMarkerShapeLocal "rectangle";
_marker3 setMarkerBrushLocal "border";
_marker3 setMarkerColorLocal "colorBlack";

private _markername4 = format ["UO_FW_CoverMap_Marker_b2_%1",_index];
private _marker4 = createMarkerLocal [_markername4,[_posx, _posy]];
UO_FW_CoverMap_MarkerArray pushBack _marker4;

_marker4 setMarkerSizeLocal [_radiusXo+_mainBS, _radiusYo+_mainBS];
_marker4 setMarkerDirLocal _dir;
_marker4 setMarkerShapeLocal "rectangle";
_marker4 setMarkerBrushLocal "border";
_marker4 setMarkerColorLocal "colorBlack";

[{(visibleMap)},{
	params ["_zoomlevel","_p"];
	MapAnimAdd [0, _zoomlevel, _p];
	MapAnimCommit;
},[_zoomlevelCalled,_pos]] call CBA_fnc_waitUntilAndExecute;
