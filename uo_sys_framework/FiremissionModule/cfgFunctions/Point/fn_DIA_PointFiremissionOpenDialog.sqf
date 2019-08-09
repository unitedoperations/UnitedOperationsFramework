#include "..\..\Global\defs.hpp"
_ok = createDialog QEGVAR(Firemission,DIA_PointFiremission);
    [PFM_DIA_IDC_GUNSELECT,PFM_DIA_IDC_SHELLSELECT] call EFUNC(Firemission,ArtLoadAviableArtilleries);
