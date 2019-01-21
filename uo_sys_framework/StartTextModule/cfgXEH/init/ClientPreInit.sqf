#define COMPONENT StartText
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
    if (!UO_FW_Server_StartTextModule_Allowed) exitWith {};
    if !(UO_FW_GETMVAR(StartText_Enabled,false)) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Start Text", "Displays animated text on mission start.", "Sacher"]] call CBA_fnc_globalEvent;
    [{(!isNull player) && {(CBA_missionTime > 1)}}, {
        private _dateType = [["DATE"],["TIME"],["DATETIME"]] select (UO_FW_GETMVAR(StartText_TimeSelect,2));
        private _startTextArray = [];
        switch (side player) do { //Checks what team the player is on
            case west: {
                private _TitleQuoteVar = UO_FW_GETMVAR(StartText_BluforTitleQuote,"");
                private _textVar = UO_FW_GETMVAR(StartText_BluforText,"");
                if !(_TitleQuoteVar isEqualto "" ) then {_startTextArray pushBack ["TitleQUOTE", _TitleQuoteVar];};
                if !(_textVar isEqualto "" ) then {_startTextArray pushBack ["TEXT", _textVar];};
            };
            case east: {
                private _TitleQuoteVar = UO_FW_GETMVAR(StartText_OpforTitleQuote,"");
                private _textVar = UO_FW_GETMVAR(StartText_OpforText,"");
                if !(_TitleQuoteVar isEqualto "" ) then {_startTextArray pushBack ["TitleQUOTE", _TitleQuoteVar];};
                if !(_textVar isEqualto "" ) then {_startTextArray pushBack ["TEXT", _textVar];};
            };
            case independent: {
                private _TitleQuoteVar = UO_FW_GETMVAR(StartText_IndependentTitleQuote,"");
                private _textVar = UO_FW_GETMVAR(StartText_IndependentText,"");
                if !(_TitleQuoteVar isEqualto "" ) then {_startTextArray pushBack ["TitleQUOTE", _TitleQuoteVar];};
                if !(_textVar isEqualto "" ) then {_startTextArray pushBack ["TEXT", _textVar];};
            };
            case civilian: {
                private _TitleQuoteVar = UO_FW_GETMVAR(StartText_CivilianTitleQuote,"");
                private _textVar = UO_FW_GETMVAR(StartText_CivilianText,"");
                if !(_TitleQuoteVar isEqualto "" ) then {_startTextArray pushBack ["TitleQUOTE", _TitleQuoteVar];};
                if !(_textVar isEqualto "" ) then {_startTextArray pushBack ["TEXT", _textVar];};
            };
        };
        _startTextArray pushBack _dateType;
        [_startTextArray] call UO_FW_fnc_ExecuteStartText;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
