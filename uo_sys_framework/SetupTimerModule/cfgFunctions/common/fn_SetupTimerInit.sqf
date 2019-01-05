#include "\A3\ui_f\hpp\defineResinclDesign.inc"

	_this spawn {
		disableserialization;

		params ["_display"];
		//private _ctrlTitle = _display displayCtrl 1001;
		//private _ctrlTitleBG = _display displayCtrl 1002;
		private _ctrlTime = _display displayCtrl 1003;

		private _timecheckStart = serverTime;
		if (_timecheckStart isEqualto 0) then {_timecheckStart = time;};

		private _endTime = _timecheckStart + (missionNamespace getVariable ["UO_FW_ST_TimeLeft", 0]);
		private _nextBeep = _endTime - 10;

		private _break = false;
		private _run = true;

		while {_run} do {

			private _timecheck = serverTime;
			if (_timecheck isEqualto 0) then {_timecheck = time;};

			if (_timecheck >= _nextBeep) then {
				_nextBeep = _nextBeep + 1;
				playSound "Beep_Target";
			};

			private _timeLeft = _endTime - _timecheck;

			private _colorSet = ["IGUI","TEXT_RGB"];
			if (_timeLeft <= 30) then {
				_colorSet = ["IGUI","WARNING_RGB"];
			};

			if (_timeLeft <= 10) then {
				_colorSet = ["IGUI","ERROR_RGB"];
			};

			private _color = _colorSet call bis_fnc_displaycolorget;
			_ctrlTime ctrlSetTextColor _color;

			if (_timeLeft > 0) then {
				_ctrlTime ctrlSetText ([_timeLeft,"MM:SS.MS"] call bis_fnc_secondsToString);
			} else {
				_ctrlTime ctrlSetText "00:00.000";
				["UO_FW_SetupTimerEnded"] call BIS_fnc_showNotification;
				sleep 3;
				_break = true;
			};

			if (_break) exitWith {
				_display closeDisplay 1;
				_run = false;
			};

			sleep 0.08;
		};

	};
