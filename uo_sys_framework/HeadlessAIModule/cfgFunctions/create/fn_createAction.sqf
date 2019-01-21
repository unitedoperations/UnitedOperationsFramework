/*    Description: Adds actions to ACE3 menus.
 *    Arguments:
 *         OBJECT    - Object to add action too
 *        ARRAY    - Action Parameters
 *        NUMBER    - Distance action visible from
 *        ARRAY    - Position on object
 *        STRING    - Name of Action
 *        NUMBER    - Type of Action (0 for actions, 1 for self-actions)
 *        ARRAY    - Submenu to add action to
 *     Return Value:
 *         BOOL    - True
 *    Author
 *        lecks
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
 UO_FW_AI_EXEC_CHECK(ALL);

    params ["_object", "_addActionParams", ["_distance",3,[1]], ["_pos", [0,0,0], [[]], [2,3]], ["_actionName", "", [""]], ["_actionType",0,[0]], ["_subMenu",[],[[]]]];
    _addActionParams params [["_actionText", "", [""]], ["_action", "", ["",{}]], ["_params", []],"_none","_none","_none","_none",["_condition", "true", ["",{}]]];
    if ((typename _action) == "STRING") then { _action = call compile format["{%1}",_action]; };
    if ((typename _condition) == "STRING") then { _condition = call compile format["{%1}",_condition]; };
    if (_actionName == "") then { _actionName = _actionText; };
    if (isClass (configFile >> "ACE_Interaction_Button_Base")) then {
        //use ACE menu
        _action = [_actionName,_actionText,"",_action, _condition , {}, _params, _pos, _distance] call ace_interact_menu_fnc_createAction;
        if (_actionType == 1) then {
            [_object, 1, _subMenu, _action] call ace_interact_menu_fnc_addActionToClass;
        } else {
            [_object, 0, _subMenu, _action] call ace_interact_menu_fnc_addActionToObject;
        };

    } else {
        _object addAction _addActionParams;
    };
    true
