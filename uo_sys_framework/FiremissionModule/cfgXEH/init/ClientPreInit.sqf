#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENTHC);

["UO_FW_SettingsLoaded",{
	if (UO_FW_GETPLVAR(ArtilleryFOPlayerEnabled,false)) then 
	{
		["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
		private	_guns = [];
		{
			private	_tempUnit = missionNamespace getVariable [_x,objNull];
			if (isNull _tempUnit) then {
				LOG_1("Firemission module:<br></br>Warning Unit ""%1"" does not exist.", _x);
			};
			_guns pushBackUnique _tempUnit;
		} forEach (UO_FW_GETPLVAR(ArtilleryFOPlayerGuns,[]));
		private	_allowBracket = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowBracketFiremission,false);
		private	_allowDonut = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowDonutFiremission,false);
		private	_allowGridSpotting = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowGridspottingFiremission,false);
		private	_allowLine = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowLineFiremission,false);
		private	_allowMarker = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowMarkerFiremission,false);
		private	_allowPoint = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowPointFiremission,false);
		private	_allowPolar = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowPolarFiremission,false);
		private	_allowPolarspotting = UO_FW_GETPLVAR(ArtilleryFOPlayerAllowPolarspottingFiremission,false);
		[_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call UO_FW_fnc_initPlayerFO;
	};
}] call CBA_fnc_addEventHandler;
