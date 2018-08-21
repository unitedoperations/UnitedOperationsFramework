/*	Description: Checks ACRE module values and sets options accordingly
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

if (!UO_FW_ACRE_SETTINGS_ENABLED) exitwith {};
["ACRE Setup", "Module for Acre Settings", "Sacher"] call UO_FW_FNC_RegisterModule; 
UO_FW_Presets = ["default2", "default3", "default4", "default"];
UO_FW_Presets_BLUFOR = UO_FW_Presets select 0;
UO_FW_Presets_OPFOR = UO_FW_Presets select 1;
UO_FW_Presets_INDEPENDENT = UO_FW_Presets select 2;
UO_FW_Presets_CIVILIAN = UO_FW_Presets select 3;
//blu,opf,indep,civ

//Channel names stuff
["","ACRE Init"] call UO_FW_fnc_DebugMessageDetailed;
UO_FW_ChannelNamesBLUFOR = [];
if(UO_FW_ACRE_BLUFOR_RADIONET_ENABLED  && isServer) then
{
	
	
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
		if(_name != "") then 
		{
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_BLUFOR, (str _index), _label, _name] remoteExecCall ["acre_api_fnc_setPresetChannelField", 0, true];
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};
		
	} foreach UO_FW_ChannelNamesBLUFOR;
};
UO_FW_ChannelNamesOPFOR = [];
if(UO_FW_ACRE_OPFOR_RADIONET_ENABLED  && isServer) then
{
	
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
		if(_name != "") then 
		{
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_OPFOR, (str _index), _label, _name] remoteExecCall ["acre_api_fnc_setPresetChannelField", 0, true];
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};
		
	} foreach UO_FW_ChannelNamesOPFOR;
};
UO_FW_ChannelNamesINDEPENDENT = [];
if(UO_FW_ACRE_INDEPENDENT_RADIONET_ENABLED  && isServer) then
{
	
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
		if(_name != "") then 
		{
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_INDEPENDENT, (str _index), _label, _name] remoteExecCall ["acre_api_fnc_setPresetChannelField", 0, true];
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};
		
	} foreach UO_FW_ChannelNamesINDEPENDENT;
};
UO_FW_ChannelNamesCIVILIAN = [];
if(UO_FW_ACRE_CIVILIAN_RADIONET_ENABLED  && isServer) then
{
	
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
		if(_name != "") then 
		{
			{
				_label = [_x, "label"] call acre_api_fnc_mapChannelFieldName;
				[_x, UO_FW_Presets_CIVILIAN, (str _index), _label, _name] remoteExecCall ["acre_api_fnc_setPresetChannelField", 0, true];
			} forEach ["ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152"];
		};
		
	} foreach UO_FW_ChannelNamesCIVILIAN;
};
["","Setting Netnames. Blu:" + (str UO_FW_ChannelNamesBLUFOR) + " Opf: "+ (str UO_FW_ChannelNamesOPFOR)
 + " Ind: " + (str UO_FW_ChannelNamesINDEPENDENT) + " Civ: " + (str UO_FW_ChannelNamesCIVILIAN)] call UO_FW_fnc_DebugMessageDetailed;

if(!isDedicated) then 
{
	[] spawn 
	{
		waitUntil { ([] call acre_api_fnc_isInitialized)};
		
		private _side = side player;
		private _customSide = (player getVariable ["FW_CustomScramble", nil]);
		UO_FW_Acre_Volume_Value = -1;
		if (!isNil "UO_FW_Acre_Volume_Value") then 
		{
			if ((abs UO_FW_Acre_Volume_Value) > 2) then 
			{
			  UO_FW_Acre_Volume_Value = 0;
			};
			private _v = 0.7;
			switch (UO_FW_Acre_Volume_Value) do 
			{
				case -2: {_v = 0.1;}; 
				case -1: {_v = 0.2;}; 
				case 0: {_v = 0.4;}; 
				case 1: {_v = 0.7;}; 
				case 2: {_v = 1.0;}; 
				default {_v = 0.4;}; 
			};
			[_v] call acre_api_fnc_setSelectableVoiceCurve;
			acre_sys_gui_VolumeControl_Level = UO_FW_Acre_Volume_Value;
			
			[] spawn 
			{
				sleep 1;
				acre_sys_gui_VolumeControl_Level = UO_FW_Acre_Volume_Value;
			};
		};
		if (!isNil "_customSide") then 
		{
			_side = _customSide;
		};



		//BABBLE STUFF
		if(UO_FW_ACRE_BABEL_ENABLED) then
		{
			["","Babbel Stuff"] call UO_FW_fnc_DebugMessageDetailed;
			UO_FW_CURRENTBABEL_LANGUAGES = [["en", "English"],
			["ru", "Russian"],
			["fr", "French"],
			["ar", "Arabic"],
			["gk", "Greek"]];

			_names = [	"UO_FW_ACRE_BLUFOR_BABEL_CUSTOM","UO_FW_ACRE_BLUFOR_BABEL_CUSTOM2",
						"UO_FW_ACRE_OPFOR_BABEL_CUSTOM","UO_FW_ACRE_OPFOR_BABEL_CUSTOM2",
						"UO_FW_ACRE_INDEPENDENT_BABEL_CUSTOM","UO_FW_ACRE_INDEPENDENT_BABEL_CUSTOM2",
						"UO_FW_ACRE_CIVILIAN_BABEL_CUSTOM","UO_FW_ACRE_CIVILIAN_BABEL_CUSTOM2"];

			{
				_index = _forEachIndex + 1;	
				UO_FW_CURRENTBABEL_LANGUAGES pushBack ["cl" + (str _index),(missionNamespace getVariable [_x,""])];
			}forEach _names;	
			["",format ["Acre Babel Lanugages: %1",UO_FW_CURRENTBABEL_LANGUAGES]] call UO_FW_fnc_DebugMessageDetailed;
			{_x call acre_api_fnc_babelAddLanguageType;} foreach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES = [];
			if(UO_FW_ACRE_BLUFOR_BABEL_EN) then {UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "en"; };
			if(UO_FW_ACRE_BLUFOR_BABEL_RU) then {	UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ru"; };
			if(UO_FW_ACRE_BLUFOR_BABEL_FR) then {UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "fr"; };
			if(UO_FW_ACRE_BLUFOR_BABEL_AR) then {UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "ar"; };
			if(UO_FW_ACRE_BLUFOR_BABEL_GK) then {	UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if(_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then 
					{
						UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES pushBack (_language select 0);
					};
				}forEach ["UO_FW_ACRE_BLUFOR_BABEL_CUSTOM","UO_FW_ACRE_BLUFOR_BABEL_CUSTOM2"];
			}forEach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_OPFOR_BABEL_LANGUAGES = [];
			if(UO_FW_ACRE_OPFOR_BABEL_EN) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "en"; };
			if(UO_FW_ACRE_OPFOR_BABEL_RU) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ru"; };
			if(UO_FW_ACRE_OPFOR_BABEL_FR) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "fr"; };
			if(UO_FW_ACRE_OPFOR_BABEL_AR) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "ar"; };
			if(UO_FW_ACRE_OPFOR_BABEL_GK) then {UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if(_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then 
					{
						UO_FW_ACRE_OPFOR_BABEL_LANGUAGES pushBack (_language select 0);
					};
				}forEach ["UO_FW_ACRE_OPFOR_BABEL_CUSTOM","UO_FW_ACRE_OPFOR_BABEL_CUSTOM2"];
			}forEach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES = [];
			if(UO_FW_ACRE_INDEPENDENT_BABEL_EN) then {UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "en"; };
			if(UO_FW_ACRE_INDEPENDENT_BABEL_RU) then {	UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "ru"; };
			if(UO_FW_ACRE_INDEPENDENT_BABEL_FR) then {UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "fr"; };
			if(UO_FW_ACRE_INDEPENDENT_BABEL_AR) then {UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "ar"; };
			if(UO_FW_ACRE_INDEPENDENT_BABEL_GK) then {	UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if(_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then 
					{
						UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES pushBack (_language select 0);
					};
				}forEach ["UO_FW_ACRE_INDEPENDENT_BABEL_CUSTOM","UO_FW_ACRE_INDEPENDENT_BABEL_CUSTOM2"];
			}forEach UO_FW_CURRENTBABEL_LANGUAGES;

			UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES = [];
			if(UO_FW_ACRE_CIVILIAN_BABEL_EN) then {UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "en"; };
			if(UO_FW_ACRE_CIVILIAN_BABEL_RU) then {	UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "ru"; };
			if(UO_FW_ACRE_CIVILIAN_BABEL_FR) then {UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "fr"; };
			if(UO_FW_ACRE_CIVILIAN_BABEL_AR) then {UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "ar"; };
			if(UO_FW_ACRE_CIVILIAN_BABEL_GK) then {	UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack "gk"; };
			{
				_language = _x;
				{
					if(_language select 1 == missionNamespace getVariable [_x,""] &&  missionNamespace getVariable [_x,""] != "" ) then 
					{
						UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES pushBack (_language select 0);
					};
				}forEach ["UO_FW_ACRE_CIVILIAN_BABEL_CUSTOM","UO_FW_ACRE_CIVILIAN_BABEL_CUSTOM2"];
			}forEach UO_FW_CURRENTBABEL_LANGUAGES;


			if(UO_FW_ACRE_BLUFOR_BABEL_ENABLED && isServer && (side player == west)) then
			{		
						UO_FW_ACRE_BLUFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
					
						private _languages = player getVariable ["FW_Languages", []];

						if (count _languages > 0) then 
						{
							
							_languages call acre_api_fnc_babelSetSpokenLanguages;
							
						};
			};

			if(UO_FW_ACRE_OPFOR_BABEL_ENABLED && isServer && (side player == east)) then
			{		
						UO_FW_ACRE_OPFOR_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
					
						private _languages = player getVariable ["FW_Languages", []];

						if (count _languages > 0) then 
						{
							
							_languages call acre_api_fnc_babelSetSpokenLanguages;
							
						};
			};

			if(UO_FW_ACRE_INDEPENDENT_BABEL_ENABLED && isServer && (side player == independent)) then
			{		
						UO_FW_ACRE_INDEPENDENT_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
					
						private _languages = player getVariable ["FW_Languages", []];

						if (count _languages > 0) then 
						{
							
							_languages call acre_api_fnc_babelSetSpokenLanguages;
							
						};
			};

			if(UO_FW_ACRE_CIVILIAN_BABEL_ENABLED && isServer && (side player == civilian)) then
			{		
						UO_FW_ACRE_CIVILIAN_BABEL_LANGUAGES call acre_api_fnc_babelSetSpokenLanguages;
					
						private _languages = player getVariable ["FW_Languages", []];

						if (count _languages > 0) then 
						{
							
							_languages call acre_api_fnc_babelSetSpokenLanguages;
							
						};
			};

		};
		//SCRAMBLE STUFF

		private _side_i = 3;
		switch (_side) do 
		{ 
			case west: { 
				_side_i = 0;
			};
			case east: { 
				_side_i = 1;
			};
			case independent: { 
				_side_i = 2;
			};
			default { 
				_side_i = 3;
			};
		};

		if (UO_FW_ACRE_SCRAMBLE_ENABLED) then
		{
			private _preset = UO_FW_Presets select _side_i;
			["","Enabling Acre Scra,böe"] call UO_FW_fnc_DebugMessageDetailed;
			["ACRE_PRC343", _preset ] call acre_api_fnc_setPreset;
			["ACRE_PRC77", _preset ] call acre_api_fnc_setPreset;
			["ACRE_PRC117F", _preset ] call acre_api_fnc_setPreset;
			["ACRE_PRC152", _preset ] call acre_api_fnc_setPreset;
			["ACRE_PRC148", _preset ] call acre_api_fnc_setPreset;
			["ACRE_SEM52SL", _preset ] call acre_api_fnc_setPreset;
			["ACRE_SEM70", _preset ] call acre_api_fnc_setPreset;
		};
		


		
		waitUntil {!isNull acre_player};
		if(player getVariable ["UO_FW_ACRE_UNITSETTINGS_ENABLE",false]) then
		{
			_radioTemp = [["UO_FW_ACRE_BLUFOR_SR_TYPE","UO_FW_ACRE_BLUFOR_LR_TYPE","UO_FW_ACRE_BLUFOR_PK_TYPE"],
			["UO_FW_ACRE_OPFOR_SR_TYPE","UO_FW_ACRE_OPFOR_LR_TYPE","UO_FW_ACRE_OPFOR_PK_TYPE"],
			["UO_FW_ACRE_INDEPENDENT_SR_TYPE","UO_FW_ACRE_INDEPENDENT_LR_TYPE","UO_FW_ACRE_INDEPENDENT_PK_TYPE"],
			["UO_FW_ACRE_CIVILIAN_SR_TYPE","UO_FW_ACRE_CIVILIAN_LR_TYPE","UO_FW_ACRE_CIVILIAN_PK_TYPE"]];

			
			_radioTempI = _radioTemp select _side_i;	
			_radioType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select (missionNamespace getVariable [_radioTempI select 0,0]);
			if((player getVariable ["UO_FW_ACRE_SR_RADIO_ENABLED",false])) then {player addItem _radioType;};
			{
				private _radioID = [_x] call acre_api_fnc_getRadioByType;
				if (!isNil "_radioID") then 
				{
					[_radioID, (player getVariable ["UO_FW_ACRE_SR_RADIO_CHANNEL",1])] call acre_api_fnc_setRadioChannel;
					[_radioID,( ["CENTER","LEFT","RIGHT"] select  (player getVariable ["UO_FW_ACRE_SR_RADIO_EAR",0]))] call acre_api_fnc_setRadioSpatial;
				};	
			}forEach ["ACRE_PRC343","ACRE_SEM52SL"];
					
			

			_radioType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select (missionNamespace getVariable [_radioTempI select 1,0]);
			if((player getVariable ["UO_FW_ACRE_LR_RADIO_ENABLED",false])) then {player addItem _radioType;}; 
			{
				private _radioID = [_x] call acre_api_fnc_getRadioByType;
				if (!isNil "_radioID") then 
				{
					
					[_radioID, (player getVariable ["UO_FW_ACRE_LR_RADIO_CHANNEL",1])] call acre_api_fnc_setRadioChannel;
					[_radioID,( ["CENTER","LEFT","RIGHT"] select  (player getVariable ["UO_FW_ACRE_LR_RADIO_EAR",0]))] call acre_api_fnc_setRadioSpatial;
				};
			}forEach ["ACRE_PRC148","ACRE_PRC152"];
					
			

			_radioType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select (missionNamespace getVariable [_radioTempI select 2,0]);
			if((player getVariable ["UO_FW_ACRE_PK_RADIO_ENABLED",false])) then {player addItem _radioType;}; 
			{
				private _radioID = [_radioType] call acre_api_fnc_getRadioByType;
				if (!isNil "_radioID") then 
				{
					
					[_radioID, (player getVariable ["UO_FW_ACRE_PK_RADIO_CHANNEL",1])] call acre_api_fnc_setRadioChannel;
					[_radioID,( ["CENTER","LEFT","RIGHT"] select  (player getVariable ["UO_FW_ACRE_PK_RADIO_EAR",0]))] call acre_api_fnc_setRadioSpatial;
				};
			}forEach ["ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"];
					
					


				
		
			private _channels = player getVariable ["UO_FW_Channels", []];
			{
				_x params [
					["_radio", ""],
					["_channel", 1],
					["_spatial", "CENTER"]
				];
				private _radioID = [_radio] call acre_api_fnc_getRadioByType;
				if (!isNil "_radioID") then {
					[_radioID, _channel] call acre_api_fnc_setRadioChannel;
					[_radioID, _spatial] call acre_api_fnc_setRadioSpatial;
				};
			} foreach _channels;
		};		
	};
};

