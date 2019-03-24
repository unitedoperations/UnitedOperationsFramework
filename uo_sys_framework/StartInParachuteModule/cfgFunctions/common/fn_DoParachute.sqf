#define COMPONENT StartInParachute
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_target","_elev",["_rand",100,[0]],["_steer",false,[false]]];

[QEGVAR(Core,RegisterModuleEvent), ["Start in Parachute", "Starts players in parachutes", "Briland and Sacher"]] call CBA_fnc_globalEventJiP;
private _class = ["NonSteerable_Parachute_F","Steerable_Parachute_F"] select _steer;

[{!isnull (_this select 0)}, {
    params ["_target","_elev","_rand","_class"];
    private _random = floor (random _rand);
    private _chute = _class createVehicle [0,0,0];
    _chute setPosATL [(getPosatl _target select 0), (getPosatl _target select 1), _elev + _random];
    _target moveIndriver _chute;
}, [_target,_elev,_rand,_class]] call CBA_fnc_waitUntilAndExecute;
