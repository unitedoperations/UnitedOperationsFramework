#define COMPONENT StartText
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(missionNamespace getVariable ["UO_FW_StartText_Enabled",false]) exitWith {};
["Start Text", "Displays animated text on mission start.", "Sacher"] call UO_FW_fnc_RegisterModule;

private _dateTypeArray = [["DATE"],["TIME"],["DATETIME"]];
private _dateType = _dateTypeArray select (missionNamespace getVariable ["UO_FW_StartText_TimeSelect",2]);
private _startTextArray = [];
private _collectInfo = {
    params["_Title","_text"];
    private _ret = [];
    private _TitleQuoteVar = missionNamespace getVariable [_Title,""];
    private _textVar = missionNamespace getVariable [_text,""];
    if !(_TitleQuoteVar isEqualto "" ) then {_ret pushBack ["TitleQUOTE", _TitleQuoteVar];};
    if !(_textVar isEqualto "" ) then {_ret pushBack ["TEXT", _textVar];};
    _ret
};

switch (side player) do { //Checks what team the player is on
    case west: {
        _startTextArray = ["UO_FW_StartText_BluforTitleQuote","UO_FW_StartText_BluforText"] call _collectInfo;
    };
    case east: {
        _startTextArray = ["UO_FW_StartText_OpforTitleQuote","UO_FW_StartText_OpforText"] call _collectInfo;
    };
    case independent: {
        _startTextArray = ["UO_FW_StartText_IndependentTitleQuote","UO_FW_StartText_IndependentText"] call _collectInfo;
    };
    case civilian: {
        _startTextArray = ["UO_FW_StartText_CivilianTitleQuote","UO_FW_StartText_CivilianText"] call _collectInfo;
    };
};

_startTextArray pushBack _dateType;
_startTextArray call UO_FW_fnc_ExecuteStartText;
