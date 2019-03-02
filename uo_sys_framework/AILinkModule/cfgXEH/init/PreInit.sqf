#define COMPONENT AILink
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC);

["UO_FW_SettingsLoaded", {
    if (!(GETMVAR(Enabled,false))) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["AI link", "Shares targeting information between AI groups based on radios.", "TinfoilHate and Sacher"]] call CBA_fnc_globalEventJiP;
    (GVAR(startDelay)) = (GETMVAR(StartDelay,30)); //Delay in seconds when starting the mission until the first loop runs.
    (GVAR(shareDelay)) = (GETMVAR(ShareDelay,15)); //Delay in seconds  between loops after the first.
    (GVAR(transDelay)) = (GETMVAR(TransDelay,10)); //Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than GVAR(AILink,shareDelay).
    (GVAR(longRange)) = (GETMVAR(LRRange,800)); //Range if both groups have long-range radios, also used if GVAR(AILink,needRadio) is false.
    (GVAR(shortRange)) = (GETMVAR(SRRange,400)); //Range if both groups have short-range radios.
    (GVAR(needRadio)) = (GETMVAR(NeedRadio,false)); //Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.
    (GVAR(maxKnows)) = (GETMVAR(MaxKnows,3.5)); //The maximum amount that knowsAbout will be set to via this script.
    (GVAR(debug)) = (GETMVAR(Debug,false)); //Debug Information; Very spammy.
    [{call FUNC(Link)},[],GVAR(startDelay)] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
