params ["_player"];
	private _logic = UO_FW_NonCombatantModule;
	private _inarea = false;
	{
		private _area = [getPosATL _x,(_x getVariable ["aePositionRadiusX",0]),(_x getVariable ["aePositionRadiusY",0]),getDir _x,(if((typeof _x) isEqualTo "UO_FW_PositionModule_R") then {true} else {false})];
		_inarea = _inarea || (_player inArea _area);
	} foreach ([_logic,["UO_FW_PositionModule","UO_FW_PositionModule_R"]] call UO_AI_fnc_getSyncedModules);
	_inarea