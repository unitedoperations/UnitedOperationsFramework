#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);

[QEGVAR(Core,SettingsLoaded),{
    if (GETPLVAR(ArtilleryFOPlayerEnabled,false)) then {
        ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
        private _guns = [];
        {
            private _tempUnit = missionNamespace getVariable [_x,objNull];
            if (isNull _tempUnit) then {
                FWDEBUG("Firemission module:<br></br>Warning Unit " +(str _x) +" does not exist.","Firemission module:<br></br>Warning Unit " +(str _x) +" does not exist.");
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
        [_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call EFUNC(Firemission,initPlayerFO);
    };
}] call CBA_fnc_addEventHandler;
