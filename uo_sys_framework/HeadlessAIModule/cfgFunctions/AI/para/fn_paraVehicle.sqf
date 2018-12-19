/*	Description: Performs the para drop of vehicle once in the air.
 *	Arguments:
 *		OBJECT	- Vehicle
 *		BOOL	- Realism ON/OFF
 *		BOOL	- Vehicle Smoke ON/OFF
 *	Return Value:
 *		TRUE
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	params [["_v",objNull,[objNull]],["_pr",false,[false]],["_ps",false,[false]],["_c",0,[0]]];
	waitUntil {sleep 0.1; _c = _c + 1; (((getPosATL _v) select 2) < 200 || !alive _v || _c > 1800); };
	_c = 0;
	waitUntil {sleep 0.1; _c = _c + 1; (((getPosATL _v) select 2) < 200 || !alive _v || _c > 1800); };
	if(alive _v) then {
		private _vpos = getPosATL _v;	
		private _vp = createVehicle ["B_Parachute_02_F",_vpos, [], 0, ""];
		_vp setPosATL _vpos;
		_vp	setVelocity (velocity _v);
		_v attachTo [_vp, [0, 2, 0] ];			
		_v setPosATL _vpos;	
		if (_pr) then {
			private _vm = getMass _v;
			if ( _vm > 25000) then {
				sleep 1; 
				detach _v;
				waitUntil {sleep 0.1; (((getPos _v) select 2) < 1 || !alive _v);};
				_v setdamage 1;
			};
		};
		waitUntil {sleep 0.1; (((getPosATL _v) select 2) < 8 || !alive _v); };
		detach _v;
		if (alive _v && _ps) then {
			private _vpos = getPos _v;
			private _s1 = "SmokeShellGreen" createVehicle (_vpos vectorAdd [5,5,0]);
			private _s2 = "SmokeShellGreen" createVehicle (_vpos vectorAdd [-5,-5,0]);
		};
	};
	true