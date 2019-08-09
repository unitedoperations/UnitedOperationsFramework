#include "..\..\Global\defs.hpp"
_ok = createDialog QEGVAR(Firemission,DIA_GridSpottingFiremission);
    [GSFM_DIA_IDC_GUNSELECT,GSFM_DIA_IDC_SHELLSELECT] call EFUNC(Firemission,ArtLoadAviableArtilleries);
