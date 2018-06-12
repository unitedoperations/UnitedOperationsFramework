_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

if (_activated && !isDedicated) then
{
     ["Start Text", "Displays animated text on mission start.", "Sacher"] call UO_FNC_RegisterModule; 
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
        _collectInfo = 
        {
            
            params["_logic","_title","_text"];
            _ret = [];
            _titleQuoteVar = _logic getVariable [_title,""];
            _textVar = _logic getVariable [_text,""];
            if(_titleQuoteVar != "" ) then {_ret append [["TITLEQUOTE", _titleQuoteVar]];};
            if(_textVar != "" ) then {_ret append [["TEXT", _textVar]];};
            [_ret]

        };
        switch (side player) do
        { //Checks what team the player is on

            case west:
            { 
               _startTextArray = [_logic,"BluforTitleQuoteArgument","BluforTextArgument",_dateType] call _collectInfo;
            }; 

            case east:
            { 
                _startTextArray = [_logic,"OpforTitleQuoteArgument","OpforTextArgument",_dateType] call _collectInfo;
            }; 
            case resistance:
            { 
             _startTextArray = [_logic,"IndforTitleQuoteArgument","IndforTextArgument",_dateType] call _collectInfo;

            }; 
            case civilian:
            { 
                _startTextArray = [_logic,"CivilianTitleQuoteArgument","CivilianTextArgument",_dateType] call _collectInfo;
            }; 
        };
        _startTextArray append [_dateType];
        _isValid = _startTextArray call UO_fnc_ValidateStartText;
        if(!_isValid) exitWith { "Start Text Module Failed to validate!" call UO_fnc_DebugMessage;};
       
         _startTextArray call UO_fnc_ExecuteStartText;
    };
    


};