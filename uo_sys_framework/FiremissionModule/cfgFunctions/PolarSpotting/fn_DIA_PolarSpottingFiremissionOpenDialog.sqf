#include "..\..\Global\defs.hpp"
    _ok = createDialog QEGVAR(Firemission,DIA_PolarSpottingFiremission);
    [PSFM_DIA_IDC_GUNSELECT,PSFM_DIA_IDC_SHELLSELECT] call EFUNC(Firemission,ArtLoadAviableArtilleries);
