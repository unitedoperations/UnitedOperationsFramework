/*    Description: Creates standard entities.
 *     Arguments:
 *         OBJECT - Unit to Remove From
 *         NUMBER - Remove Option
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params["_unit",["_mode",0,[0]]];
switch (_mode) do {
    case 1: {
        removeAllItems _unit;
        removeAllWeapons _unit;
        removeUniform _unit;
        removeVest _unit;
        removeHeadgear _unit;
        removeGoggles _unit;
        removeBackpackGlobal _unit;
        _unit unassignItem "NVGoggles";
        _unit removeItem "NVGoggles";
        _unit unassignItem "NVGoggles_OPFOR";
        _unit removeItem "NVGoggles_OPFOR";
        _unit unassignItem "NVGoggles_INDEP";
        _unit removeItem "NVGoggles_INDEP";
    };
    case 2: {
        removeAllItems _unit;
        removeAllWeapons _unit;
        removeVest _unit;
        removeHeadgear _unit;
        removeGoggles _unit;
        removeBackpackGlobal _unit;
        _unit unassignItem "NVGoggles";
        _unit removeItem "NVGoggles";
        _unit unassignItem "NVGoggles_OPFOR";
        _unit removeItem "NVGoggles_OPFOR";
        _unit unassignItem "NVGoggles_INDEP";
        _unit removeItem "NVGoggles_INDEP";
    };
    case 3: {
        removeAllWeapons _unit;
        _unit unassignItem "NVGoggles";
        _unit removeItem "NVGoggles";
        _unit unassignItem "NVGoggles_OPFOR";
        _unit removeItem "NVGoggles_OPFOR";
        _unit unassignItem "NVGoggles_INDEP";
        _unit removeItem "NVGoggles_INDEP";
    };
    case 4: {
        removeVest _unit;
        removeHeadgear _unit;
        removeGoggles _unit;
        removeBackpackGlobal _unit;
        _unit unassignItem "NVGoggles";
        _unit removeItem "NVGoggles";
        _unit unassignItem "NVGoggles_OPFOR";
        _unit removeItem "NVGoggles_OPFOR";
        _unit unassignItem "NVGoggles_INDEP";
        _unit removeItem "NVGoggles_INDEP";
    };
    case 5: {removeAllItems _unit; removeBackpackGlobal _unit;};
    case 6: {{_unit removeMagazine _x} forEach (magazines _unit)};
    case 7: {removeVest _unit;};
    case 8: {removeUniform _unit;};
    case 9: {removeBackpackGlobal _unit;};
    case 10: {removeHeadgear _unit;};
    case 11: {removeGoggles _unit;};
    default {};
};
true
