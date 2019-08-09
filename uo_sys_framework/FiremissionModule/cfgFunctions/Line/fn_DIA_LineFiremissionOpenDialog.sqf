#include "..\..\Global\defs.hpp"
_ok = createDialog QEGVAR(Firemission,DIA_LineFiremission);
    [LFM_DIA_IDC_GUNSELECT,LFM_DIA_IDC_SHELLSELECT] call EFUNC(Firemission,ArtLoadAviableArtilleries);
