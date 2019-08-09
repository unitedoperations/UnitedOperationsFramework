#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(Server);

SETMVAR(Batteries,[]);
SETMVAR(Firemissions,[]);
SETMVAR(Firemissions_Blufor,[]);
SETMVAR(Firemissions_Opfor,[]);
SETMVAR(Firemissions_Indfor,[]);
SETMVAR(Firemissions_Civfor,[]);

[QEGVAR(Core,SettingsLoaded), {
    if (!(GETMVAR(Enabled,false))) exitWith {};
    [QEGVAR(Core,RegisterModuleEvent), ["FiremissionVirtual", "Allows for virtual firemissions.", "Sacher and Tinfoilhate"]] call CBA_fnc_globalEventJiP;

    [QGVAR(Event_PolarFiremission), FUNC(server_polarFiremissionFire)] call CBA_fnc_addEventHandler;
	[QGVAR(Event_PolarFiremissionRepeat), FUNC(dia_server_polarFiremissionRepeat)] call CBA_fnc_addEventHandler;

    
    SETMPVAR(NetBusy_WEST,false);
    SETMPVAR(NetBusy_EAST,false);
    SETMPVAR(NetBusy_GUER,false);
    SETMPVAR(NetBusy_CIV,false);


    //Parse settings#

    SETMPVAR(CallChannel_Blufor,GVAR(CallInChannel_Blufor));
    SETMPVAR(CallChannel_Opfor,GVAR(CallInChannel_Opfor));
    SETMPVAR(CallChannel_Indfor,GVAR(CallInChannel_Indfor));
    SETMPVAR(CallChannel_Civfor,GVAR(CallInChannel_Civfor));

#define ROUNDS(unitNumb,roundNum)\
                _class = GETMVAR(TRIPLES(RoundClassName,unitNumb,roundNum),""); \
                _roundCount = GETMVAR(TRIPLES(RoundCount,unitNumb,roundNum),0); \
                if(_class != "") then { \
                    _rounds pushBack [_class,_roundCount];\
                };

#define BATTERY(unitNum) \
        _enabled = GETMVAR(DOUBLES(Enabled,unitNum),false);\
        if(_enabled) then { \
            _name = GETMVAR(DOUBLES(Name,unitNum),""); \
            _guns = GETMVAR(DOUBLES(Guns,unitNum),0); \
            _dispersion = GETMVAR(DOUBLES(Dispersion,unitNum),150); \
            _reloadTime = GETMVAR(DOUBLES(ReloadTime,unitNum),0); \
            _calculationTime = GETMVAR(DOUBLES(CalculationTime,unitNum),0); \
            _delayTime = GETMVAR(DOUBLES(DelayTime,unitNum),0); \
            _side = [west,east,independent,civilian] select (GETMVAR(DOUBLES(Side,unitNum),0)); \
            _rounds = [] ;\
            ROUNDS(unitNum,1) \
            ROUNDS(unitNum,2) \
            ROUNDS(unitNum,3) \
            ROUNDS(unitNum,4) \
            ROUNDS(unitNum,5) \
            GVAR(Batteries) pushBack [_name,true,_rounds,_guns,_dispersion,_reloadTime,_calculationTime,_delayTime,_side];\
        }; 
        


    BATTERY(1)
    BATTERY(2)
    BATTERY(3)
    BATTERY(4)
    BATTERY(5)
    BATTERY(6)
    FWDEBUG((str(GVAR(Batteries))),(str(GVAR(Batteries))));
    SETMPVAR(Batteries,GVAR(Batteries)); 

    [{time > 5}, 
	{   
        [QGVAR(SettingsLoaded),[]] call CBA_fnc_globalEventJIP;
    }, [player]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
