// This is here because for whatever reason public setVariable 
// doesn't work properly in the 3den expressions, so this just 
// resets all the variables on the objects.
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
if(isNil {UO_FW_NonCombatantModule}) exitWith {};
_logic = UO_FW_NonCombatantModule;
{
   private _module = _X;
   {
      _module setVariable [_x, _module getVariable _x, true];
   } foreach allVariables _module;
} foreach ([_logic,["UO_FW_PositionModule","UO_FW_PositionModule_R"]] call UO_AI_fnc_getSyncedModules) + [UO_FW_NonCombatantModule];
missionNamespace setVariable ["UO_FW_NonCombatantModule", UO_FW_NonCombatantModule, true];
