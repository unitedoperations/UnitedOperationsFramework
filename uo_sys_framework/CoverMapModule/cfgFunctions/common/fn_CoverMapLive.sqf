#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)
//Covers Map outside marker and centers map on marker center in game map
if (!hasinterface) exitwith {};
//params ["_area",["_centered",true],["_zoomlevel",0.4],"_name",["_AOName",1]];
params ["_AONameCalled"];
private ["_areaCalled","_zoomlevelCalled","_found","_index"];
diag_log format ["Covermap array _this: %1",_this];

private _found = false;
{
	_x params ["_AOName","_area","_AOZoom"];
	if (_AONameCalled isEqualto _AOName) exitwith {
		_areaCalled = _area;
		_zoomlevelCalled = _AOZoom;
		_found = true;
		_index = _forEachIndex;
	};
} foreach UO_FW_CoverMap_AO_Array;

if !(_found) exitwith {
	private _msg = format ["Live CoverMap area: %1 not found in array!",_AONameCalled];
	UO_FW_DEBUG("",_msg)
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

private _posx = _pos select 0;
private _posy = _pos select 1;
private _radiusXo = _radiusX;
private _radiusYo = _radiusY;
private _mainS = 20000;
private _mainBS = 50;

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
	_posos_x = _posx + (sin _dir) * (_mainS + _s + _mainBS);
	_posos_y = _posy + (cos _dir) * (_mainS + _s + _mainBS);

	{
		_x params ["_color"];

		private _markername1 = format ["UO_FW_CoverMap_Marker_%1_%2",_i,_forEachIndex];
		private _marker1 = createMarkerLocal [_markername1,[_posos_x, _posos_y]];
		MissionNamespace setvariable [_markername1,_marker1];

		(MissionNamespace getvariable _markername1) setMarkerSizeLocal [_w,_mainS];
		(MissionNamespace getvariable _markername1) setMarkerDirLocal _dir;
		(MissionNamespace getvariable _markername1) setMarkerShapeLocal "rectangle";
		(MissionNamespace getvariable _markername1) setMarkerBrushLocal "solid";
		(MissionNamespace getvariable _markername1) setMarkerColorLocal _color;

		if (_forEachIndex isEqualto 5) then {
			(MissionNamespace getvariable _markername1) setMarkerBrushLocal "grid";
		};
		UO_FW_CoverMap_MarkerArray pushBack (MissionNamespace getvariable _markername1);

	} forEach _colors;

} forEach [_dir, (_dir + 90), (_dir + 180), (_dir + 270)];

{
	private _i = _forEachIndex;
	private _posos_x = _posx + (sin _dir) * (_mainBS / 2 + _s);
	private _posos_y = _posy + (cos _dir) * (_mainBS / 2 + _s);

	for [{_m = 0;},{(_m < 8)},{_m = _m + 1;}] do {
		private _markername2 = format ["UO_FW_CoverMap_Marker_%1_%2",_i,_m];
		private _marker2 = createMarkerLocal [_markername2,[_posos_x, _posos_y]];
		MissionNamespace setvariable [_markername2,_marker2];

		(MissionNamespace getvariable _markername2) setMarkerSizeLocal [_bw, _mainBS / 2];
		(MissionNamespace getvariable _markername2) setMarkerDirLocal _dir;
		(MissionNamespace getvariable _markername2) setMarkerShapeLocal "rectangle";
		(MissionNamespace getvariable _markername2) setMarkerBrushLocal "solid";
		(MissionNamespace getvariable _markername2) setMarkerColorLocal "colorwhite";
		UO_FW_CoverMap_MarkerArray pushBack (MissionNamespace getvariable _markername2);
	};
} forEach [_dir, (_dir + 90), (_dir + 180), (_dir + 270)];

private _markername3 = format ["UO_FW_CoverMap_Marker_b1_%1",_index];
private _marker3 = createMarkerLocal [_markername3,[_posx, _posy]];
MissionNamespace setvariable [_markername3,_marker3];

(MissionNamespace getvariable _markername3) setMarkerSizeLocal [_radiusXo, _radiusYo];
(MissionNamespace getvariable _markername3) setMarkerDirLocal _dir;
(MissionNamespace getvariable _markername3) setMarkerShapeLocal "rectangle";
(MissionNamespace getvariable _markername3) setMarkerBrushLocal "border";
(MissionNamespace getvariable _markername3) setMarkerColorLocal "colorBlack";
UO_FW_CoverMap_MarkerArray pushBack (MissionNamespace getvariable _markername3);

private _markername4 = format ["UO_FW_CoverMap_Marker_b2_%1",_index];
private _marker4 = createMarkerLocal [_markername4,[_posx, _posy]];
MissionNamespace setvariable [_markername4,_marker4];

(MissionNamespace getvariable _markername4) setMarkerSizeLocal [_radiusXo+_mainBS, _radiusYo+_mainBS];
(MissionNamespace getvariable _markername4) setMarkerDirLocal _dir;
(MissionNamespace getvariable _markername4) setMarkerShapeLocal "rectangle";
(MissionNamespace getvariable _markername4) setMarkerBrushLocal "border";
(MissionNamespace getvariable _markername4) setMarkerColorLocal "colorBlack";
UO_FW_CoverMap_MarkerArray pushBack (MissionNamespace getvariable _markername4);

diag_log format ["Covermap UO_FW_CoverMap_MarkerArray: %1",UO_FW_CoverMap_MarkerArray];

[_zoomlevelCalled,_pos] spawn {
	params ["_zoomlevel","_p"];
	//waitUntil{visibleMap};
	MapAnimAdd [0, _zoomlevel, _p];
	MapAnimCommit;
	waitUntil{mapAnimDone};
};
