if (UO_FW_EndCondition_Enabled_1) then
{
	if ((isNil "UO_FW_EndCondition_Message_1") || !(typename UO_FW_EndCondition_Message_1 isEqualto "STRING")) then 
	{
		["","invalid message for End Condition Category 1"] call UO_FW_fnc_DebugMessageDetailed;
		
	} else 
	{
		["","Valid message for End Condition Category 1, executing"] call UO_FW_fnc_DebugMessageDetailed;
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
		
		if (!(UO_FW_EndCondition_CapturezoneEnabled_1 isEqualto "")) then {_conditionsCountCategory1 = _conditionsCountCategory1 + 1;};

		_tempdebugtext = format ["Category 1 Condition Count:%1",_conditionsCountCategory1];
		["",_tempdebugtext] call UO_FW_fnc_DebugMessageDetailed;
		if ((_conditionsCountCategory1) > 0) then 
		{
			//spawn loop
			[] spawn {
				while {!UO_FW_MissionEnded} do 
				{
					sleep(missionNamespace getvariable ["UO_FW_ConditionSleep",30]);
					
					_ConditionCheckList = [];
					
					//Casualty Checks
					_BluforCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_1) then 
					{
						_westCasualty = UO_FW_TeamSetting_Blufor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_westCasualty >= UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_1) then {_BluforCasConditionCheck = true;} else {_BluforCasConditionCheck = false;};
						_ConditionCheckList pushback ["BLUFOR Cas Check",_BluforCasConditionCheck];
					};
					
					_OpforCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_1) then 
					{
						_eastCasualty = UO_FW_TeamSetting_Opfor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_eastCasualty >= UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_1) then {_OpforCasConditionCheck = true;} else {_OpforCasConditionCheck = false;};
						_ConditionCheckList pushback ["OPFOR Cas Check",_OpforCasConditionCheck];
					};
					
					_IndforCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_1) then 
					{
						_resCasualty = UO_FW_TeamSetting_Indfor_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_resCasualty >= UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_1) then {_IndforCasConditionCheck = true;} else {_IndforCasConditionCheck = false;};
						_ConditionCheckList pushback ["INDFOR Cas Check",_IndforCasConditionCheck];
					};
					
					_CivilianCasConditionCheck = false;
					
					if (UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_1) then 
					{
						_civCasualty = UO_FW_TeamSetting_Civ_TeamName call UO_FW_fnc_CasualtyPercentage;
						if (_civCasualty >= UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_1) then {_CivilianCasConditionCheck = true;} else {_CivilianCasConditionCheck = false;};
						_ConditionCheckList pushback ["CIVILIAN Cas Check",_CivilianCasConditionCheck];
					};
					
					//alive entity block
					if (!(UO_FW_EndCondition_EntitiesAlive_Array_1 isEqualto "")) then 
					{
						_tempdebugtext6 = format ["Alive Array 1:%1",UO_FW_EndCondition_EntitiesAlive_Array_1];
						["",_tempdebugtext6] call UO_FW_fnc_DebugMessageDetailed;
						if ((UO_FW_EndCondition_EntitiesAlive_Array_1 find ",") >= 0) then 
						{
							private _EntityAlive_Array_Separate_1 = UO_FW_EndCondition_EntitiesAlive_Array_1 splitstring ",";
							_tempdebugtext5 = format ["Alive Separated Array:%1",_EntityAlive_Array_Separate_1];
							["",_tempdebugtext5] call UO_FW_fnc_DebugMessageDetailed;
							{
								call compile format ["
									_%1handle = false;
									if (isNull '%1') then {%1 = false;} else {
										if (alive %1) then {_%1handle = true;} else {_%1handle = false;};
									};
									_ConditionCheckList pushback ['Alive:%1 Check',_%1handle];
								",_x];
							} foreach _EntityAlive_Array_Separate_1;
						} else 
						{
						
							call compile format ["
								_%1handle = false;
								if (isNull '%1') then {%1 = false;} else {
									if (alive %1) then {_%1handle = true;} else {_%1handle = false;};
								};
								_ConditionCheckList pushback ['Alive:%1 Check',_%1handle];
							",UO_FW_EndCondition_EntitiesAlive_Array_1];
						};
					};
					
					//dead entity block
					if (!(UO_FW_EndCondition_EntitiesDead_Array_1 isEqualto "")) then 
					{
						_tempdebugtext7 = format ["Dead Array 1:%1",UO_FW_EndCondition_EntitiesDead_Array_1];
						["",_tempdebugtext7] call UO_FW_fnc_DebugMessageDetailed;
						if ((UO_FW_EndCondition_EntitiesDead_Array_1 find ",") >= 0) then
						 {
							private _EntityDead_Array_Separate_1 = UO_FW_EndCondition_EntitiesDead_Array_1 splitstring ",";
							_tempdebugtext8 = format ["Dead Separated Array:%1",_EntityDead_Array_Separate_1];
							["",_tempdebugtext8] call UO_FW_fnc_DebugMessageDetailed;
							{
								call compile format ["
									_%1handle = false;
									if (isNull '%1') then {%1 = false;} else {
										if (!alive %1) then {_%1handle = true;} else {_%1handle = false;};
									};
									_ConditionCheckList pushback ['Dead:%1 Check',_%1handle];
								",_x];
							} foreach _EntityDead_Array_Separate_1;
						} else {
						
							call compile format ["
								_%1handle = false;
								if (isNull '%1') then {%1 = false;} else {
									if (!alive %1) then {_%1handle = true;} else {_%1handle = false;};
								};
								_ConditionCheckList pushback ['Dead:%1 Check',_%1handle];
							",UO_FW_EndCondition_EntitiesDead_Array_1];
						};
					};
					
					//damaged & immobilized entity block
					if (!(UO_FW_EndCondition_EntitiesDamaged_Array_1 isEqualto "")) then 
					{
						_tempdebugtext9 = format ["Damaged Array 1:%1",UO_FW_EndCondition_EntitiesDamaged_Array_1];
						["",_tempdebugtext9] call UO_FW_fnc_DebugMessageDetailed;
						if ((UO_FW_EndCondition_EntitiesDamaged_Array_1 find ",") >= 0) then 
						{
							private _EntityDamaged_Array_Separate_1 = UO_FW_EndCondition_EntitiesDamaged_Array_1 splitstring ",";
							_tempdebugtext10 = format ["Damaged Separated Array:%1",_EntityDamaged_Array_Separate_1];
							["",_tempdebugtext10] call UO_FW_fnc_DebugMessageDetailed;
							{
								call compile format ["
									_%1handle = false;
									if (isNull '%1') then {%1 = false;} else {
										if ((damage %1 > 0.5) || ((%1 isKindOf ""LandVehicle"") && (!canMove %1))) then {_%1handle = true;} else {_%1handle = false;};
									};
									_ConditionCheckList pushback ['Damaged:%1 Check',_%1handle];
								",_x];
							} foreach _EntityDamaged_Array_Separate_1;
						} else {
						
							call compile format ["
								_%1handle = false;
								if (isNull '%1') then {%1 = false;} else {
										if (((damage %1) >= 0.5) || ((%1 isKindOf ""LandVehicle"") && (!canMove %1))) then {_%1handle = true;} else {_%1handle = false;};
									};
								_ConditionCheckList pushback ['Damaged:%1 Check',_%1handle];
							",UO_FW_EndCondition_EntitiesDamaged_Array_1];
						};
					};
					
					//custom variables block
					if (!(UO_FW_EndCondition_CustomVariables_Array_1 isEqualto "")) then 
					{
						_tempdebugtext3 = format ["Var Array 1:%1",UO_FW_EndCondition_CustomVariables_Array_1];
						["",_tempdebugtext3] call UO_FW_fnc_DebugMessageDetailed;
						if ((UO_FW_EndCondition_CustomVariables_Array_1 find ",") >= 0) then
						 {
							private _CustomVariables_Array_1Separate = UO_FW_EndCondition_CustomVariables_Array_1 splitstring ",";
							_tempdebugtext4 = format ["Custom Var Separated Array:%1",_CustomVariables_Array_1Separate];
							["",_tempdebugtext4] call UO_FW_fnc_DebugMessageDetailed;
							{
								call compile format ["
									_%1handle = false;
									if (isNil '%1') then {%1 = false;} else {
										if (%1) then {_%1handle = true;} else {_%1handle = false;};
									};
									_ConditionCheckList pushback ['Custom Var:%1 Check',_%1handle];
								",_x];
							} foreach _CustomVariables_Array_1Separate;
						} else 
						{
						
							call compile format ["
								_%1handle = false;
								if (isNil '%1') then {%1 = false;} else {
									if (%1) then {_%1handle = true;} else {_%1handle = false;};
								};
								_ConditionCheckList pushback ['Custom Var:%1 Check',_%1handle];
							",UO_FW_EndCondition_CustomVariables_Array_1];
						};
					};
					
					_tempdebugtext2 = format ["Category 1 _ConditionCheckList:%1",_ConditionCheckList];
					["",_tempdebugtext2] call UO_FW_fnc_DebugMessageDetailed;
					
					//capturezoneBlock
					
					_CapturezoneConditionCheck = false;
					
					if (UO_FW_EndCondition_CapturezoneEnabled_1) then 
					{
						_type = UO_FW_EndCondition_CapturezoneMarker_1 call UO_FW_FNC_IsCapturezoneCaptured;
						
						_CapturezoneConditionCheck = (_type == (["NOONE","BLUFOR","OPFOR","RESISTANCE","CIV"] select UO_FW_EndCondition_CapturezoneTeam_1));
						
						_ConditionCheckList pushback ["CapturezoneCheck",_CapturezoneConditionCheck];
					};
					_ExtractionCheck = false;
					
					//check block
					if (UO_FW_EndCondition_ExtractionEnabled_1) then 
					{
						_team = [UO_FW_TeamSetting_Blufor_TeamName,UO_FW_TeamSetting_Opfor_TeamName,UO_FW_TeamSetting_Indfor_TeamName,UO_FW_TeamSetting_Civ_TeamName] select UO_FW_EndCondition_ExtractionTeam_1;
						if (UO_FW_EndCondition_ExtractionMarker_1 isEqualto "") exitwith {["","No marker entered for extract zone for Category 1!"] call UO_FW_fnc_DebugMessageDetailed;};
						if (getMarkerColor UO_FW_EndCondition_ExtractionMarker_1 isEqualto "") exitwith {["","Invalid extract marker for Category 1!"] call UO_FW_fnc_DebugMessageDetailed;};
							if ([_team,UO_FW_EndCondition_ExtractionMarker_1,UO_FW_EndCondition_ExtractionRatio_1] call UO_FW_fnc_hasExtracted) then {	
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
						if (UO_FW_EndCondition_Mode_1 == 1) then 
						{
							{
								_x params ["_name","_value"];
								if (_value) exitwith 
								{
										sleep(missionNamespace getvariable ["UO_FW_EndCondition_EndDelay",30]);
										UO_FW_EndCondition_Message_1 call UO_FW_fnc_EndMission;
									};
							} foreach _ConditionCheckList;
						} 
						else 
						{
							if (count ([_ConditionCheckList,false] call UO_FW_fnc_arrayFindAll) <= 0) exitwith 
							{
								sleep(missionNamespace getvariable ["UO_FW_EndCondition_EndDelay",30]);
								UO_FW_EndCondition_Message_1 call UO_FW_fnc_EndMission;
							};
						};
					};
				};
			};
		} else {
			["","No Conditions for Category 1"] call UO_FW_fnc_DebugMessageDetailed;
		};
	};
};