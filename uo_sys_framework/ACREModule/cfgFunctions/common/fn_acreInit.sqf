/*	Description: Checks ACRE module values and sets options accordingly
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX & Sacher
 */

#define COMPONENT ACRE
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(missionNamespace getvariable ["UO_FW_ACRE_SETTINGS_Enabled",false]) exitwith {};
["UO_FW_RegisterModuleEvent", ["ACRE Setup", "Module for Acre Settings", "PiZZADOX and Sacher"]] call CBA_fnc_globalEvent;

UO_FW_Presets = ["default2", "default3", "default4", "default"];
UO_FW_Presets_BLUFOR = "default";
UO_FW_Presets_OPFOR = "default";
UO_FW_Presets_INDEPENDENT = "default";
UO_FW_Presets_CIVILIAN = "default";
if (UO_FW_ACRE_SCRAMBLE_Enabled) then {
	UO_FW_Presets_BLUFOR = UO_FW_Presets select 0;
	UO_FW_Presets_OPFOR = UO_FW_Presets select 1;
	UO_FW_Presets_INDEPENDENT = UO_FW_Presets select 2;
	UO_FW_Presets_CIVILIAN = UO_FW_Presets select 3;
};
//blu,opf,indep,civ

//Channel names stuff
["","ACRE Init"] call UO_FW_fnc_DebugMessageDetailed;
UO_FW_ChannelNamesBLUFOR = [];
if (UO_FW_ACRE_BLUFOR_RADIONET_Enabled && (side player == west)) then {


	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME1",""]);
	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME2",""]);
	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME3",""]);
	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME4",""]);
	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME5",""]);
	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME6",""]);
	UO_FW_ChannelNamesBLUFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_BLUFOR_RADIONET_NAME7",""]);
	{
		_index = _forEachIndex + 1;
		_x params ["_name"];
		if (_name != "") then {
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_BLUFOR, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};

	} foreach UO_FW_ChannelNamesBLUFOR;
};
UO_FW_ChannelNamesOPFOR = [];
if (UO_FW_ACRE_OPFOR_RADIONET_Enabled   && (side player == east)) then {

	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME1",""]);
	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME2",""]);
	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME3",""]);
	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME4",""]);
	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME5",""]);
	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME6",""]);
	UO_FW_ChannelNamesOPFOR pushBack (missionNamespace getVariable ["UO_FW_ACRE_OPFOR_RADIONET_NAME7",""]);
	{
		_index = _forEachIndex + 1;
		_x params ["_name"];
		if (_name != "") then {
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_OPFOR, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};

	} foreach UO_FW_ChannelNamesOPFOR;
};
UO_FW_ChannelNamesINDEPENDENT = [];
if (UO_FW_ACRE_INDEPENDENT_RADIONET_Enabled  && (side player == independent)) then {

	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME1",""]);
	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME2",""]);
	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME3",""]);
	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME4",""]);
	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME5",""]);
	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME6",""]);
	UO_FW_ChannelNamesINDEPENDENT pushBack (missionNamespace getVariable ["UO_FW_ACRE_INDEPENDENT_RADIONET_NAME7",""]);
	{
		_index = _forEachIndex + 1;
		_x params ["_name"];
		if (_name != "") then {
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_INDEPENDENT, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};

	} foreach UO_FW_ChannelNamesINDEPENDENT;
};
UO_FW_ChannelNamesCIVILIAN = [];
if (UO_FW_ACRE_CIVILIAN_RADIONET_Enabled   && (side player == civilian)) then {

	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME1",""]);
	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME2",""]);
	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME3",""]);
	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME4",""]);
	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME5",""]);
	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME6",""]);
	UO_FW_ChannelNamesCIVILIAN pushBack (missionNamespace getVariable ["UO_FW_ACRE_CIVILIAN_RADIONET_NAME7",""]);
	{
		_index = _forEachIndex + 1;
		_x params ["_name"];
		if (_name != "") then {
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_CIVILIAN, _index, _label, _name] call acre_api_fnc_setPresetChannelField;
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};

	} foreach UO_FW_ChannelNamesCIVILIAN;
};
["","Setting Netnames. Blu:" + (str UO_FW_ChannelNamesBLUFOR) + " Opf: "+ (str UO_FW_ChannelNamesOPFOR)
 + " Ind: " + (str UO_FW_ChannelNamesINDEPENDENT) + " Civ: " + (str UO_FW_ChannelNamesCIVILIAN)] call UO_FW_fnc_DebugMessageDetailed;

