_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    if(isServer) then
    {
        _timer =_logic getVariable ["EndCheckTimeArgument",60];
        _faction =_logic getVariable ["FactionNameArgument","DefaultString"];
        _percentage =_logic getVariable ["PercentageArgument",80];
        _message = _logic getVariable ["MessageArgument","DefaultString"];
        while {!FW_MissionEnded} do
        {
            _casualty = _faction call UO_FNC_CasualtyPercentage; //Gets the casualty percentage of team "VDV"
            
            if (_casualty >= _percentage) exitWith
            {
                (format [_message]) call UO_FNC_EndMission;
            };
            sleep(_timer);
        };
    };
};
