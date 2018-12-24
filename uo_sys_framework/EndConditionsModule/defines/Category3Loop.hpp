if (missionNamespace getVariable ["UO_FW_EndCondition_Enabled_3",false]) then
{
	if ((isNil "UO_FW_EndCondition_Message_3") || !(typename UO_FW_EndCondition_Message_3 isEqualto "STRING")) then
	{
		["","invalid message for End Condition Category 3"] call UO_FW_fnc_DebugMessageDetailed;

	} else
	{
		["","Valid message for End Condition Category 3, executing"] call UO_FW_fnc_DebugMessageDetailed;
		//_conditionsCategory3 = [[UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_3,UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_3],[UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_3,UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_3],[UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_3,UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_3],[UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_3,UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_3],[UO_FW_EndCondition_EntitiesAlive_Array_3,UO_FW_EndCondition_EntitiesDead_Array_3,UO_FW_EndCondition_EntitiesDamaged_Array_3,UO_FW_EndCondition_EntitiesDeadORDamaged_Array_3],[UO_FW_EndCondition_CustomVariables_Array_3]];
		//casualties index 0
		//blufor casualty index 0 select 0
		//blufor cas percentage index 0 select 0 select 1
		//opfor cas enabled index 0 select 1 select 0
		//opfor cas percentage index 0 select 1 select 1
		//entities index 1
		//entities alive index 1 select 0
		//custom variables index 2

		_conditionsCountCategory3 = 0;

		if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_3) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_3) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_3) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_3) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};

		if (!(UO_FW_EndCondition_EntitiesAlive_Array_3 isEqualto "")) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (!(UO_FW_EndCondition_EntitiesDead_Array_3 isEqualto "")) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (!(UO_FW_EndCondition_EntitiesDamaged_Array_3 isEqualto "")) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (!(UO_FW_EndCondition_HostageRescued_Array_3 isEqualto "")) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (!(UO_FW_EndCondition_CustomVariables_Array_3 isEqualto "")) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};
		if (!(UO_FW_EndCondition_CaptureZoneEnabled_3 isEqualto "")) then {_conditionsCountCategory3 = _conditionsCountCategory3 + 1;};

		_tempdebugtext = format ["Category 3 Condition Count:%1",_conditionsCountCategory3];
		["",_tempdebugtext] call UO_FW_fnc_DebugMessageDetailed;
		if ((_conditionsCountCategory3) > 0) then
		{
			//spawn loop
			[] spawn {
				while {!UO_FW_MissionEnded} do
				{


					_ConditionCheckList = [];

					//Casualty Checks
					_BluforCasConditionCheck = false;

					if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_3) then
					{
						_westCasualty = UO_FW_TeamSetting_Blufor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_westCasualty >= UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_3) then {_BluforCasConditionCheck = true;} else {_BluforCasConditionCheck = false;};
						_ConditionCheckList pushback ["BLUFOR Cas Check",_BluforCasConditionCheck];
					};

					_OpforCasConditionCheck = false;

					if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_3) then
					{
						_eastCasualty = UO_FW_TeamSetting_Opfor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_eastCasualty >= UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_3) then {_OpforCasConditionCheck = true;} else {_OpforCasConditionCheck = false;};
						_ConditionCheckList pushback ["OPFOR Cas Check",_OpforCasConditionCheck];
					};

					_IndforCasConditionCheck = false;

					if (UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_3) then
					{
						_resCasualty = UO_FW_TeamSetting_Indfor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_resCasualty >= UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_3) then {_IndforCasConditionCheck = true;} else {_IndforCasConditionCheck = false;};
						_ConditionCheckList pushback ["INDFOR Cas Check",_IndforCasConditionCheck];
					};

					_CivilianCasConditionCheck = false;

					if (UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_3) then
					{
						_civCasualty = UO_FW_TeamSetting_Civ_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_civCasualty >= UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_3) then {_CivilianCasConditionCheck = true;} else {_CivilianCasConditionCheck = false;};
						_ConditionCheckList pushback ["CIVILIAN Cas Check",_CivilianCasConditionCheck];
					};

					//alive entity block
					_aliveUnitArray = missionNamespace getVariable ["UO_FW_EndCondition_EntitiesAlive_Array_3",[]];
					if (!(_aliveUnitArray isEqualto [])) then
					{

						["",format ["Alive Array 3:%1",_aliveUnitArray]] call UO_FW_fnc_DebugMessageDetailed;
						_alive = true;
						{
							_unit = missionNamespace getVariable [_x,objNull];
							if(typename _unit == "OBJECT" && _unit != objNull) then
							{
								_alive = _alive && (_unit call UO_FW_FNC_alive);
							}
							else
							{
								_alive = false;
								["Unit " + _x + " not found!","Unit " + _x + " not found!"] call UO_FW_fnc_DebugMessageDetailed;
							};


						} forEach _aliveUnitArray;
						_ConditionCheckList pushback ["Alive Check",_alive];

					};

					//dead entity block
					_deadUnitArray = missionNamespace getVariable ["UO_FW_EndCondition_EntitiesDead_Array_3",[]];
					if (!(_deadUnitArray isEqualto [])) then
					{
						["",format ["Dead Array 3:%1",_deadUnitArray]] call UO_FW_fnc_DebugMessageDetailed;
						_dead = true;
						{
							_unit = missionNamespace getVariable [_x,objNull];
							if(typename _unit == "OBJECT" && _unit != objNull) then
							{
								_dead = _dead && (!(_unit call UO_FW_FNC_alive));
							}
							else
							{
								_dead = false;
								["Unit " + _x + " not found!","Unit " + _x + " not found!"] call UO_FW_fnc_DebugMessageDetailed;
							};


						} forEach _deadUnitArray;
						_ConditionCheckList pushback ["Dead Check",_dead];
					};

					//damaged & immobilized entity block
					_damagedUnitArray = missionNamespace getVariable ["UO_FW_EndCondition_EntitiesDamaged_Array_3",[]];
					if (!(_damagedUnitArray isEqualto [])) then
					{

						["",format ["Damaged Array 3:%1",_damagedUnitArray]] call UO_FW_fnc_DebugMessageDetailed;

						_damaged = true;
						{
							_unit = missionNamespace getVariable [_x,objNull];
							if(typename _unit == "OBJECT" && _unit != objNull) then
							{
								_damaged = _damaged && ((damage _unit > 0.5) || ((_unit isKindOf LandVehicle) && (!canMove _unit)));
							}
							else
							{
								_damaged = false;
								["Unit " + _x + " not found!","Unit " + _x + " not found!"] call UO_FW_fnc_DebugMessageDetailed;
							};


						} forEach _damagedUnitArray;
						_ConditionCheckList pushback ["Damaged Check",_damaged];
					};

					//rescued hostage block
					_hostageRescuedArray = missionNamespace getVariable ["UO_FW_EndCondition_HostageRescued_Array_3",[]];
					if (!(_hostageRescuedArray isEqualto [])) then
					{

						["",format ["Rescued Array 3:%1",_hostageRescuedArray]] call UO_FW_fnc_DebugMessageDetailed;

						_rescued = true;
						{
							_unit = missionNamespace getVariable [_x,objNull];
							if(!(_unit isEqualto objNull) &&  (_unit call UO_FW_FNC_alive)) then
							{
								_rescued = _rescued && (_unit call UO_FW_FNC_HostageIsRescued);
							}
							else
							{
								_rescued = false;
								["Unit " + _x + " not found!","Unit " + _x + " not found!"] call UO_FW_fnc_DebugMessageDetailed;
							};

						} forEach _hostageRescuedArray;
						_ConditionCheckList pushback ["Rescued Check",_rescued];
					};

					//custom variables block
					_customVariablesArray = missionNamespace getVariable ["UO_FW_EndCondition_CustomVariables_Array_3",[]];
					if (!(_customVariablesArray isEqualto [])) then
					{
						_tempdebugtext3 = format ["Var Array 3:%1",UO_FW_EndCondition_CustomVariables_Array_3];
						["",_tempdebugtext3] call UO_FW_fnc_DebugMessageDetailed;
						_custom = true;
						{
							if(isNil _x) then
							{
								["Variable " + _x + " does not exist!","Variable " + _x + " does not exist!"] call UO_FW_fnc_DebugMessageDetailed;
								_custom = false;
							}
							else
							{
								_Var = missionNamespace getVariable _x;
								_custom = _custom && _Var;
								_checklisttext = format ["Custom Var Check: %1", _x];
								_ConditionCheckList pushback [_checklisttext,_custom];
							};
						} forEach _customVariablesArray;
					};



					//CaptureZoneBlock
					//UO_FW_DEBUG("","")

					_CaptureZoneConditionCheck = false;

					_captureZones_Array_3 = missionNamespace getVariable ["UO_FW_EndCondition_CaptureZoneCaptured_Array_3",[]];
					if (!(_captureZones_Array_3 isEqualto [])) then {
						//derp
						_zone = true;
						_captureZones_TeamArray_3 = missionNamespace getVariable ["UO_FW_EndCondition_CaptureZoneCaptured_Team_3",[]];
						{
							if !(_x in CaptureZone_Array) then {
								["CaptureZone " + _x + " does not exist!","CaptureZone " + _x + " does not exist!"] call UO_FW_fnc_DebugMessageDetailed;
								_zone = false;
							} else {
								private _capturezonetext = format ["CaptureZoneCheck: %1",_x];
								private _varstring = _x + "_var";
								private _varTeamstring = _x + "_teamControlling";
								if (!(_captureZones_TeamArray_3 isEqualto [])) then {
									private _varvalue = missionNamespace getVariable _varstring;
									private _varTeamstringvalue = missionNamespace getVariable _varTeamstring;
									_zone = _zone && _varvalue && (_varTeamstring in _captureZones_TeamArray_3);
									_checklisttext = format ["CaptureZoneCheck Check: %1", _x];
		 							_ConditionCheckList pushback [_checklisttext,_zone];
								} else {
									private _varvalue = missionNamespace getVariable _varstring;
									_zone = _zone && _varvalue;
									_checklisttext = format ["CaptureZoneCheck Check: %1", _x];
		 							_ConditionCheckList pushback [_checklisttext,_zone];
								};
								_ConditionCheckList pushback [_capturezonetext,_CaptureZoneConditionCheck];
							};
						} foreach _captureZones_Array_3;
					};

					_tempdebugtext2 = format ["Category 3 _ConditionCheckList:%1",_ConditionCheckList];
					["",_tempdebugtext2] call UO_FW_fnc_DebugMessageDetailed;

					_ExtractionCheck = false;

					//check block
					if (UO_FW_EndCondition_ExtractionEnabled_3) then
					{
						_team = [UO_FW_TeamSetting_Blufor_TeamName,UO_FW_TeamSetting_Opfor_TeamName,UO_FW_TeamSetting_Indfor_TeamName,UO_FW_TeamSetting_Civ_TeamName] select UO_FW_EndCondition_ExtractionTeam_3;
						if (UO_FW_EndCondition_ExtractionMarker_3 isEqualto "") exitwith {["","No marker entered for extract zone for Category 3!"] call UO_FW_fnc_DebugMessageDetailed;};
						if (getMarkerColor UO_FW_EndCondition_ExtractionMarker_3 isEqualto "") exitwith {["","Invalid extract marker for Category 3!"] call UO_FW_fnc_DebugMessageDetailed;};
							if ([_team,UO_FW_EndCondition_ExtractionMarker_3,UO_FW_EndCondition_ExtractionRatio_3] call UO_FW_fnc_hasExtracted) then {
								_ExtractionCheck = true;
							} else {
								_ExtractionCheck = false;
							};
					}
					else
					{
						_ExtractionCheck = true;
					};

					if (_ExtractionCheck) then
					{
						if (UO_FW_EndCondition_Mode_3 == 1) then
						{
							{
								_x params ["_name","_value"];
								if (_value) exitwith
								{
										UO_FW_DEBUG("",format ["Category 3 Ending due to :%1",_value])

										UO_FW_EndCondition_Message_3 call UO_FW_fnc_EndMission;
								};
							} foreach _ConditionCheckList;
						}
						else
						{
							if (([_ConditionCheckList,false] call UO_FW_fnc_arrayFindAll) isEqualto 0) exitwith
							{
								UO_FW_DEBUG("","Category 3 Ending due to all conditions met!")

								UO_FW_EndCondition_Message_3 call UO_FW_fnc_EndMission;
							};
						};
					};
					sleep(missionNamespace getvariable ["UO_FW_ConditionSleep",30]);
				};
			};
		} else {
			["","No Conditions for Category 3"] call UO_FW_fnc_DebugMessageDetailed;
		};
	};
};
