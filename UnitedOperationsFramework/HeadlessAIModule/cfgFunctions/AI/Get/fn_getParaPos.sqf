openmap true; 
["paradrop_location", "onMapSingleClick", { 
	ASORPara_Location = _pos;
	publicvariable 'ASORPara_Location';
	deleteMarker "LZ";
	deleteMarker "LZtext";
	_lztext = createMarker ["LZtext", _pos ];
	_lztext setMarkerText "LZ";
	_lztext setMarkerColor "ColorBlack";
	_lztext setMarkerType  "b_unknown";
	_lzmarker = createMarker ["LZ", _pos ];
	_lzmarker setMarkerShape "ELLIPSE";
	_lzmarker setMarkerSize [100, 100];
	_lzmarker setMarkerColor "ColorWEST";
	_lzmarker setMarkerAlpha 0.5;
	openMap false; 
	["paradrop_location", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
}] call BIS_fnc_addStackedEventHandler;