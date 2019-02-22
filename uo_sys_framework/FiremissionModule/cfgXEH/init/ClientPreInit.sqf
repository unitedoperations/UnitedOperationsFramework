#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENTHC);

["UO_FW_SettingsLoaded",{
    if (GETPLVAR(ArtilleryFOPlayerEnabled,false)) then {
        ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
        private _guns = [];
        {
            private _tempUnit = missionNamespace getVariable [_x,objNull];
            if (isNull _tempUnit) then {
                LOG_1("Firemission module:<br></br>Warning Unit ""%1"" does not exist.", _x);
            };
            _guns pushBackUnique _tempUnit;
        } forEach (GETPLVAR(ArtilleryFOPlayerGuns,[]));
        private _allowBracket = GETPLVAR(ArtilleryFOPlayerAllowBracketFiremission,false);
        private _allowDonut = GETPLVAR(ArtilleryFOPlayerAllowDonutFiremission,false);
        private _allowGridSpotting = GETPLVAR(ArtilleryFOPlayerAllowGridspottingFiremission,false);
        private _allowLine = GETPLVAR(ArtilleryFOPlayerAllowLineFiremission,false);
        private _allowMarker = GETPLVAR(ArtilleryFOPlayerAllowMarkerFiremission,false);
        private _allowPoint = GETPLVAR(ArtilleryFOPlayerAllowPointFiremission,false);
        private _allowPolar = GETPLVAR(ArtilleryFOPlayerAllowPolarFiremission,false);
        private _allowPolarspotting = GETPLVAR(ArtilleryFOPlayerAllowPolarspottingFiremission,false);
        [_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call UO_FW_fnc_initPlayerFO;
    };
}] call CBA_fnc_addEventHandler;
