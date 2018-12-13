90001 cutRsc ["UO_FW_DIA_ENDSCREEN", "PLAIN"];
_bg = 3000;
_endTitle = 3001;
_left = 3002;
_right = 3003;
_bottomLeft = 3004;
_bottomMiddleLeft = 3005;
_bottomMiddleRight = 3006;
_bottomRight = 3007;

params ["_scenario", "_timeLimit", "_teams"];

{

	_x enableSimulation false;

} forEach vehicles;

[] spawn {

	sleep 1;
	{

		_x enableSimulation false;
		removeAllWeapons _x;

	} forEach allPlayers;
};

_leftText = "";
_rightText = "";
_bottomTextLeft = "";
_bottomTextMiddleLeft = "";
_bottomTextMiddleRight = "";
_bottomTextRight = "";
_textSide = 0;
{

	_x params ["_name", "_side", "_type", "_start", "_current", "_disabled", "_destroyed"];
	
	if (_start > 0) then {
	
		_temp = format ["%1<br />Casualties: %2 out of %3<br />", _name, (_start - _current), _start];
	
		if (count _disabled != 0) then {
	
			_temp = _temp + "<br />Disabled assets:<br />";
	
			{
	
				_temp = _temp + format ["%1<br />", _x];
	
			} forEach _disabled;
	
		};
	
		if (count _destroyed != 0) then {
	
			_temp = _temp + "<br />Destroyed assets:<br />";
	
			{
	
				_temp = _temp + format ["%1<br />", _x];
	
			} forEach _destroyed;
		};
	
		_temp = _temp + "<br />";
	
		if (_textSide == 0) then {
	
			_textSide = 1;
			_leftText = _leftText + _temp;
	
		} else {
	
			_textSide = 0;
			_rightText = _rightText + _temp;
	
		};
	
	};

} forEach _teams;

_endTitleText = _scenario;

if (_timeLimit != 0) then {

	_time = ceil(time / 60);

	if (_time >= _timeLimit) then {

		_time = _timeLimit;

	};

	_timeLimitText = format ["Mission duration: %1 out of %2 minutes", _time, _timeLimit];

	_endTitleText = format ["%1<br />%2", _scenario, _timeLimitText];

};


disableSerialization;
_dia = uiNamespace getVariable "UO_FW_EndScreen";

(_dia displayCtrl _endTitle) ctrlSetStructuredText parseText _endTitleText;
(_dia displayCtrl _left) ctrlSetStructuredText parseText _leftText;
(_dia displayCtrl _right) ctrlSetStructuredText parseText _rightText;


[_dia,_bg] spawn {
	for "_x" from 1 to 120 do {
		((uiNamespace getVariable "UO_FW_EndScreen") displayCtrl 3000) ctrlSetBackgroundColor [0, 0, 0, (_x * (1/120))];
		sleep(0.01);
	};
	_this spawn
	{
		"" call UO_FW_FNC_aCountShotDisplay;
		waituntil{!isNil "aCount_textBLU"};
		waituntil{!isNil "aCount_textOPF"};
		waituntil{!isNil "aCount_textRES"};
		waituntil{!isNil "aCount_textCIV"};
		
		_bottomLeft = 3004;
		_bottomMiddleLeft = 3005;
		_bottomMiddleRight = 3006;
		_bottomRight = 3007;

		_bottomTextLeft = format["%1",aCount_textBLU];
		_bottomTextMiddleLeft = format["%1",aCount_textOPF];
		_bottomTextMiddleRight = format["%1",aCount_textRES];
		_bottomTextRight = format["%1",aCount_textCIV];
		((_this select 0) displayCtrl _bottomLeft) ctrlSetStructuredText parseText _bottomTextLeft;
		((_this select 0) displayCtrl _bottomMiddleLeft) ctrlSetStructuredText parseText _bottomTextMiddleLeft;
		((_this select 0) displayCtrl _bottomMiddleRight) ctrlSetStructuredText parseText _bottomTextMiddleRight;
		((_this select 0) displayCtrl _bottomRight) ctrlSetStructuredText parseText _bottomTextRight;
		
	};
	
	
	sleep (15);
	endMission "END1";
};

