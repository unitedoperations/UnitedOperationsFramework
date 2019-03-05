#define COMPONENT CaptureZone
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_3DEN_CHECK;

LOG("CaptueZoneAttribute Load started");

_this params ["_this", "_config"];

private _control = (_this controlsGroupCtrl 100);
MSETVAR(_control,parentcontrolcfg,_config);
private _attProperty = getText (_config >> "property");
diag_log format ["attributeLoad started, _value: %1",_value];
MSETMVAR(_attProperty,_value);
lbClear _control;
private _indexNone = _control lbadd "None";
_control lbsetdata [_indexNone,"NONE"];
_control lbsetValue [_indexNone,0];
if ((_value isEqualto "NONE") || (_value isEqualTo "")) then {
    _control lbSetCurSel _indexNone;
    MSETMVAR(_attProperty,"NONE");
};

{
	private _colour = getArray (_x >> "color") call BIS_fnc_colorConfigToRGBA;
	private _colourName = configName _x;
    private _index = _control lbadd _colourName;
    _control lbsetdata [_index,_colourName];
    _control lbsetValue [_index,_forEachIndex];
    _control lbsetpicture [_index,'#(argb,8,8,3)color(1,1,1,1)'];\
    _control lbsetpicturecolor [_index,_colour];\
    _control lbsetpicturecolorselected [_index,_colour];\
    if (_value isEqualto _colourName) then {
        _control lbSetCurSel _index;
        SETMVAR(_attProperty,_value);
    };
} forEach configProperties [configFile >> "CfgMarkerColors"];
