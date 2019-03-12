#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENTHC);

[QEGVAR(Core,SettingsLoaded),{
    if (MGETPLVAR(ArtilleryFOPlayerEnabled,false)) then {
        ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
        private _guns = [];
        {
            private _tempUnit = missionNamespace getVariable [_x,objNull];
            if (isNull _tempUnit) then {
                LOG_1("Firemission module:<br></br>Warning Unit ""%1"" does not exist.", _x);
            };
            _guns pushBackUnique _tempUnit;
        } forEach (MGETPLVAR(ArtilleryFOPlayerGuns,[]));
        private _allowBracket = MGETPLVAR(ArtilleryFOPlayerAllowBracketFiremission,false);
        private _allowDonut = MGETPLVAR(ArtilleryFOPlayerAllowDonutFiremission,false);
        private _allowGridSpotting = MGETPLVAR(ArtilleryFOPlayerAllowGridspottingFiremission,false);
        private _allowLine = MGETPLVAR(ArtilleryFOPlayerAllowLineFiremission,false);
        private _allowMarker = MGETPLVAR(ArtilleryFOPlayerAllowMarkerFiremission,false);
        private _allowPoint = MGETPLVAR(ArtilleryFOPlayerAllowPointFiremission,false);
        private _allowPolar = MGETPLVAR(ArtilleryFOPlayerAllowPolarFiremission,false);
        private _allowPolarspotting = MGETPLVAR(ArtilleryFOPlayerAllowPolarspottingFiremission,false);
        [_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call UO_FW_fnc_initPlayerFO;
    };
}] call CBA_fnc_addEventHandler;
