if (UO_FW_EndCondition_Enabled_1) then {
	if ((isNil "UO_FW_EndCondition_Message_1") || !(typename UO_FW_EndCondition_Message_1 isEqualto "STRING")) then {
		UO_FW_DEBUG("","invalid message for End Condition Category 1")
	} else {
		UO_FW_DEBUG("","valid message for End Condition Category 1, executing")
		//_conditionsCategory1 = [[UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_1,UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_1],[UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_1,UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_1],[UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_1,UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_1],[UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_1,UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_1],[UO_FW_EndCondition_EntitiesAlive_Array_1,UO_FW_EndCondition_EntitiesDead_Array_1,UO_FW_EndCondition_EntitiesDamaged_Array_1,UO_FW_EndCondition_EntitiesDeadORDamaged_Array_1],[UO_FW_EndCondition_CustomVariables_Array_1]];
		//casualties index 0 
		//blufor casualty index 0 select 0
		//blufor cas percentage index 0 select 0 select 1
		//opfor cas enabled index 0 select 1 select 0
		//opfor cas percentage index 0 select 1 select 1
		//entities index 1
		//entities alive index 1 select 0
		//custom variables index 2
		
		_conditionsCountCategory1 = 0;
		
		if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_1) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_1) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		if (UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_1) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		if (UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_1) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
	
		if (!(UO_FW_EndCondition_EntitiesAlive_Array_1 isEqualto "")) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		if (!(UO_FW_EndCondition_EntitiesDead_Array_1 isEqualto "")) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		if (!(UO_FW_EndCondition_EntitiesDamaged_Array_1 isEqualto "")) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		if (!(UO_FW_EndCondition_EntitiesDeadORDamaged_Array_1 isEqualto "")) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		
		if (!(UO_FW_EndCondition_CustomVariables_Array_1 isEqualto "")) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};
		
		_tempdebugtext = format ["Category 1 Condition Count:%1",_conditionsCountCategory1];
		UO_FW_DEBUG("",_tempdebugtext)
		
		if ((_conditionsCountCategory1) > 0) then {
			//spawn loop
			[] spawn {
				while {!UO_FW_MissionEnded} do {
					sleep(missionNamespace getvariable ["UO_FW_ConditionSleep",30]);
					
					_ConditionCheckList = [];
					
					//Casualty Checks
					_BluforCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_1) then {
						_westCasualty = UO_FW_TeamSetting_Blufor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_westCasualty >= UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_1) then {_BluforCasConditionCheck = true;} else {_BluforCasConditionCheck = false;};
						_ConditionCheckList pushback ["BLUFOR Cas Check",_BluforCasConditionCheck];
					};
					
					_OpforCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_1) then {
						_eastCasualty = UO_FW_TeamSetting_Opfor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_eastCasualty >= UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_1) then {_OpforCasConditionCheck = true;} else {_OpforCasConditionCheck = false;};
						_ConditionCheckList pushback ["OPFOR Cas Check",_OpforCasConditionCheck];
					};
					
					_IndforCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_1) then {
						_resCasualty = UO_FW_TeamSetting_Indfor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_resCasualty >= UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_1) then {_IndforCasConditionCheck = true;} else {_IndforCasConditionCheck = false;};
						_ConditionCheckList pushback ["INDFOR Cas Check",_IndforCasConditionCheck];
					};
					
					_CivilianCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_1) then {
						_civCasualty = UO_FW_TeamSetting_Civ_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_civCasualty >= UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_1) then {_CivilianCasConditionCheck = true;} else {_CivilianCasConditionCheck = false;};
						_ConditionCheckList pushback ["CIVILIAN Cas Check",_CivilianCasConditionCheck];
					};
					
					//entity block
					
					//custom variables block
					if (!(UO_FW_EndCondition_CustomVariables_Array_1 isEqualto "")) then {
						_tempdebugtext3 = format ["Var Array 1:%1",UO_FW_EndCondition_CustomVariables_Array_1];
						UO_FW_DEBUG("",_tempdebugtext3)
						if ((UO_FW_EndCondition_CustomVariables_Array_1 find ",") >= 0) then {
							private _CustomVariables_Array_1Separate = UO_FW_EndCondition_CustomVariables_Array_1 splitstring ",";
							_tempdebugtext4 = format ["Custom Var Separated Array:%1",_CustomVariables_Array_1Separate];
							UO_FW_DEBUG("",_tempdebugtext4)
							{
								call compile format ["
									_%1handle = false;
									if (isNil '%1') then {%1 = false;};
									if (%1) then {_%1handle = true;} else {_%1handle = false;};
									_ConditionCheckList pushback ['Custom Var:%1 Check',_%1handle];
								",_x];
							} foreach _CustomVariables_Array_1Separate;
						} else {
						
							call compile format ["
								_%1handle = false;
								if (isNil '%1') then {%1 = false;};
								if (%1) then {_%1handle = true;} else {_%1handle = false;};
								_ConditionCheckList pushback ['Custom Var:%1 Check',_%1handle];
							",UO_FW_EndCondition_CustomVariables_Array_1];
						};
					};
					
					_tempdebugtext2 = format ["Category 1 _ConditionCheckList:%1",_ConditionCheckList];
					UO_FW_DEBUG("",_tempdebugtext2)
					
					//check block
					if (UO_FW_EndCondition_Mode_1 == 1) then {
						{
							_x params ["_name","_value"];
							if (_value) exitwith {UO_FW_EndCondition_Message_1 call UO_FW_fnc_EndMission;};
						} foreach _ConditionCheckList;
					} else {
						if (count ([_ConditionCheckList,false] call UO_FW_fnc_arrayFindAll) <= 0) exitwith {UO_FW_EndCondition_Message_1 call UO_FW_fnc_EndMission;};
					};
				};
			};
		} else {
			UO_FW_DEBUG("","No Conditions for Category 1")
		};
	};
};