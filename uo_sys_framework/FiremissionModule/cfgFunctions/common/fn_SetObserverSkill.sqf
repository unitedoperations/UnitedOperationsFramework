#include "..\..\Global\defs.hpp"
private _unit  = _this select 0;
private _accuracy = _this select 1;
private _speed = _this select 2;
_unit setVariable [QEGVAR(Firemission,ObsAccuracy),_accuracy];
_unit setVariable [QEGVAR(Firemission,ObsSpeed),_speed];