

_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["Medical Settings", "Setting medical nonsense without modules.", "TinfoilHate"] call FNC_RegisterModule;
    _medicalParam = ["MedicalType",(_logic getVariable ["ReviveArgument",1])] call BIS_fnc_getParamValue;
    if (_medicalParam == 1) then
     {
    	ACE_medical_enableRevive = 1;
    } else
    {
    	ACE_medical_enableRevive = 0;
    };

};
