_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

if (_activated && !isDedicated) then
{
     ["Start Text", "Displays animated text on mission start.", "Olsen &amp; Starfox64"] call UO_FNC_RegisterModule;
    
    _isValid = _this call UO_fnc_ValidateStartText;
    if(!_isValid) exitWith { "Start Text Module Failed to validate!" call UO_fnc_DebugMessage;};

    _this spawn
    {

        waitUntil {time > 0};

      
       

        _logic = param [0,objNull,[objNull]];
        // Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
        _units = param [1,[],[[]]];
        private ["_month", "_hour", "_min", "_startTextArray", "_line", "_unparsedText"];
        _dateTypeArray = [["DATE"],["TIME"],["DATETIME"]];
        _dateType = _dateTypeArray select (_logic getVariable ["TimeSelectArgument",0]);
        _startTextArray = [];
        switch (side player) do
        { //Checks what team the player is on

            case west:
            { //If player is west he receives this message

                _titleQuote = _logic getVariable ["BluforTitleQuoteArgument",""];
                _text = _logic getVariable ["BluforTextArgument",""];
                if(_titleQuote != "" ) then {_startTextArray append [["TITLEQUOTE", _titleQuote]];};
                if(_text != "" ) then {_startTextArray append [["TEXT", _text]];};
                _startTextArray append [_dateType];


            }; //End of west case

            case east:
            { //If player is east he receives this message


                _titleQuote = _logic getVariable ["OpforTitleQuoteArgument",""];
                _text = _logic getVariable ["OpforTextArgument",""];
                if(_titleQuote != "" ) then {_startTextArray append [["TITLEQUOTE", _titleQuote]];};
                if(_text != "" ) then {_startTextArray append [["TEXT", _text]];};
                _startTextArray append [_dateType];

            }; //End of east case
            case resistance:
            { //If player is east he receives this message


                _titleQuote = _logic getVariable ["IndforTitleQuoteArgument",""];
                _text = _logic getVariable ["IndforTextArgument",""];
                if(_titleQuote != "" ) then {_startTextArray append [["TITLEQUOTE", _titleQuote]];};
                if(_text != "" ) then {_startTextArray append [["TEXT", _text]];};
                _startTextArray append [_dateType];

            }; //End of east case
            case civilian:
            { //If player is east he receives this message


                _titleQuote = _logic getVariable ["CivilianTitleQuoteArgument",""];
                _text = _logic getVariable ["CivilianTextArgument",""];
                if(_titleQuote != "" ) then {_startTextArray append [["TITLEQUOTE", _titleQuote]];};
                if(_text != "" ) then {_startTextArray append [["TEXT", _text]];};
                _startTextArray append [_dateType];

            }; //End of east case
        }; //End of switch

    };
    
     _startTextArray call UO_fnc_ExecuteStartText;


};