if (hasinterface) then {
	[{(!isNull player) && (isNull acre_player) && ([] call acre_api_fnc_isInitialized)}, {

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
				_presetTemp = UO_FW_Presets_BLUFOR;
			};
			case east: {
				_presetTemp = UO_FW_Presets_OPFOR;
			};
			case independent: {
				_presetTemp = UO_FW_Presets_INDEPENDENT;
			};
			default {
				_presetTemp = UO_FW_Presets_CIVILIAN;
			};
		};

		if (UO_FW_ACRE_SCRAMBLE_Enabled) then {
			["","Enabling Acre Scramble with " + _presetTemp] call UO_FW_fnc_DebugMessageDetailed;
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
			["","Babbel Stuff"] call UO_FW_fnc_DebugMessageDetailed;
			UO_FW_CURRENTBABEL_LANGUAGES = [["en", "English"],
			["ru", "Russian"],
			["fr", "French"],
			["ar", "Arabic"],
			["gk", "Greek"]];

			_names = [	"UO_FW_ACRE_BLUFOR_BABEL_Custom","UO_FW_ACRE_BLUFOR_BABEL_Custom2",
						"UO_FW_ACRE_OPFOR_BABEL_Custom","UO_FW_ACRE_OPFOR_BABEL_Custom2",
						"UO_FW_ACRE_INDEPENDENT_BABEL_Custom","UO_FW_ACRE_INDEPENDENT_BABEL_Custom2",
						"UO_FW_ACRE_CIVILIAN_BABEL_Custom","UO_FW_ACRE_CIVILIAN_BABEL_Custom2"];

			{
				_index = _forEachIndex + 1;
				UO_FW_CURRENTBABEL_LANGUAGES pushBack ["cl" + (str _index),(missionNamespace getVariable [_x,""])];
			} forEach _names;
			["",format ["Acre Babel Lanugages: %1",UO_FW_CURRENTBABEL_LANGUAGES]] call UO_FW_fnc_DebugMessageDetailed;
			{_x call acre_api_fnc_babelAddLanguageType;} foreach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES = [];
			if (UO_FW_ACRE_BLUFOR_BABEL_EN) then {UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "en"; };
			if (UO_FW_ACRE_BLUFOR_BABEL_RU) then {	UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ru"; };
			if (UO_FW_ACRE_BLUFOR_BABEL_FR) then {UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "fr"; };
			if (UO_FW_ACRE_BLUFOR_BABEL_AR) then {UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ar"; };
			if (UO_FW_ACRE_BLUFOR_BABEL_GK) then {	UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
						UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack (_language select 0);
					};
				} forEach ["UO_FW_ACRE_BLUFOR_BABEL_Custom","UO_FW_ACRE_BLUFOR_BABEL_Custom2"];
			} forEach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_OPFOR_BABEL_LANGUAGES = [];
			if (UO_FW_ACRE_OPFOR_BABEL_EN) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "en"; };
			if (UO_FW_ACRE_OPFOR_BABEL_RU) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ru"; };
			if (UO_FW_ACRE_OPFOR_BABEL_FR) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "fr"; };
			if (UO_FW_ACRE_OPFOR_BABEL_AR) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ar"; };
			if (UO_FW_ACRE_OPFOR_BABEL_GK) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
						UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack (_language select 0);
					};
				} forEach ["UO_FW_ACRE_OPFOR_BABEL_Custom","UO_FW_ACRE_OPFOR_BABEL_Custom2"];
			} forEach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES = [];
			if (UO_FW_ACRE_INDEPENDENT_BABEL_EN) then {UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "en"; };
			if (UO_FW_ACRE_INDEPENDENT_BABEL_RU) then {	UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "ru"; };
			if (UO_FW_ACRE_INDEPENDENT_BABEL_FR) then {UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "fr"; };
			if (UO_FW_ACRE_INDEPENDENT_BABEL_AR) then {UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "ar"; };
			if (UO_FW_ACRE_INDEPENDENT_BABEL_GK) then {	UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
						UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack (_language select 0);
					};
				} forEach ["UO_FW_ACRE_INDEPENDENT_BABEL_Custom","UO_FW_ACRE_INDEPENDENT_BABEL_Custom2"];
			} forEach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES = [];
			if (UO_FW_ACRE_CIVILIAN_BABEL_EN) then {UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "en"; };
			if (UO_FW_ACRE_CIVILIAN_BABEL_RU) then {	UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "ru"; };
			if (UO_FW_ACRE_CIVILIAN_BABEL_FR) then {UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "fr"; };
			if (UO_FW_ACRE_CIVILIAN_BABEL_AR) then {UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "ar"; };
			if (UO_FW_ACRE_CIVILIAN_BABEL_GK) then {	UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if (_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then {
						UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack (_language select 0);
					};
				} forEach ["UO_FW_ACRE_CIVILIAN_BABEL_Custom","UO_FW_ACRE_CIVILIAN_BABEL_Custom2"];
			} forEach UO_FW_CURRENTBABEL_LANGUAGES;


			if (UO_FW_ACRE_BLUFOR_BABEL_Enabled  && (side player == west)) then {
						UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

						private _languages = player getVariable ["UO_FW_Languages", []];

						if (count _languages > 0) then {

							_languages call acre_api_fnc_babelSetSpokenLanguages;

						};
			};

			if (UO_FW_ACRE_OPFOR_BABEL_Enabled  && (side player == east)) then {
						UO_FW_ACRE_OPFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

						private _languages = player getVariable ["UO_FW_Languages", []];

						if (count _languages > 0) then {

							_languages call acre_api_fnc_babelSetSpokenLanguages;

						};
			};

			if (UO_FW_ACRE_INDEPENDENT_BABEL_Enabled  && (side player == independent)) then {
						UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

						private _languages = player getVariable ["UO_FW_Languages", []];

						if (count _languages > 0) then {

							_languages call acre_api_fnc_babelSetSpokenLanguages;

						};
			};

			if (UO_FW_ACRE_CIVILIAN_BABEL_Enabled  && (side player == civilian)) then {
						UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;

						private _languages = player getVariable ["UO_FW_Languages", []];

						if (count _languages > 0) then {

							_languages call acre_api_fnc_babelSetSpokenLanguages;

						};
			};

		};
	}] call CBA_fnc_waitUntilAndExecute;
};
