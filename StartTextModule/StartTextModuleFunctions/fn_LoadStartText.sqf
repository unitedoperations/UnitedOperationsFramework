
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{

    ["Start Text", "Displays animated text on mission start.", "Olsen &amp; Starfox64"] call UO_FNC_RegisterModule;
    _this spawn
    {

        waitUntil {time > 0};

        _logic = param [0,objNull,[objNull]];
         // Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
         _units = param [1,[],[[]]];
         if (!isDedicated) then
         {
             private ["_month", "_hour", "_min", "_startTextArray", "_line", "_unparsedText"];
             _dateTypeArray = ["DATE","TIME","DATETIME"];
             _dateType = _dateTypeArray select (_logic getVariable ["TimeSelectArgument",0]);
             _startTextArray = [];
             switch (side player) do
             { //Checks what team the player is on

                 case west:
                 { //If player is west he receives this message

                     _titleQuote = _logic getVariable ["BluforTitleQuoteArgument",""];
                     _title = _logic getVariable ["BluforTitleArgument",""];
                     _text = _logic getVariable ["BluforTextArgument",""];
                     if(_titleQuote != "" ) then {_startTextArray append ["TITLEQUOTE", _titleQuote];};
                     if(_title != "" ) then {_startTextArray append ["TITLE", _titleQuote];};
                     if(_text != "" ) then {_startTextArray append ["TEXT", _titleQuote];};
                     _startTextArray append [_dateType];
                     hint (str _startTextArray);

                 }; //End of west case

                 case east:
                 { //If player is east he receives this message


                     _titleQuote = _logic getVariable ["OpforTitleQuoteArgument",""];
                     _title = _logic getVariable ["OpforTitleArgument",""];
                     _text = _logic getVariable ["OpforTextArgument",""];
                     if(_titleQuote != "" ) then {_startTextArray append ["TITLEQUOTE", _titleQuote];};
                     if(_title != "" ) then {_startTextArray append ["TITLE", _titleQuote];};
                     if(_text != "" ) then {_startTextArray append ["TEXT", _titleQuote];};
                     _startTextArray append [_dateType];

                 }; //End of east case
                 case resistance:
                 { //If player is east he receives this message


                     _titleQuote = _logic getVariable [IndforTitleQuoteArgument",""];
                     _title = _logic getVariable [IndforTitleArgument",""];
                     _text = _logic getVariable [IndforTextArgument",""];
                     if(_titleQuote != "" ) then {_startTextArray append ["TITLEQUOTE", _titleQuote];};
                     if(_title != "" ) then {_startTextArray append ["TITLE", _titleQuote];};
                     if(_text != "" ) then {_startTextArray append ["TEXT", _titleQuote];};
                     _startTextArray append [_dateType];

                 }; //End of east case
                 case civilian:
                 { //If player is east he receives this message


                     _titleQuote = _logic getVariable ["CivilianTitleQuoteArgument",""];
                     _title = _logic getVariable ["CivilianTitleArgument",""];
                     _text = _logic getVariable ["CivilianTextArgument",""];
                     if(_titleQuote != "" ) then {_startTextArray append ["TITLEQUOTE", _titleQuote];};
                     if(_title != "" ) then {_startTextArray append ["TITLE", _titleQuote];};
                     if(_text != "" ) then {_startTextArray append ["TEXT", _titleQuote];};
                     _startTextArray append [_dateType];

                 }; //End of east case
             }; //End of switch


             switch (date select 1) do {

                 case 1: {_month = "January"};
                 case 2: {_month = "February"};
                 case 3: {_month = "March"};
                 case 4: {_month = "April"};
                 case 5: {_month = "May"};
                 case 6: {_month = "June"};
                 case 7: {_month = "July"};
                 case 8: {_month = "August"};
                 case 9: {_month = "September"};
                 case 10: {_month = "October"};
                 case 11: {_month = "November"};
                 case 12: {_month = "December"};

             };

             _day = format ["%1th", date select 2];

             if (((date select 2) mod 10) < 4) then {

                 switch ((date select 2) mod 10) do {

                     case 1: {_day = format ["%1st", date select 2]};
                     case 2: {_day = format ["%1nd", date select 2]};
                     case 3: {_day = format ["%1rd", date select 2]};

                 };
             };

             private _h = date select 3;
             if (date select 4 == 60) then {_h = _h + 1;};

             if (_h < 10) then {
                 _hour = "0" + format ["%1", _h];

             } else {

                 _hour = format ["%1", _h];

             };
             _m = date select 4;
             if (date select 4 == 60) then {_m = 0};
             if (_m < 10) then {

                 _min = "0" + format ["%1H", _m];

             } else {

                 _min = format ["%1H", _m];

             };

             _unparsedText = "<t align='right' size='1.2'>";

             for "_i" from 0 to count _startTextArray -1 do {
                 _line = _startTextArray select _i;

                 switch (_line select 0) do {

                     case "TITLEQUOTE": {
                         _unparsedText = _unparsedText + format ["<t font='PuristaBold' size='1.6'>""%1""</t>", _line select 1];
                     };

                     case "TITLE": {
                         _unparsedText = _unparsedText + format ["<t font='PuristaBold' size='1.6'>%1</t>", _line select 1];
                     };

                     case "TEXT": {
                         _unparsedText = _unparsedText + format ["%1", _line select 1];
                     };

                     case "DATE": {
                         _unparsedText = _unparsedText + format ["%2 %3", _day, _month];
                     };

                     case "TIME": {
                         _unparsedText = _unparsedText + format ["%1", (_hour + _min)];
                     };

                     case "DATETIME": {
                         _unparsedText = _unparsedText + format ["%1, %2 %3", (_hour + _min), _day, _month];
                     };
                 };

                 if (_i < count _startTextArray -1) then {
                     _unparsedText = _unparsedText + "<br/>";
                 }
             };

             _unparsedText = _unparsedText + "</t>";

             [parsetext _unparsedText, true, nil, 10, 0.7, 0] spawn {

                 sleep 10;
                 _this call BIS_fnc_textTiles;

             };
         };
    };


};
