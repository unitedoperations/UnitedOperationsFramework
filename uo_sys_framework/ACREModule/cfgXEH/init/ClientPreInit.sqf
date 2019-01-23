/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */


#define COMPONENT ACRE
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
	if !(UO_FW_Server_AcreModule_Allowed) exitwith {};
	if !(missionNamespace getvariable ["UO_FW_ACRE_SETTINGS_Enabled",false]) exitwith {};

	if (!isDedicated && hasinterface) then {

		["UO_FW_RegisterModuleEvent", ["ACRE Setup", "Module for Acre Settings", "PiZZADOX and Sacher"]] call CBA_fnc_globalEvent;

		private _UO_FW_Presets = ["default2", "default3", "default4", "default"];
		private _UO_FW_Presets_BLUFOR = "default";
		private _UO_FW_Presets_OPFOR = "default";
		private _UO_FW_Presets_INDEPENDENT = "default";
		private _UO_FW_Presets_CIVILIAN = "default";
		if (UO_FW_ACRE_SCRAMBLE_Enabled) then
		{
			_UO_FW_Presets_BLUFOR = _UO_FW_Presets select 0;
			_UO_FW_Presets_OPFOR = _UO_FW_Presets select 1;
			_UO_FW_Presets_INDEPENDENT = _UO_FW_Presets select 2;
			_UO_FW_Presets_CIVILIAN = _UO_FW_Presets select 3;
		};
		//blu,opf,indep,civ

		//Channel names stuff
		INFO("ACRE Init");
		private _UO_FW_ChannelNamesBLUFOR = [];
		if (UO_FW_ACRE_BLUFOR_RADIONET_Enabled && (side player == west)) then {


			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME1",""]);
			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME2",""]);
			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME3",""]);
			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME4",""]);
			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME5",""]);
			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME6",""]);
			_UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME7",""]);
			{
				private _index = _forEachIndex + 1;
				_x params ["_name"];
				if (_name != "") then {
					{
						private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
						[_x, _UO_FW_Presets_BLUFOR, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
					} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
				};

			} foreach _UO_FW_ChannelNamesBLUFOR;
		};
		private _UO_FW_ChannelNamesOPFOR = [];
		if (UO_FW_ACRE_OPFOR_RADIONET_Enabled   && (side player == east)) then {

			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME1",""]);
			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME2",""]);
			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME3",""]);
			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME4",""]);
			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME5",""]);
			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME6",""]);
			_UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME7",""]);
			{
				private _index = _forEachIndex + 1;
				_x params ["_name"];
				if (_name != "") then {
					{
						private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
						[_x, _UO_FW_Presets_OPFOR, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
					} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
				};

			} foreach _UO_FW_ChannelNamesOPFOR;
		};
		private _UO_FW_ChannelNamesINDEPENDENT = [];
		if (UO_FW_ACRE_INDEPENDENT_RADIONET_Enabled  && (side player == independent)) then {

			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME1",""]);
			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME2",""]);
			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME3",""]);
			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME4",""]);
			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME5",""]);
			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME6",""]);
			_UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME7",""]);
			{
				private _index = _forEachIndex + 1;
				_x params ["_name"];
				if (_name != "") then {
					{
						private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
						[_x, _UO_FW_Presets_INDEPENDENT, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
					} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
				};

			} foreach _UO_FW_ChannelNamesINDEPENDENT;
		};
		private _UO_FW_ChannelNamesCIVILIAN = [];
		if (UO_FW_ACRE_CIVILIAN_RADIONET_Enabled   && (side player == civilian)) then {

			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME1",""]);
			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME2",""]);
			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME3",""]);
			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME4",""]);
			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME5",""]);
			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME6",""]);
			_UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME7",""]);
			{
				private _index = _forEachIndex + 1;
				_x params ["_name"];
				if (_name != "") then {
					{
						private _label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
						[_x, _UO_FW_Presets_CIVILIAN, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
					} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
				};

			} foreach _UO_FW_ChannelNamesCIVILIAN;
		};

		INFO(("Setting Netnames. Blu:" + (str _UO_FW_ChannelNamesBLUFOR) + " Opf: "+ (str _UO_FW_ChannelNamesOPFOR)
		+ " Ind: " + (str _UO_FW_ChannelNamesINDEPENDENT) + " Civ: " + (str _UO_FW_ChannelNamesCIVILIAN)));


		[{(!isNull player) && (!isNull acre_player) && ([] call acre_api_fnc_isInitialized) && {UO_FW_GearReady}},{
			private _side = side player;
			private _customSide = (player getVariable ["FW_CustomScramble", nil]);
			UO_FW_Acre_Volume_Value = -1;
			if (!isNil "UO_FW_Acre_Volume_Value") then {
				if ((abs UO_FW_Acre_Volume_Value) > 2) then {
				UO_FW_Acre_Volume_Value = 0;
				};
				private _v = 0.7;
				switch (UO_FW_Acre_Volume_Value) do {
					case -2: {_v = 0.1;};
					case -1: {_v = 0.2;};
					case 0: {_v = 0.4;};
					case 1: {_v = 0.7;};
					case 2: {_v = 1.0;};
					default {_v = 0.4;};
				};
				[_v] call acre_api_fnc_setSelectableVoiceCurve;

				[{(!isNil "acre_sys_gui_VolumeControl_Level")}, {
					acre_sys_gui_VolumeControl_Level = UO_FW_Acre_Volume_Value;
				}] call CBA_fnc_waitUntilAndExecute;
			};
			if (!isNil "_customSide") then {
				_side = _customSide;
			};
			private _presetTemp = "default";
			switch (_side) do {
				case west: {
					_presetTemp = _UO_FW_Presets_BLUFOR;
				};
				case east: {
					_presetTemp = _UO_FW_Presets_OPFOR;
				};
				case independent: {
					_presetTemp = _UO_FW_Presets_INDEPENDENT;
				};
				default {
					_presetTemp = _UO_FW_Presets_CIVILIAN;
				};
			};

			if (UO_FW_ACRE_SCRAMBLE_Enabled) then {
				INFO(("Enabling Acre Scramble with " + _presetTemp));
				["ACRE_PRC343", _presetTemp ] call acre_api_fnc_setPreset;
				["ACRE_PRC77", _presetTemp ] call acre_api_fnc_setPreset;
				["ACRE_PRC117F", _presetTemp ] call acre_api_fnc_setPreset;
				["ACRE_PRC152", _presetTemp ] call acre_api_fnc_setPreset;
				["ACRE_PRC148", _presetTemp ] call acre_api_fnc_setPreset;
				["ACRE_SEM52SL", _presetTemp ] call acre_api_fnc_setPreset;
				["ACRE_SEM70", _presetTemp ] call acre_api_fnc_setPreset;
			};


			//BABBLE STUFF
			if (UO_FW_ACRE_BABEL_Enabled) then {
				INFO("Enabling Babbel");
				private _UO_FW_CURRENTBABEL_LANGUAGES = [["en", "English"],
				["ru", "Russian"],
				["fr", "French"],
				["ar", "Arabic"],
				["gk", "Greek"]];

				private _names = [	"UO_FW_ACRE_BLUFOR_BABEL_Custom","UO_FW_ACRE_BLUFOR_BABEL_Custom2",
							"UO_FW_ACRE_OPFOR_BABEL_Custom","UO_FW_ACRE_OPFOR_BABEL_Custom2",
							"UO_FW_ACRE_INDEPENDENT_BABEL_Custom","UO_FW_ACRE_INDEPENDENT_BABEL_Custom2",
							"UO_FW_ACRE_CIVILIAN_BABEL_Custom","UO_FW_ACRE_CIVILIAN_BABEL_Custom2"];

				{
					private _index = _forEachIndex + 1;
					_UO_FW_CURRENTBABEL_LANGUAGES pushBack ["cl" + (str _index),(missionNamespace getVariable [_x,""])];
				} forEach _names;
				private _langInfo = format ["Acre Babel Lanugages: %1",_UO_FW_CURRENTBABEL_LANGUAGES];
				INFO_1("""%1""",_langInfo);
				{_x call acre_api_fnc_babelAddLanguageType;} foreach _UO_FW_CURRENTBABEL_LANGUAGES;

				private _UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES = [];
				if (UO_FW_ACRE_BLUFOR_BABEL_EN) then {_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "en"; };
				if (UO_FW_ACRE_BLUFOR_BABEL_RU) then {	_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ru"; };
				if (UO_FW_ACRE_BLUFOR_BABEL_FR) then {_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "fr"; };
				if (UO_FW_ACRE_BLUFOR_BABEL_AR) then {_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ar"; };
				if (UO_FW_ACRE_BLUFOR_BABEL_GK) then {	_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "gk"; };
				{
					private _language = _x;
					{
						if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
							_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack (_language select 0);
						};
					} forEach ["UO_FW_ACRE_BLUFOR_BABEL_Custom","UO_FW_ACRE_BLUFOR_BABEL_Custom2"];
				} forEach _UO_FW_CURRENTBABEL_LANGUAGES;

				private _UO_FW_ACRE_OPFOR_BABEL_LANGUAGES = [];
				if (UO_FW_ACRE_OPFOR_BABEL_EN) then {_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "en"; };
				if (UO_FW_ACRE_OPFOR_BABEL_RU) then {_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ru"; };
				if (UO_FW_ACRE_OPFOR_BABEL_FR) then {_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "fr"; };
				if (UO_FW_ACRE_OPFOR_BABEL_AR) then {_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ar"; };
				if (UO_FW_ACRE_OPFOR_BABEL_GK) then {_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "gk"; };
				{
					private _language = _x;
					{
						if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
							_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack (_language select 0);
						};
					} forEach ["UO_FW_ACRE_OPFOR_BABEL_Custom","UO_FW_ACRE_OPFOR_BABEL_Custom2"];
				} forEach _UO_FW_CURRENTBABEL_LANGUAGES;

				private _UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES = [];
				if (UO_FW_ACRE_INDEPENDENT_BABEL_EN) then {_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "en"; };
				if (UO_FW_ACRE_INDEPENDENT_BABEL_RU) then {	_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "ru"; };
				if (UO_FW_ACRE_INDEPENDENT_BABEL_FR) then {_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "fr"; };
				if (UO_FW_ACRE_INDEPENDENT_BABEL_AR) then {_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "ar"; };
				if (UO_FW_ACRE_INDEPENDENT_BABEL_GK) then {	_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "gk"; };
				{
					private _language = _x;
					{
						if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
							_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack (_language select 0);
						};
					} forEach ["UO_FW_ACRE_INDEPENDENT_BABEL_Custom","UO_FW_ACRE_INDEPENDENT_BABEL_Custom2"];
				} forEach _UO_FW_CURRENTBABEL_LANGUAGES;

				private _UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES = [];
				if (UO_FW_ACRE_CIVILIAN_BABEL_EN) then {_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "en"; };
				if (UO_FW_ACRE_CIVILIAN_BABEL_RU) then {	_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "ru"; };
				if (UO_FW_ACRE_CIVILIAN_BABEL_FR) then {_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "fr"; };
				if (UO_FW_ACRE_CIVILIAN_BABEL_AR) then {_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "ar"; };
				if (UO_FW_ACRE_CIVILIAN_BABEL_GK) then {	_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "gk"; };
				{
					private _language = _x;
					{
						if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
							_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack (_language select 0);
						};
					} forEach ["UO_FW_ACRE_CIVILIAN_BABEL_Custom","UO_FW_ACRE_CIVILIAN_BABEL_Custom2"];
				} forEach _UO_FW_CURRENTBABEL_LANGUAGES;


				if (UO_FW_ACRE_BLUFOR_BABEL_Enabled  && (side player == west)) then {
							_UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

							private _languages = player getVariable ["UO_FW_Languages", []];

							if (count _languages > 0) then {
								_languages call acre_api_fnc_babelSetSpokenLanguages;
							};
				};

				if (UO_FW_ACRE_OPFOR_BABEL_Enabled  && (side player == east)) then {
							_UO_FW_ACRE_OPFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

							private _languages = player getVariable ["UO_FW_Languages", []];

							if (count _languages > 0) then {
								_languages call acre_api_fnc_babelSetSpokenLanguages;
							};
				};

				if (UO_FW_ACRE_INDEPENDENT_BABEL_Enabled  && (side player == independent)) then {
							_UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

							private _languages = player getVariable ["UO_FW_Languages", []];

							if (count _languages > 0) then {
								_languages call acre_api_fnc_babelSetSpokenLanguages;
							};
				};

				if (UO_FW_ACRE_CIVILIAN_BABEL_Enabled  && (side player == civilian)) then {
							_UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

							private _languages = player getVariable ["UO_FW_Languages", []];

							if (count _languages > 0) then {
								_languages call acre_api_fnc_babelSetSpokenLanguages;
							};
				};

			};

		
				
			["UO_FW_ACRE_AddRadio_Event",[]] call CBA_fnc_localEvent;
			//need to check again for acre
			[{CBA_missionTime > 1 &&  {[] call acre_api_fnc_isInitialized}},
			{
				["UO_FW_ACRE_SetChannelAndEar_Event",[]] call CBA_fnc_localEvent;

			}] call CBA_fnc_waitUntilAndExecute;
			
		}] call CBA_fnc_waitUntilAndExecute;
	};
}] call CBA_fnc_addEventHandler;

["UO_FW_ACRE_AddRadio_Event",{
	[{UO_FW_GearReady},{
		if (player getVariable ["UO_FW_ACRE_UNITSETTINGS_Enable",false]) then {
			private ["_SRType","_LRType","_PKType"];
			switch (side player) do {
				case west: {
					_SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_BLUFOR_SR_Type;
					_LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_BLUFOR_LR_Type;
					_PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_BLUFOR_PK_Type;
				};
				case east: {
					_SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_OPFOR_SR_Type;
					_LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_OPFOR_LR_Type;
					_PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_OPFOR_PK_Type;
				};
				case independent: {
					_SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_INDFOR_SR_Type;
					_LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_INDFOR_LR_Type;
					_PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_INDFOR_PK_Type;
				};
				case civilian: {
					_SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_CIVILIAN_SR_Type;
					_LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_CIVILIAN_LR_Type;
					_PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_CIVILIAN_PK_Type;
				};
				default {};
			};

			if (player getVariable ["UO_FW_ACRE_SR_RADIO_Enabled",false]) then {player addItem _SRType;};
			if (player getVariable ["UO_FW_ACRE_LR_RADIO_Enabled",false]) then {player addItem _LRType;};
			if (player getVariable ["UO_FW_ACRE_PK_RADIO_Enabled",false]) then {player addItem _PKType;};
		};
	}] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_ACRE_SetChannelAndEar_Event",{
	[{CBA_missionTime > 1 &&  {[] call acre_api_fnc_isInitialized}},{
		if (player getVariable ["UO_FW_ACRE_UNITSETTINGS_Enable", false]) then {
			{
				private _radioID = [_x] call acre_api_fnc_getRadioByType;
				if (!isNil "_radioID") then {
					private _result = (player getVariable ["UO_FW_ACRE_SR_RADIO_CHANNEL", "1"]) call BIS_fnc_parseNumber;
					if (_result < 0)then {
						[(str (player getVariable ["UO_FW_ACRE_SR_RADIO_CHANNEL", "1"])) + " is not a valid Channel Number", ""] call UO_FW_fnc_DebugMessageDetailed;
					} else {
						[_radioID, _result] call acre_api_fnc_setRadioChannel;
					};

					[_radioID, (["CENTER", "LEFT", "RIGHT"] select  (player getVariable ["UO_FW_ACRE_SR_RADIO_EAR", 0]))] call acre_api_fnc_setRadioSpatial;
				};
			} forEach ["ACRE_PRC343", "ACRE_SEM52SL"];

			{
				private _radioID = [_x] call acre_api_fnc_getRadioByType;
				if ( ! isNil "_radioID") then {
					private _result = (player getVariable ["UO_FW_ACRE_LR_RADIO_CHANNEL", "1"]) call BIS_fnc_parseNumber;
					if (_result < 0) then {
						[(str (player getVariable ["UO_FW_ACRE_LR_RADIO_CHANNEL", "1"])) + " is not a valid Channel Number", ""] call UO_FW_fnc_DebugMessageDetailed;
					} else {
						[_radioID, _result] call acre_api_fnc_setRadioChannel;
					};
					[_radioID, (["CENTER", "LEFT", "RIGHT"] select (player getVariable ["UO_FW_ACRE_LR_RADIO_EAR", 0]))] call acre_api_fnc_setRadioSpatial;
				};
			} forEach ["ACRE_PRC148", "ACRE_PRC152"];

			{
				private _radioID = [_x] call acre_api_fnc_getRadioByType;
				if ( ! isNil "_radioID") then {
					private _result = (player getVariable ["UO_FW_ACRE_PK_RADIO_CHANNEL", "1"]) call BIS_fnc_parseNumber;
					if (_result < 0) then {
						[(str (player getVariable ["UO_FW_ACRE_PK_RADIO_CHANNEL", "1"])) + " is not a valid Channel Number", ""] call UO_FW_fnc_DebugMessageDetailed;
					} else {
						[_radioID, _result] call acre_api_fnc_setRadioChannel;
					};
					[_radioID, (["CENTER", "LEFT", "RIGHT"] select (player getVariable ["UO_FW_ACRE_PK_RADIO_EAR", 0]))] call acre_api_fnc_setRadioSpatial;
				};
			} forEach ["ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"];
		};
	}] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;