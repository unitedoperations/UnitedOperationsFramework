

_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];


// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["AI link", "Shares targeting information between AI groups based on radios.", "TinfoilHate"] call FNC_RegisterModule;
    tin_aiLink_startDelay 	= (_logic getVariable ["StartDelayArgument",30]);		//Delay in seconds when starting the mission until the first loop runs.
    tin_aiLink_shareDelay	= (_logic getVariable ["ShareDelayArgument",15]);		//Delay in seconds  between loops after the first.
    tin_aiLink_transDelay	= (_logic getVariable ["TransDelayArgument",10]);		//Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than tin_aiLink_shareDelay.

    tin_aiLink_longRange 	= (_logic getVariable ["LRRangeArgument",800]);	//Range if both groups have long-range radios, also used if tin_aiLink_needRadio is false.
    tin_aiLink_shortRange 	= (_logic getVariable ["SRRangeArgument",400]);	//Range if both groups have short-range radios.

    tin_aiLink_needRadio	= (_logic getVariable ["NeedRadioArgument",false]);;	//Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.
    tin_aiLink_maxKnows		= (_logic getVariable ["MaxKnowsArgument",3.5]);;		//The maximum amount that knowsAbout will be set to via this script.

    tin_aiLink_debug 		= (_logic getVariable ["DebugArgument",false]);;	//Debug Information; Very spammy.



    if (!hasInterface) then
    {
       [{call UO_fnc_LoadAILink},[],tin_aiLink_startDelay] call CBA_fnc_waitAndExecute;
    }

};
