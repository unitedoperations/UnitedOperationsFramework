#include "..\..\Global\defs.hpp"
    private _unit = _this;
    private _text = _unit getVariable [QEGVAR(Firemission,ArtCustomName),""];
    if (_text == "") then { _text = getText (configfile / "CfgVehicles" /  typeOf(_unit) / "displayName") };
    _text