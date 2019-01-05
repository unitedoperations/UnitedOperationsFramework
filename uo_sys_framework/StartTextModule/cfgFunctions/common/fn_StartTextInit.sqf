_isEnabled = missionNamespace getVariable ["UO_FW_StartText_Enabled",false];
if(!_isEnabled) exitWith {};
["Start Text", "Displays animated text on mission start.", "Sacher"] call UO_FW_FNC_RegisterModule;

private ["_month", "_hour", "_min", "_startTextArray", "_line", "_unparsedText"];
_dateTypeArray = [["DATE"],["TIME"],["DATETIME"]];
_dateType = _dateTypeArray select (missionNamespace getVariable ["UO_FW_StartText_TimeSelect",2]);
_startTextArray = [];
_collectInfo =
{

    params["_title","_text","_type"];
    _ret = [];
    _titleQuoteVar = missionNamespace getVariable [_title,""];
    _textVar = missionNamespace getVariable [_text,""];
    if(_titleQuoteVar != "" ) then {_ret pushBack ["TITLEQUOTE", _titleQuoteVar];};
    if(_textVar != "" ) then {_ret pushBack ["TEXT", _textVar];};
    _ret

};
switch (side player) do
{ //Checks what team the player is on

    case west:
    {
        _startTextArray = ["UO_FW_StartText_BluforTitleQuote","UO_FW_StartText_BluforText",_dateType] call _collectInfo;
    };

    case east:
    {
        _startTextArray = ["UO_FW_StartText_OpforTitleQuote","UO_FW_StartText_OpforText",_dateType] call _collectInfo;
    };
    case independent:
    {
        _startTextArray = ["UO_FW_StartText_IndependentTitleQuote","UO_FW_StartText_IndependentText",_dateType] call _collectInfo;

    };
    case civilian:
    {
        _startTextArray = ["UO_FW_StartText_CivilianTitleQuote","UO_FW_StartText_CivilianText",_dateType] call _collectInfo;
    };
};
_startTextArray pushBack _dateType;


_startTextArray call UO_FW_fnc_ExecuteStartText;
