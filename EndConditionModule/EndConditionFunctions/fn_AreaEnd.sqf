_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.

_side =_logic getVariable ["AreaEndSideSelectArgument",5];
switch (_side) do
{
    case 1: { _side = west; };
    case 2: { _side = east; };
    case 3: { _side = resistance; };
    case 4: { _side = civilian; };
    default { hint "Are End Side Failure"; if(true) exitWith{}; };
};

_min =_logic getVariable ["AreaMinArgument",0];
_max =_logic getVariable ["AreaMaxArgument",0];
_distance =_logic getVariable ["AreaDistanceArgument",300];
_type =_logic getVariable ["AreaTypeArgument",1];
_timer =_logic getVariable ["AreaEndCheckTimeArgument",60];
_message = missionNamespace getVariable ["AreaMessageArgument",""];
_text = "";
switch (_type) do
{
    case 1: { _text = "Min <= ammountOfUnits <= Max" ;};
    case 2: { _text = "Min < ammountOfUnits < Max" ; };
    case 3: { _text = "ammountOfUnits <= min || max <= ammountOfUnits" ;};
    case 4: { _text = "ammountOfUnits < min || max < ammountOfUnits" ; };
    default { hint "Are End Side Failure"; if(true) exitWith{}; };
};





if (_activated) then
{


["Are Endcondition Module",
                            "Distance: "  + str _distance +"<br/>" +
                            "Minimum: "   + str _min +"<br/>" +
                            "Maximum: "   + str _max +"<br/>" +
                            "Checktime: " + str _timer +"<br/>" +
                            "Typ: "  + str _text +"<br/>"
                         , "Sacher"] call UO_FNC_RegisterModule;



    TEMPFNC_conditionCheck ={};
    switch (_type) do
    {
        case 1:
        {
            TEMPFNC_conditionCheck =
            {
                _result = (_this select 1) <= (_this select 0) &&(_this select 0) <= (_this select 2);
                _result
            };
        };
        case 2:
        {
            TEMPFNC_conditionCheck =
            {
                _result = (_this select 1) < (_this select 0) &&(_this select 0) < (_this select 2);
                _result
            };
        };
        case 3:
        {
            TEMPFNC_conditionCheck =
            {
                _result = (_this select 1) >= (_this select 0) &&(_this select 0) >= (_this select 2);
                _result
            };
        };
        case 4:
        {
            TEMPFNC_conditionCheck =
            {
                _result = (_this select 1) > (_this select 0) &&(_this select 0) > (_this select 2);
                _result
            };
        };
        default { hint "Are End Side Failure" };
    };

    while {!FW_MissionEnded} do
    {
        _ammount = [_side,300,_logic] callUO_FNC_AreaCount;
        if([_ammount,_min,_max] call TEMPFNC_conditionCheck) exitWith
        {
            _message call UO_fnc_EndMission;
        };
        sleep(_timer);
    };
};
