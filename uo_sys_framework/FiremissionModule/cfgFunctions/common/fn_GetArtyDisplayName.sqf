#include "..\..\Global\defs.hpp"
    private _unit = _this;
    private _text = _unit getVariable [VAR_SART_ARTCustomNAME,""];
    if (_text == "") then { _text = getText (configfile / "CfgVehicles" /  typeOf(_unit) / "displayName") };
    _text