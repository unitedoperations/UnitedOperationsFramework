/*	Description: Creates standard entities.
 * 	Arguments:
 * 		OBJECT - Unit to Remove From
 * 		NUMBER - Remove Option
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

	params["_u",["_r",0,[0]]];
	switch (_r) do {
		case 1: {
			removeAllItems _u;
			removeAllWeapons _u;
			removeUniform _u;
			removeVest _u;
			removeHeadgear _u;
			removeGoggles _u;
			removeBackpackGlobal _u;
			_u unassignItem "NVGoggles";
			_u removeItem "NVGoggles";
			_u unassignItem "NVGoggles_OPFOR";
			_u removeItem "NVGoggles_OPFOR";
			_u unassignItem "NVGoggles_INDEP";
			_u removeItem "NVGoggles_INDEP";
		};
		case 2: {
			removeAllItems _u;
			removeAllWeapons _u;
			removeVest _u;
			removeHeadgear _u;
			removeGoggles _u;
			removeBackpackGlobal _u;
			_u unassignItem "NVGoggles";
			_u removeItem "NVGoggles";
			_u unassignItem "NVGoggles_OPFOR";
			_u removeItem "NVGoggles_OPFOR";
			_u unassignItem "NVGoggles_INDEP";
			_u removeItem "NVGoggles_INDEP";
		};
		case 3: {
			removeAllWeapons _u;
			_u unassignItem "NVGoggles";
			_u removeItem "NVGoggles";
			_u unassignItem "NVGoggles_OPFOR";
			_u removeItem "NVGoggles_OPFOR";
			_u unassignItem "NVGoggles_INDEP";
			_u removeItem "NVGoggles_INDEP";
		};
		case 4: {
			removeVest _u;
			removeHeadgear _u;
			removeGoggles _u;
			removeBackpackGlobal _u;
			_u unassignItem "NVGoggles";
			_u removeItem "NVGoggles";
			_u unassignItem "NVGoggles_OPFOR";
			_u removeItem "NVGoggles_OPFOR";
			_u unassignItem "NVGoggles_INDEP";
			_u removeItem "NVGoggles_INDEP";
		};
		case 5: {removeAllItems _u;removeBackpackGlobal _u;};
		case 6: {{_u removeMagazine _x} forEach (magazines _u)};
		case 7: {removeVest _u;};
		case 8: {removeUniform _u;};
		case 9: {removeBackpackGlobal _u;};
		case 10: {removeHeadgear _u;};
		case 11: {removeGoggles _u;};
		default {};
	};
	true
