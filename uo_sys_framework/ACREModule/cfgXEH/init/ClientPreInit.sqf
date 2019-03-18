/*    Description: Sets ACRE Presets and ACRE unit settings
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        PiZZADOX & Sacher
 */

#define COMPONENT ACRE
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);
if !(UO_FW_Server_ACREModule_Allowed) exitwith {};

#define RADIONETARRAY(TEAMNAME) \
[(GETMVAR(RADIONET_NAME1##TEAMNAME,"")),(GETMVAR(RADIONET_NAME2##TEAMNAME,"")),(GETMVAR(RADIONET_NAME3##TEAMNAME,"")),(GETMVAR(RADIONET_NAME4##TEAMNAME,"")),(GETMVAR(RADIONET_NAME5##TEAMNAME,"")),(GETMVAR(RADIONET_NAME6##TEAMNAME,"")),(GETMVAR(RADIONET_NAME7##TEAMNAME,""))]

[QGVAR(Init_Event), {
    if !(GETMVAR(Enabled,false)) exitwith {};
    if (!isDedicated && {hasinterface}) then {
        [QEGVAR(Core,RegisterModuleEvent), ["ACRE Setup", "Module for ACRE Settings", "PiZZADOX and Sacher"]] call CBA_fnc_localEvent;
        GVAR(Preset) = ["default2", "default3", "default4", "default"];
        GVAR(Preset_BLUFOR) = "default";
        GVAR(Preset_OPFOR) = "default";
        GVAR(Preset_Indfor) = "default";
        GVAR(Preset_Civ) = "default";
        if (GETMVAR(SCRAMBLE_Enabled,false)) then {
            GVAR(Preset_BLUFOR) = GVAR(Preset) select 0;
            GVAR(Preset_OPFOR) = GVAR(Preset) select 1;
            GVAR(Preset_Indfor) = GVAR(Preset) select 2;
            GVAR(Preset_Civ) = GVAR(Preset) select 3;
        };
        //Channel names stuff
        LOG("ACRE Init");
        if ((GETMVAR(RADIONET_Enabled_BLUFOR,false)) && {(side player isEqualTo west)}) then {
            {
                private _index = _forEachIndex + 1;
                _x params ["_name"];
                if (_name != "") then {
                    {
                        private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
                        [_x, GVAR(Preset_BLUFOR), _index, _label, _name] call acre_api_fnc_setPresetChannelField;
                    } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
                };
            } foreach RADIONETARRAY(BLUFOR);
        };
        if ((GETMVAR(RADIONET_Enabled_OPFOR,false)) && {(side player isEqualTo east)}) then {
            {
                private _index = _forEachIndex + 1;
                _x params ["_name"];
                if (_name != "") then {
                    {
                        private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
                        [_x, GVAR(Preset_OPFOR), _index, _label, _name] call acre_api_fnc_setPresetChannelField;
                    } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
                };
            } foreach RADIONETARRAY(OPFOR);
        };
        if ((GETMVAR(RADIONET_Enabled_Indfor,false)) && {(side player isEqualTo independent)}) then {
            {
                private _index = _forEachIndex + 1;
                _x params ["_name"];
                if (_name != "") then {
                    {
                        private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
                        [_x, GVAR(Preset_Indfor), _index, _label, _name] call acre_api_fnc_setPresetChannelField;
                    } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
                };
            } foreach RADIONETARRAY(INDEPENDENT);
        };
        if ((GETMVAR(RADIONET_Enabled_Civ,false)) && {(side player isEqualTo civilian)}) then {
            {
                private _index = _forEachIndex + 1;
                _x params ["_name"];
                if (_name != "") then {
                    {
                        private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
                        [_x, GVAR(Preset_Civ), _index, _label, _name] call acre_api_fnc_setPresetChannelField;
                    } forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
                };
            } foreach RADIONETARRAY(CIVILIAN);
        };

        if (GETMVAR(RADIONET_Enabled_BLUFOR,false)) then {
            LOG_1("Setting Netnames. Blu: %1",(RADIONETARRAY(BLUFOR)));
        };
        if (GETMVAR(RADIONET_Enabled_OPFOR,false)) then {
            LOG_1("Setting Netnames. Opf: %1",(RADIONETARRAY(OPFOR)));
        };
        if (GETMVAR(RADIONET_Enabled_INDEPENDENT,false)) then {
            LOG_1("Setting Netnames. Ind: %1",(RADIONETARRAY(INDEPENDENT)));
        };
        if (GETMVAR(RADIONET_Enabled_Civ,false)) then {
            LOG_1("Setting Netnames. Civ: %1",(RADIONETARRAY(CIVILIAN)));
        };

        [{(!isNull player) && {(!isNull acre_player)} && {([] call acre_api_fnc_isInitialized)}},{
            private _side = side player;
            private _customSide = (GETPLVAR(CustomScramble,nil));
            GVAR(Volume_Value) = -1;
            if (!isNil QGVAR(Volume_Value)) then {
                if ((abs GVAR(Volume_Value)) > 2) then {
                GVAR(Volume_Value) = 0;
                };
                private _v = 0.7;
                switch (GVAR(Volume_Value)) do {
                    case -2: {_v = 0.1;};
                    case -1: {_v = 0.2;};
                    case 0: {_v = 0.4;};
                    case 1: {_v = 0.7;};
                    case 2: {_v = 1.0;};
                    default {_v = 0.4;};
                };
                [_v] call acre_api_fnc_setSelectableVoiceCurve;

                [{(!isNil "acre_sys_gui_VolumeControl_Level")}, {
                    acre_sys_gui_VolumeControl_Level = GVAR(Volume_Value);
                }] call CBA_fnc_waitUntilAndExecute;
            };
            if (!isNil "_customSide") then {
                _side = _customSide;
            };
            private _presetTemp = "default";
            switch (_side) do {
                case west: {
                    _presetTemp = GVAR(Preset_BLUFOR);
                };
                case east: {
                    _presetTemp = GVAR(Preset_OPFOR);
                };
                case independent: {
                    _presetTemp = GVAR(Preset_Indfor);
                };
                default {
                    _presetTemp = GVAR(Preset_Civ);
                };
            };

            if (GETMVAR(SCRAMBLE_Enabled,false)) then {
                LOG_1("Enabling ACRE Scramble with %1",_presetTemp);
                ["ACRE_PRC343", _presetTemp ] call acre_api_fnc_setPreset;
                ["ACRE_PRC77", _presetTemp ] call acre_api_fnc_setPreset;
                ["ACRE_PRC117F", _presetTemp ] call acre_api_fnc_setPreset;
                ["ACRE_PRC152", _presetTemp ] call acre_api_fnc_setPreset;
                ["ACRE_PRC148", _presetTemp ] call acre_api_fnc_setPreset;
                ["ACRE_SEM52SL", _presetTemp ] call acre_api_fnc_setPreset;
                ["ACRE_SEM70", _presetTemp ] call acre_api_fnc_setPreset;
            };


            //BABBLE STUFF
            if (GETMVAR(BABEL_Enabled,false)) then {
                LOG("Enabling Babel");
                private _CURRENTBABEL_LANGUAGES = [
                    ["en", "English"],
                    ["ru", "Russian"],
                    ["fr", "French"],
                    ["ar", "Arabic"],
                    ["gk", "Greek"]
                ];
                private _names = [
                    QGVAR(Babel_Custom_BLUFOR),QGVAR(Babel_Custom2_BLUFOR),
                    QGVAR(Babel_Custom_OPFOR),QGVAR(Babel_Custom2_OPFOR),
                    QGVAR(Babel_Custom_Indfor),QGVAR(Babel_Custom2_Indfor),
                    QGVAR(Babel_Custom_Civ),QGVAR(Babel_Custom2_Civ)
                ];
                {
                    private _index = _forEachIndex + 1;
                    _CURRENTBABEL_LANGUAGES pushBack ["cl" + (str _index),((missionNamespace getVariable [_x,""]))];
                } forEach _names;
                private _langInfo = format ["ACRE Babel Lanugages: %1",_CURRENTBABEL_LANGUAGES];
                LOG_1("%1",_langInfo);
                {_x call acre_api_fnc_babelAddLanguageType;} foreach _CURRENTBABEL_LANGUAGES;

                private _ACRE_BLUFOR_BABEL_LANGUAGES = [];
                if (GVAR(Babel_EN_BLUFOR)) then {_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "en"; };
                if (GVAR(Babel_RU_BLUFOR)) then {_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ru"; };
                if (GVAR(Babel_FR_BLUFOR)) then {_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "fr"; };
                if (GVAR(Babel_AR_BLUFOR)) then {_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ar"; };
                if (GVAR(Babel_GK_BLUFOR)) then {_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "gk"; };
                {
                    private _language = _x;
                    {
                        if ((_language select 1) isEqualTo (missionNamespace getVariable [_x,""]) && {(missionNamespace getVariable [_x,""]) != ""}) then {
                            _ACRE_BLUFOR_BABEL_LANGUAGES pushBack (_language select 0);
                        };
                    } forEach [QGVAR(Babel_Custom_BLUFOR),QGVAR(Babel_Custom2_BLUFOR)];
                } forEach _CURRENTBABEL_LANGUAGES;

                private _ACRE_OPFOR_BABEL_LANGUAGES = [];
                if (GVAR(Babel_EN_OPFOR)) then {_ACRE_OPFOR_BABEL_LANGUAGES pushBack "en"; };
                if (GVAR(Babel_RU_OPFOR)) then {_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ru"; };
                if (GVAR(Babel_FR_OPFOR)) then {_ACRE_OPFOR_BABEL_LANGUAGES pushBack "fr"; };
                if (GVAR(Babel_AR_OPFOR)) then {_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ar"; };
                if (GVAR(Babel_GK_OPFOR)) then {_ACRE_OPFOR_BABEL_LANGUAGES pushBack "gk"; };
                {
                    private _language = _x;
                    {
                        if ((_language select 1) isEqualTo (missionNamespace getVariable [_x,""]) && {(missionNamespace getVariable [_x,""]) != ""}) then {
                            _ACRE_OPFOR_BABEL_LANGUAGES pushBack (_language select 0);
                        };
                    } forEach [QGVAR(Babel_Custom_OPFOR),QGVAR(Babel_Custom2_OPFOR)];
                } forEach _CURRENTBABEL_LANGUAGES;

                private _ACRE_Indfor_BABEL_LANGUAGES = [];
                if (GVAR(Babel_EN_Indfor)) then {_ACRE_Indfor_BABEL_LANGUAGES pushBack "en"; };
                if (GVAR(Babel_RU_Indfor)) then {_ACRE_Indfor_BABEL_LANGUAGES pushBack "ru"; };
                if (GVAR(Babel_FR_Indfor)) then {_ACRE_Indfor_BABEL_LANGUAGES pushBack "fr"; };
                if (GVAR(Babel_AR_Indfor)) then {_ACRE_Indfor_BABEL_LANGUAGES pushBack "ar"; };
                if (GVAR(Babel_GK_Indfor)) then {_ACRE_Indfor_BABEL_LANGUAGES pushBack "gk"; };
                {
                    private _language = _x;
                    {
                        if ((_language select 1) isEqualTo (missionNamespace getVariable [_x,""]) && {(missionNamespace getVariable [_x,""]) != ""}) then {
                            _ACRE_Indfor_BABEL_LANGUAGES pushBack (_language select 0);
                        };
                    } forEach [QGVAR(Babel_Custom_Indfor),QGVAR(Babel_Custom2_Indfor)];
                } forEach _CURRENTBABEL_LANGUAGES;

                private _ACRE_Civ_BABEL_LANGUAGES = [];
                if (GVAR(Babel_EN_Civ)) then {_ACRE_Civ_BABEL_LANGUAGES pushBack "en"; };
                if (GVAR(Babel_RU_Civ)) then {_ACRE_Civ_BABEL_LANGUAGES pushBack "ru"; };
                if (GVAR(Babel_FR_Civ)) then {_ACRE_Civ_BABEL_LANGUAGES pushBack "fr"; };
                if (GVAR(Babel_AR_Civ)) then {_ACRE_Civ_BABEL_LANGUAGES pushBack "ar"; };
                if (GVAR(Babel_GK_Civ)) then {_ACRE_Civ_BABEL_LANGUAGES pushBack "gk"; };
                {
                    private _language = _x;
                    {
                        if ((_language select 1) isEqualTo (missionNamespace getVariable [_x,""]) && {(missionNamespace getVariable [_x,""]) != ""}) then {
                            _ACRE_Civ_BABEL_LANGUAGES pushBack (_language select 0);
                        };
                    } forEach [QGVAR(Babel_Custom_Civ),QGVAR(Babel_Custom2_Civ)];
                } forEach _CURRENTBABEL_LANGUAGES;


                if (GVAR(Babel_Enabled_BLUFOR) && {(side player isEqualTo west)}) then {
                    _ACRE_BLUFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
                    private _languages = GETPLVAR(Babel_Languages,[]);
                    if !(_languages isEqualTo []) then {
                        _languages call acre_api_fnc_babelSetSpokenLanguages;
                    };
                };

                if (GVAR(Babel_Enabled_OPFOR) && {(side player isEqualTo east)}) then {
                    _ACRE_OPFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
                    private _languages = GETPLVAR(Babel_Languages,[]);
                    if !(_languages isEqualTo []) then {
                        _languages call acre_api_fnc_babelSetSpokenLanguages;
                    };
                };

                if (GVAR(Babel_Enabled_Indfor) && {(side player isEqualTo independent)}) then {
                    _ACRE_Indfor_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
                    private _languages = GETPLVAR(Babel_Languages,[]);
                    if !(_languages isEqualTo []) then {
                        _languages call acre_api_fnc_babelSetSpokenLanguages;
                    };
                };

                if (GVAR(Babel_Enabled_Civ) && {(side player isEqualTo civilian)}) then {
                    _ACRE_Civ_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
                    private _languages = GETPLVAR(Babel_Languages,[]);
                    if !(_languages isEqualTo []) then {
                        _languages call acre_api_fnc_babelSetSpokenLanguages;
                    };
                };
            };

            [QGVAR(AddRadio_Event),[]] call CBA_fnc_localEvent;
        }] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(AddRadio_Event),{
    [{!isNull player},{
        if (GETPLVAR(UnitSettings_Enable,false)) then {
            private ["_SRType","_LRType","_PKType"];
            switch (side player) do {
                case west: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select GVAR(SR_Type_BLUFOR);
                    _LRType = ["NONE","ACRE_PRC343","ACRE_PRC148","ACRE_PRC152"] select GVAR(LR_Type_BLUFOR);
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select GVAR(PK_Type_BLUFOR);
                };
                case east: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select GVAR(SR_Type_OPFOR);
                    _LRType = ["NONE","ACRE_PRC343","ACRE_PRC148","ACRE_PRC152"] select GVAR(LR_Type_OPFOR);
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select GVAR(PK_Type_OPFOR);
                };
                case independent: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select GVAR(SR_Type_Indfor);
                    _LRType = ["NONE","ACRE_PRC343","ACRE_PRC148","ACRE_PRC152"] select GVAR(LR_Type_Indfor);
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select GVAR(PK_Type_Indfor);
                };
                case civilian: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select GVAR(SR_Type_Civ);
                    _LRType = ["NONE","ACRE_PRC343","ACRE_PRC148","ACRE_PRC152"] select GVAR(LR_Type_Civ);
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select GVAR(PK_Type_Civ);
                };
                default {};
            };

            LOG_3("Radio Types SR: %1 LR: %2 PK: %3",_SRType,_LRType,_PKType);

            private _gear = (getItemCargo (uniformContainer player)) select 0;
            _gear append ((getItemCargo (vestContainer player)) select 0);
            _gear append ((getItemCargo (backpackContainer player)) select 0);
            _gear append (assignedItems player);
            _gear = _gear select {((_x select [0, 4]) == "ACRE") || (_x == "ItemRadio")};
            {
                player removeItem _x;
            } foreach _gear;
            LOG_3("Removed: %1",_gear);

            if ((GETPLVAR(SR_RADIO_Enabled,false)) && {!(_SRType isEqualTo "NONE")}) then {
                private _result = [player, _SRType, true] call CBA_fnc_addItem;
                LOG_2("Adding %1, Success: %2",_SRType,_result);
            };
            if ((GETPLVAR(LR_RADIO_Enabled,false)) && {!(_LRType isEqualTo "NONE")}) then {
                private _result = [player, _LRType, true] call CBA_fnc_addItem;
                LOG_2("Adding %1, Success: %2",_LRType,_result);
            };
            if ((GETPLVAR(PK_RADIO_Enabled,false)) && {!(_PKType isEqualTo "NONE")}) then {
                private _result = [player, _PKType, true] call CBA_fnc_addItem;
                LOG_2("Adding %1, Success: %2",_PKType,_result);
            };

            [{(CBA_missionTime > 1) && {[] call acre_api_fnc_isInitialized}},{
                [QGVAR(SetChannelAndEar_Event),[]] call CBA_fnc_localEvent;
            }] call CBA_fnc_waitUntilAndExecute;
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(SetChannelAndEar_Event),{
    [{(CBA_missionTime > 1) &&  {[] call acre_api_fnc_isInitialized}},{
        if (GETPLVAR(UnitSettings_Enable,false)) then {
            {
                private _radioID = [_x] call acre_api_fnc_getRadioByType;
                if (!isNil "_radioID") then {
                    private _result = (GETPLVAR(SR_RADIO_CHANNEL,1));
                    if (_result < 1) then {
                        ERROR_1("%1 is not a valid Channel Number",_result);
                    } else {
                        [_radioID, _result] call acre_api_fnc_setRadioChannel;
                    };

                    [_radioID, (["CENTER", "LEFT", "RIGHT"] select (GETPLVAR(SR_RADIO_EAR,0)))] call acre_api_fnc_setRadioSpatial;
                };
            } forEach ["ACRE_PRC343", "ACRE_SEM52SL"];

            {
                private _radioID = [_x] call acre_api_fnc_getRadioByType;
                if ( ! isNil "_radioID") then {
                    private _result = (GETPLVAR(LR_RADIO_CHANNEL,1));
                    if (_result < 1) then {
                        ERROR_1("%1 is not a valid Channel Number",_result);
                    } else {
                        [_radioID, _result] call acre_api_fnc_setRadioChannel;
                    };
                    [_radioID, (["CENTER", "LEFT", "RIGHT"] select (GETPLVAR(LR_RADIO_EAR,0)))] call acre_api_fnc_setRadioSpatial;
                };
            } forEach ["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152"];

            {
                private _radioID = [_x] call acre_api_fnc_getRadioByType;
                if (!isNil "_radioID") then {
                    private _result = (GETPLVAR(PK_RADIO_CHANNEL,1));
                    if (_result < 1) then {
                        ERROR_1("%1 is not a valid Channel Number",_result);
                    } else {
                        if !(_x isEqualTo "ACRE_PRC77") then {
                            [_radioID, _result] call acre_api_fnc_setRadioChannel;
                        };
                    };
                    [_radioID, (["CENTER", "LEFT", "RIGHT"] select (GETPLVAR(PK_RADIO_EAR,0)))] call acre_api_fnc_setRadioSpatial;
                };
            } forEach ["ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"];
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[QEGVAR(Core,SettingsLoaded), {
    [QGVAR(Init_Event), []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
