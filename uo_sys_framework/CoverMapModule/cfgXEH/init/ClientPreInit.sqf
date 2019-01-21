#define COMPONENT CoverMap
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
    if (!UO_FW_Server_CoverMapModule_Allowed) exitWith {};
    if (!UO_FW_CoverMap_Enable) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Cover Map", "Covers map except specified area, allows switching between multiple AOs", "Blackhawk and PIZZADOX"]] call CBA_fnc_globalEvent;
    [{(!isNull player)}, {
        private ["_DefaultAO"];
        if !((UO_FW_GETPLVAR(CoverMap_UnitDefaultAO,[])) isEqualto "") then {
            _DefaultAO = UO_FW_GETPLVAR(CoverMap_UnitDefaultAO,[]);
            if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
                ERROR_2("Default CoverMap for unit: %1 area: %1 does not exist!",player,_DefaultAO);
            };
        } else {
            switch (side player) do {
                case west: {
                    _DefaultAO = (UO_FW_GETMVAR(CoverMap_DefaultAO_West,""));
                    if (_DefaultAO isEqualto "") exitwith {
                        ERROR("No Default BLUFOR Area defined for CoverMap!");
                    };
                    if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
                        ERROR_1("Default CoverMap BLUFOR area: %1 does not exist!",_DefaultAO);
                    };
                };
                case east: {
                    _DefaultAO = (UO_FW_GETMVAR(CoverMap_DefaultAO_East,""));
                    if (_DefaultAO isEqualto "") exitwith {
                        ERROR("No Default OPFOR Area defined for CoverMap!");
                    };
                    if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
                        ERROR_1("Default CoverMap OPFOR area: %1 does not exist!",_DefaultAO);
                    };
                };
                case resistance: {
                    _DefaultAO = (UO_FW_GETMVAR(CoverMap_DefaultAO_Indfor,""));
                    if (_DefaultAO isEqualto "") exitwith {
                        ERROR("No Default INDFOR Area defined for CoverMap!");
                    };
                    if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
                        ERROR_1("Default CoverMap INDFOR area: %1 does not exist!",_DefaultAO);
                    };
                };
                case civilian: {
                    _DefaultAO = (UO_FW_GETMVAR(UO_FW_CoverMap_DefaultAO_Civ,""));
                    if (_DefaultAO isEqualto "") exitwith {
                        ERROR("No Default Civilian Area defined for CoverMap!");
                    };
                    if ((UO_FW_CoverMap_AO_Array findif {_DefaultAO isEqualto (_x select 0)}) isEqualto -1) exitwith {
                        ERROR_1("Default CoverMap Civilian area: %1 does not exist!",_DefaultAO);
                    };
                };
                default {};
            };
        };

        UO_FW_CoverMap_currentAO = _DefaultAO;
        [_DefaultAO] call UO_FW_fnc_CoverMapBriefing;

        [{(visibleMap)},{
            _this call UO_FW_fnc_CoverMapLive;
        },_DefaultAO] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_waitUntilAndExecute;

    [{((!isNull player) && {CBA_missionTime > 1})}, {
        if (UO_FW_GETMVAR(CoverMap_AllowSwitching,false)) then {
            if !((UO_FW_GETPLVAR(CoverMap_UnitAONameArray,[])) isEqualto []) then {
                private _MapChangeMenu = ["MapChangeMenu", "Switch Map", "", {}, {true}] call ace_interact_menu_fnc_createAction;
                [player, 1, ["ACE_SelfActions","ACE_Equipment"], _MapChangeMenu] call ace_interact_menu_fnc_addActionToObject;
                private ["_ActionArray"];
                if (isNil "_ActionArray") then {
                    _ActionArray = [];
                };
                {
                    private _AONameAllowed = _x;
                    {
                        _x params ["_AOName"];
                        if ((_AONameAllowed isEqualto _AOName) && {!(_AONameAllowed in _ActionArray)}) then {
                            private _condition = {
                                params ["", "", "_params"];
                                (visibleMap) && !(UO_FW_CoverMap_currentAO isEqualto (_params select 0)) && (UO_FW_GETMVAR(CoverMap_AllowSwitching,false))
                            };
                            private _statement = {
                                params ["", "", "_params"];
                                [(_params select 0)] call UO_FW_fnc_CoverMapLive;
                            };
                            private _tempAction = ["switch_MapAO", ("Switch Map to " + _AONameAllowed), "", _statement, _condition, {}, [_AONameAllowed]] call ace_interact_menu_fnc_createAction;
                            [player, 1, ["ACE_SelfActions","ACE_Equipment","MapChangeMenu"], _tempAction] call ace_interact_menu_fnc_addActionToObject;
                            _ActionArray pushback _AONameAllowed;
                            LOG_1("CoverMap action added for area: %1",_AONameAllowed);
                        };
                    } foreach UO_FW_CoverMap_AO_Array;
                } foreach (UO_FW_GETPLVAR(CoverMap_UnitAONameArray,[]));
            };
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
