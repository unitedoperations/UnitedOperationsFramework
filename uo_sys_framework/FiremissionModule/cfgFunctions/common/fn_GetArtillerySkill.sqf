#include "..\..\Global\defs.hpp"
_unit = _this select 0;
        skills = [];
        skills pushBack (_unit getVariable [QEGVAR(Firemission,ArtFireRate),MEANFIRERATE]);
        skills pushBack (_unit getVariable [QEGVAR(Firemission,ArtAccuracy),MEANPlOTTEDACCURACY]);
        skills pushBack (_unit getVariable [QEGVAR(Firemission,ArtSpotAccuracy),MEANSPOTTINGACCURACY]);
        skills pushBack (_unit getVariable [QEGVAR(Firemission,ArtAimSpeed),MEANAIMTIME]);
        skills pushBack (_unit getVariable [QEGVAR(Firemission,ArtCalcSpeed),MEANCALCULATIONTIME]);
        skills pushBack (_unit getVariable [QEGVAR(Firemission,ArtCustomName),""]);
        skills