#include "..\..\Global\defs.hpp"
    private _unit  = _this select 0;
        private _ret = [];
        _ret pushBack (_unit getVariable [QEGVAR(Firemission,ObsAccuracy),OBSACCURACY]);
        _ret pushBack (_unit getVariable [QEGVAR(Firemission,ObsSpeed),OBSSPEED]);
        _ret