#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENTHC);

["UO_FW_SettingsLoaded",{
    if (GETPLVARUO(ArtilleryFOPlayerEnabled,false)) then {
        ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
        private _guns = [];
        {
            private _tempUnit = missionNamespace getVariable [_x,objNull];
            if (isNull _tempUnit) then {
                LOG_1("Firemission module:<br></br>Warning Unit ""%1"" does not exist.", _x);
            };
            _guns pushBackUnique _tempUnit;
        } forEach (GETPLVARUO(ArtilleryFOPlayerGuns,[]));
        private _allowBracket = GETPLVARUO(ArtilleryFOPlayerAllowBracketFiremission,false);
        private _allowDonut = GETPLVARUO(ArtilleryFOPlayerAllowDonutFiremission,false);
        private _allowGridSpotting = GETPLVARUO(ArtilleryFOPlayerAllowGridspottingFiremission,false);
        private _allowLine = GETPLVARUO(ArtilleryFOPlayerAllowLineFiremission,false);
        private _allowMarker = GETPLVARUO(ArtilleryFOPlayerAllowMarkerFiremission,false);
        private _allowPoint = GETPLVARUO(ArtilleryFOPlayerAllowPointFiremission,false);
        private _allowPolar = GETPLVARUO(ArtilleryFOPlayerAllowPolarFiremission,false);
        private _allowPolarspotting = GETPLVARUO(ArtilleryFOPlayerAllowPolarspottingFiremission,false);
        [_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call UO_FW_fnc_initPlayerFO;
    };
}] call CBA_fnc_addEventHandler;
