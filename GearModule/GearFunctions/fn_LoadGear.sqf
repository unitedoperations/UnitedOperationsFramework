_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.

#define ADDGEAR(NAME) \
_gear = _logic getVariable [NAME,""];\
if(_gear != "") then{    FW_GearList append (compile _gear);};

if(_activated) then
{
    ADDGEAR("Gear1Argument");
    ADDGEAR("Gear2Argument");
    ADDGEAR("Gear3Argument");
    ADDGEAR("Gear4Argument");
    ADDGEAR("Gear5Argument");
    ADDGEAR("Gear6Argument");
    ADDGEAR("Gear7Argument");
    ADDGEAR("Gear8Argument");
    ADDGEAR("Gear9Argument");
    ADDGEAR("Gear10Argument");

};
