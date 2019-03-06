class EGVAR(AI,standardNumberControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 101) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 101);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 101;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,patrolradiusControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 102) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 102); if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;}; [_value] spawn UO_FW_AI_fnc_setRadial; _value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 102;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,behaviourControl) : Title    {
    attributeLoad = "_index = ['careless','safe','aware','combat','stealth'] find _value; missionNamespace setvariable ['UO_FW_AI_behaviour_value',_index]; (_this controlsGroupCtrl 103) lbsetcursel _index;";
    attributeSave = "['careless','safe','aware','combat','stealth'] select (missionNamespace getvariable ['UO_FW_AI_behaviour_value',1]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 103;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 5;
            values[] = {0,1,2,3,4};
            strings[] = {"Careless","Safe","Aware","Combat","Stealth"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_behaviour_value',_this select 1];";
        };
    };
};
class EGVAR(AI,codeControl) : Edit {
    attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 104) ctrlSetText _value;";
    attributeSave = "_value = ctrlText (_this controlsGroupCtrl 104);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
    h = 3 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 3 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 104;
            style = ST_MULTI;
            h = 3 * SIZE_M * GRID_H;
            autocomplete = "scripting";
        };
    };
};
class EGVAR(AI,waypointwaitControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 105) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 105);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 105;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,combatmodeControl) : Title    {
    attributeLoad = "_index = (['blue','green','white','yellow','red'] find _value); missionNamespace setvariable ['UO_FW_AI_combatmode_value',_index]; (_this controlsGroupCtrl 106) lbsetcursel _index;";
    attributeSave = "['blue','green','white','yellow','red'] select (missionNamespace getvariable ['UO_FW_AI_combatmode_value',4]);";
    h = "25 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 106;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "25 * (pixelH * pixelGrid * 0.50)";
            rows = 5;
            columns = 1;
            values[] = {0,1,2,3,4};
            strings[] = {"$STR_3DEN_Attributes_CombatMode_Blue_text","$STR_3DEN_Attributes_CombatMode_Green_text","$STR_3DEN_Attributes_CombatMode_White_text","$STR_3DEN_Attributes_CombatMode_Yellow_text","$STR_3DEN_Attributes_CombatMode_Red_text"};
            tooltips[] = {
                "$STR_3DEN_Attributes_CombatMode_Blue_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Green_tooltip",
                "$STR_3DEN_Attributes_CombatMode_White_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Yellow_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Red_tooltip"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_combatmode_value',_this select 1];";
        };
    };
};
class EGVAR(AI,taskControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_task_value',_value]; (_this controlsGroupCtrl 107) lbsetcursel (_value);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_task_value',4];";
    h = "20 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "20 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 107;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "20 * (pixelH * pixelGrid * 0.50)";
            rows = 5;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7,8,9,10};
            strings[] = {
                "Loiter",
                "Hold Until",
                "Sentry",
                "Stationary",
                "Patrol",
                "Patrol Perimeter",
                "Move to Patrol Buildings",
                "Move to Defend Buildings",
                "Entrenched",
                "Reinforcments",
                "None"
            };
            tooltips[] = {
                "Loiter in position, ambient animations.",
                "Hold position until contacted.",
                "Perform basic sentry walk back and forth 10m.",
                "Used for placing units in difficult positions, will never move or turn.",
                "Random patrol area within task radius.",
                "Random Patrol on the edge of task radius.",
                "From start location move to buildings and patrol within them.",
                "From start location move to buildings and hold position until contacted.",
                "Stationary units with far engagement ranges",
                "Squad which holds until called by friendlies to reinforce",
                "None"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_task_value',_this select 1];";
        };
    };
};
class EGVAR(AI,formationControl) : Toolbox {
    attributeLoad = "_index = ['wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] find _value; missionNamespace setvariable ['UO_FW_AI_formation_value',_index]; (_this controlsGroupCtrl 108) lbsetcursel _index;";
    attributeSave = "['wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] select (missionNamespace getvariable ['UO_FW_AI_formation_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 108;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 9;
            strings[] = {
                "\a3\3DEN\Data\Attributes\Formation\wedge_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\vee_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\line_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\file_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\stag_column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_left_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_right_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\diamond_ca.paa"
            };
            values[] = {0,1,2,3,4,5,6,7,8};
            tooltips[] = {
                $STR_WEDGE,
                $STR_VEE,
                $STR_LINE,
                $STR_COLUMN,
                $STR_File,
                $STR_STAGGERED,
                $STR_ECHL,
                $STR_ECHR,
                $STR_DIAMOND
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_formation_value',_this select 1];";
        };
    };
};
class EGVAR(AI,speedControl) : Toolbox {
    attributeLoad = "_index = ['limited','normal','full'] find _value; missionNamespace setvariable ['UO_FW_AI_speed_value',_index]; (_this controlsGroupCtrl 109) lbsetcursel _index;";
    attributeSave = "['limited','normal','full'] select (missionNamespace getvariable ['UO_FW_AI_speed_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 109;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 3;
            strings[] = {
                "\a3\3DEN\Data\Attributes\SpeedMode\limited_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\normal_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\full_ca.paa"
            };
            values[] = {0,1,2};
            tooltips[] = {
                $STR_3den_attributes_speedmode_limited,
                $STR_3den_attributes_speedmode_normal,
                $STR_3den_attributes_speedmode_full
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_speed_value',_this select 1];";
        };
    };
};
class EGVAR(AI,stanceControl): Toolbox {
    attributeLoad = "_index = ['auto','down','middle','up'] find _value; missionNamespace setvariable ['UO_FW_AI_stance_value',_index]; (_this controlsGroupCtrl 110) lbsetcursel _index;";
    attributeSave = "['auto','down','middle','up'] select (missionNamespace getvariable ['UO_FW_AI_stance_value',0]);";
    h = 8 * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 8 * GRID_H;
        };
        class Value: Value {
            idc = 110;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 8 * GRID_H;
            rows = 1;
            columns = 4;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\down_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\middle_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa"
            };
            tooltips[] = {
                $STR_3den_attributes_stance_default,
                $STR_3den_attributes_stance_down,
                $STR_3den_attributes_stance_middle,
                $STR_3den_attributes_stance_up
            };
            values[] = {-1,0,1,2};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_stance_value',_this select 1];";
        };
    };
};
class EGVAR(AI,startbuildingControl) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['UO_FW_AI_startbuilding_value',_index]; (_this controlsGroupCtrl 119) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['UO_FW_AI_startbuilding_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 119;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"OFF","ON"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_startbuilding_value',_this select 1];";
        };
    };
};
class EGVAR(AI,multiplierControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 120) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 120);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 120;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,occupyoptionControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_occupyoption_value',_value]; (_this controlsGroupCtrl 121) lbsetcursel (((_value) min 7) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_occupyoption_value',0];";
    h = "20 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "20 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 121;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "20 * (pixelH * pixelGrid * 0.50)";
            rows = 4;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7};
            strings[] = {
                "OFF","Random Option Below",
                "Nearest Building","Random Building",
                "Near GROUP of Buildings","Random GROUP of Buildings",
                "Near MULTIPLE Buildings","Random MULTIPLE Buildings"
            };
            tooltips[] = {
                "Group will not occupy a building.","Random Occupy Option (From Below Options)",
                "Occupy nearest enterable building.","Occupy a random enterable building with in task radius.",
                "Occupy nearest group of buildings with in task radius.","Occupy random group of buildings with in task radius.",
                "Occupy nearest multiple buildings with in task radius.","Occupy random multiple buildings with in task radius."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_occupyoption_value',_this select 1];";
        };
    };
};
class EGVAR(AI,removeControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_remove_value',_value]; (_this controlsGroupCtrl 122) lbsetcursel (((_value) min 11) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_remove_value',0];";
    h = "20 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "20 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 122;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "20 * (pixelH * pixelGrid * 0.50)";
            rows = 4;
            columns = 3;
            values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
            strings[] = {
                "OFF","Everything","All Weapons and Equip",
                "All Weapons","All Equipment","All Items",
                "All Magazines","Vest","Uniform",
                "Backpack","Headgear","Goggles"
            };
            tooltips[] = {
                "Remove Nothing.","Remove everything from unit.","Remove all weapons and equipment from unit.",
                "Remove all weapons from unit.","Remove all equipment from unit.","Remove all items from unit.",
                "Remove all magazines from unit.","Remove vest from unit.","Remove uniform from unit.",
                "Remove backpack from unit.","Remove headgear from unit.","Remove goggles from unit."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_remove_value',_this select 1];";
        };
    };
};
class EGVAR(AI,codeunitControl) : Edit {
    attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 123) ctrlSetText _value;";
    attributeSave = "_value = ctrlText (_this controlsGroupCtrl 123);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
    h = 3 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 3 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 123;
            style = ST_MULTI;
            h = 3 * SIZE_M * GRID_H;
            autocomplete = "scripting";
        };
    };
};
class EGVAR(AI,persistentControl) : Title {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['UO_FW_AI_persistent_value',_index]; (_this controlsGroupCtrl 124) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['UO_FW_AI_persistent_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 124;
              style = "0x02";
              x = "48 * (pixelW * pixelGrid * 0.50)";
              w = "82 * (pixelW * pixelGrid * 0.50)";
              h = "5 * (pixelH * pixelGrid * 0.50)";
              rows = 1;
              columns = 2;
            values[] = {0,1};
              strings[] = {"Not Persistent","Persistent"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_persistent_value',_this select 1];";
        };
    };
};
class EGVAR(AI,unitnameControl) : Edit {
        onLoad="\
            private ['_isUnitPlayable'];\
            private _unit = ((get3denselected 'object') select 0);\
            private _ctrl = _this select 0;\
            private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
            {\
                if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                    if !(isNull player) then {\
                         _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
                    } else {\
                         _isUnitPlayable = (_unit in playableUnits);\
                    };\
                    _state = [true,false] select (_isUnitPlayable);\
                    _fade = [0.75,0] select _state;\
                    _x ctrlenable _state;\
                    _x ctrlsetfade _fade;\
                    _x ctrlshow _state;\
                    _x ctrlcommit 0;\
                    ctrlsetfocus _x;\
                    ctrlsetfocus _ctrl;\
                };\
            } foreach (allcontrols (ctrlparent _ctrl));\
        ";
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 125) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 125);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 125;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
            canModify = 1;
         };
     };
 };
class EGVAR(AI,multioccupyControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_multioccupy_value',_value]; (_this controlsGroupCtrl 126) lbsetcursel (((_value) min 9) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_multioccupy_value',1];";
    h = "10 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "10 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 126;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "10 * (pixelH * pixelGrid * 0.50)";
            rows = 2;
            columns = 5;
            values[] = {0,1,2,3,4,5,6,7,8,9};
            strings[] = {
                "ALL","25%","50%","75%","RANDOM",
                "ONE","TWO","THREE","FOUR","FIVE"
            };
            tooltips[] = {
                "All generated groups will use the same occupy option as this group.",
                "25% generated groups will use the occupy options.",
                "50% generated groups will use the occupy options.",
                "75% generated groups will use the occupy options.",
                "A random number of generated groups will use the occupy options.",
                "One generated group will use the occupy options.",
                "Two generated groups will use the occupy options.",
                "Three generated groups will use the occupy options.",
                "Four generated groups will use the occupy options.",
                "Five generated groups will use the occupy options."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_multioccupy_value',_this select 1];";
        };
    };
};
class EGVAR(AI,moduleradiusControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 127) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 127);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 127;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,moduleradiusControl2) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 227) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 227);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
            idc = 227;
            style = ST_LEFT;
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,zoneDelayControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 128) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 128);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
            idc = 128;
            style = ST_LEFT;
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
 class EGVAR(AI,zoneInitialSpawn) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_intial_value',_value]; (_this controlsGroupCtrl 129) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_intial_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 129;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Yes","No"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_intial_value',_this select 1];";
        };
    };
};
class EGVAR(AI,zoneSuspendControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_zoneSuspend_value',_value]; (_this controlsGroupCtrl 129) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_zoneSuspend_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 129;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Enabled","Suspended"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_zoneSuspend_value',_this select 1];";
        };
    };
};
class EGVAR(AI,moduleconditionControl) : Edit {
    attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 130) ctrlSetText _value;";
    attributeSave = "_value = ctrlText (_this controlsGroupCtrl 130);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
    h = 3 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 3 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 130;
            style = ST_MULTI;
            h = 3 * SIZE_M * GRID_H;
            autocomplete = "scripting";
        };
    };
};
class EGVAR(AI,zoneTypeControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_zoneType_value',_value]; (_this controlsGroupCtrl 131) lbsetcursel (((_value) min 11) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_zoneType_value',1];";
    h = "25 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 131;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "25 * (pixelH * pixelGrid * 0.50)";
            rows = 5;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
            strings[] = {
                "All","All Ground",
                "All Air","All Ground and Helicopter",
                "All Ground and Water","All Ground and Plane",
                "All Air and Water","Ground Unit Only",
                "Ground Vehicle Only","Water Vehicle Only",
                "Helicopter Unit Only","Plane Unit Only"
            };
            tooltips[] = {
                "Activate zone on All type of units present in zone.","Activate zone on All Ground type of units present in zone.",
                "Activate zone on All Air type of units present in zone.","Activate zone on All Ground and Helicopter type of units present in zone.",
                "Activate zone on All Ground and Water type of units present in zone.","Activate zone on All Ground and Plane type of units present in zone.",
                "Activate zone on All Air and Water type of units present in zone.","Activate zone on Ground Unit Only type of units present in zone.",
                "Activate zone on Ground Vehicle Only type of units present in zone.","Activate zone on Water Vehicle Only type of units present in zone.",
                "Activate zone on Helicopter Unit Only type of units present in zone.","Activate zone on Plane Unit Only type of units present in zone."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_zoneType_value',_this select 1];";
        };
    };
};
class EGVAR(AI,ZonesideControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_Zoneside_value',_value]; (_this controlsGroupCtrl 132) lbsetcursel (((_value) min 12) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_Zoneside_value',1];";
    h = "35 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "35 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 132;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "35 * (pixelH * pixelGrid * 0.50)";
            rows = 7;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7,8,9,10,11.12};
            strings[] = {
                "WEST","EAST",
                "INDEPENDENT","CIVILIAN",
                "ANY","WEST/EAST",
                "WEST/INDEPENDENT","WEST/CIVILIAN",
                "WEST/EAST/INDEPENDENT","EAST/INDEPENDENT",
                "EAST/CIVILIAN","EAST/INDEPENDENT/CIVILIAN",
                "INDEPENDENT/CIVILIAN"
            };
            tooltips[] = {
                "The side of the unit needs to be WEST to activate the zone.","The side of the unit needs to be EAST to activate the zone.",
                "The side of the unit needs to be INDEPENDENT to activate the zone.","The side of the unit needs to be CIVILIAN to activate the zone.",
                "The side of the unit needs to be ANY to activate the zone.","The side of the unit needs to be WEST or EAST to activate the zone.",
                "The side of the unit needs to be WEST or INDEPENDENT to activate the zone.","The side of the unit needs to be WEST or CIVILIAN to activate the zone.",
                "The side of the unit needs to be WEST or EAST or INDEPENDENT to activate the zone.","The side of the unit needs to be EAST or INDEPENDENT to activate the zone.",
                "The side of the unit needs to be EAST or CIVILIAN to activate the zone.","The side of the unit needs to be EAST or INDEPENDENT or CIVILIAN to activate the zone.",
                "The side of the unit needs to be INDEPENDENT or CIVILIAN to activate the zone."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_Zoneside_value',_this select 1];";
        };
    };
};
class EGVAR(AI,behaviourchangeControl) : Title    {
    attributeLoad = "_index = ['unchanged','careless','safe','aware','combat','stealth'] find _value; missionNamespace setvariable ['UO_FW_AI_behaviour_value',_index]; (_this controlsGroupCtrl 134) lbsetcursel _index;";
    attributeSave = "['unchanged','careless','safe','aware','combat','stealth'] select (missionNamespace getvariable ['UO_FW_AI_behaviourchange_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 134;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 6;
            values[] = {0,1,2,3,4,5};
            strings[] = {"No Change","Careless","Safe","Aware","Combat","Stealth"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_behaviourchange_value',_this select 1];";
        };
    };
};
class EGVAR(AI,combatmodechangeControl) : Title    {
    attributeLoad = "_index = (['unchanged','blue','green','white','yellow','red'] find _value); missionNamespace setvariable ['UO_FW_AI_combatmodechange_value',_index]; (_this controlsGroupCtrl 135) lbsetcursel _index;";
    attributeSave = "['unchanged','blue','green','white','yellow','red'] select (missionNamespace getvariable ['UO_FW_AI_combatmodechange_value',0]);";
    h = "25 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 135;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "25 * (pixelH * pixelGrid * 0.50)";
            rows = 6;
            columns = 1;
            values[] = {0,1,2,3,4,5};
            strings[] = {"$STR_3den_attributes_default_unchanged_text","$STR_3DEN_Attributes_CombatMode_Blue_text","$STR_3DEN_Attributes_CombatMode_Green_text","$STR_3DEN_Attributes_CombatMode_White_text","$STR_3DEN_Attributes_CombatMode_Yellow_text","$STR_3DEN_Attributes_CombatMode_Red_text"};
            tooltips[] = {
                "$STR_3den_attributes_default_unchanged_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Blue_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Green_tooltip",
                "$STR_3DEN_Attributes_CombatMode_White_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Yellow_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Red_tooltip"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_combatmodechange_value',_this select 1];";
        };
    };
};
class EGVAR(AI,speedchangeControl) : Toolbox {
    attributeLoad = "_index = ['unchanged','limited','normal','full'] find _value; missionNamespace setvariable ['UO_FW_AI_speedchange_value',_index]; (_this controlsGroupCtrl 136) lbsetcursel _index;";
    attributeSave = "['unchanged','limited','normal','full'] select (missionNamespace getvariable ['UO_FW_AI_speedchange_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 136;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 4;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\limited_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\normal_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\full_ca.paa"
            };
            values[] = {0,1,2,4};
            tooltips[] = {
                $STR_3den_attributes_default_unchanged_text,
                $STR_3den_attributes_speedmode_limited,
                $STR_3den_attributes_speedmode_normal,
                $STR_3den_attributes_speedmode_full
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_speedchange_value',_this select 1];";
        };
    };
};
class EGVAR(AI,formationchangeControl) : Toolbox {
    attributeLoad = "_index = ['unchanged','wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] find _value; missionNamespace setvariable ['UO_FW_AI_formationchange_value',_index]; (_this controlsGroupCtrl 137) lbsetcursel _index;";
    attributeSave = "['unchanged','wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] select (missionNamespace getvariable ['UO_FW_AI_formationchange_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 137;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 10;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\wedge_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\vee_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\line_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\file_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\stag_column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_left_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_right_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\diamond_ca.paa"
            };
            values[] = {0,1,2,3,4,5,6,7,8};
            tooltips[] = {
                $STR_3den_attributes_default_unchanged_text,
                $STR_WEDGE,
                $STR_VEE,
                $STR_LINE,
                $STR_COLUMN,
                $STR_File,
                $STR_STAGGERED,
                $STR_ECHL,
                $STR_ECHR,
                $STR_DIAMOND
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_formationchange_value',_this select 1];";
        };
    };
};
class EGVAR(AI,stancechangeControl): Toolbox {
    attributeLoad = "_index = ['unchanged','auto','down','middle','up'] find _value; missionNamespace setvariable ['UO_FW_AI_stancechange_value',_index]; (_this controlsGroupCtrl 138) lbsetcursel _index;";
    attributeSave = "['unchanged','auto','down','middle','up'] select (missionNamespace getvariable ['UO_FW_AI_stancechange_value',0]);";
    h = 8 * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 8 * GRID_H;
        };
        class Value: Value {
            idc = 138;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 8 * GRID_H;
            rows = 1;
            columns = 5;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\down_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\middle_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa"
            };
            tooltips[] = {
                $STR_3den_attributes_default_unchanged_text,
                $STR_3den_attributes_stance_default,
                $STR_3den_attributes_stance_down,
                $STR_3den_attributes_stance_middle,
                $STR_3den_attributes_stance_up
            };
            values[] = {0,1,2,3,4};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_stancechange_value',_this select 1];";
        };
    };
};
class EGVAR(AI,taskpriorityControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_taskpriority_value',_value]; (_this controlsGroupCtrl 139) lbsetcursel (((_value) min 2) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_taskpriority_value',1];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 139;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 3;
            values[] = {0,1,2};
            strings[] = {
                "HIGH","MEDIUM","LOW"
            };
            tooltips[] = {
                "High Priority","Medium Priority","Low Priority"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_taskpriority_value',_this select 1];";
        };
    };
};
class EGVAR(AI,standardNumberAltControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 140) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 140);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 140;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
             canModify = 1;
         };
     };
 };
class EGVAR(AI,forcelightsControl) : Title {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['UO_FW_AI_persistent_value',_index]; (_this controlsGroupCtrl 142) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['UO_FW_AI_persistent_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 142;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Off","Force Flashlights"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_persistent_value',_this select 1];";
        };
    };
};
class EGVAR(AI,MainControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_Main_value',_value]; (_this controlsGroupCtrl 143) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_Main_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 143;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"EnableD","DISABLED"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_Main_value',_this select 1];";
        };
    };
};
class EGVAR(AI,MainconsoleControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_Mainconsole_value',_value]; (_this controlsGroupCtrl 144) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_Mainconsole_value',1];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 144;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"ON","OFF"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_Mainconsole_value',_this select 1];";
        };
    };
};
class EGVAR(AI,MaindebugControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_Maindebug_value',_value]; (_this controlsGroupCtrl 145) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_Maindebug_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 145;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"ON","OFF"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_Maindebug_value',_this select 1];";
        };
    };
};
class EGVAR(AI,standardStringOneControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 146) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 146);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
            idc = 146;
            style = ST_LEFT;
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,standardStringTwoControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 147) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 147);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 147;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,standardStringThreeControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 148) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 148);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 148;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,positiontypeControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_postiontype_value',_value]; (_this controlsGroupCtrl 149) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_postiontype_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 149;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"STANDARD","START"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_postiontype_value',_this select 1];";
        };
    };
};
class EGVAR(AI,flyingControl) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['UO_FW_AI_flying_value',_index]; (_this controlsGroupCtrl 150) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['UO_FW_AI_flying_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 150;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"NOT FLYING","FLYING"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_flying_value',_this select 1];";
        };
    };
};
class EGVAR(AI,heliControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_helitype_value',_value]; (_this controlsGroupCtrl 151) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_helitype_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 151;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"RAPPEL","LAND"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_helitype_value',_this select 1];";
        };
    };
};
class EGVAR(AI,initActionControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_initAction_value',_value]; (_this controlsGroupCtrl 152) lbsetcursel (((_value) min 2) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_initAction_value',1];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 152;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 3;
            values[] = {0,1,2};
            strings[] = {
                "OFF","DISABLE","Enable"
            };
            tooltips[] = {
                "Do Nothing to linked zones","Disable linked zones","Enable linked zones"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_initAction_value',_this select 1];";
        };
    };
};
class EGVAR(AI,actionControl) : Title {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_action_value',_value]; (_this controlsGroupCtrl 153) lbsetcursel (((_value) min 2) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_action_value',1];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 153;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 3;
            values[] = {0,1,2};
            strings[] = {
                "Enable","DISABLE","TOGGLE"
            };
            tooltips[] = {
                "Enable linked zones","Disable linked zones","If linked zone is disabled, enable it. If linked zone enabled, disabled it."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_action_value',_this select 1];";
        };
    };
};
class EGVAR(AI,flyinheightControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 154) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 154);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 154;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class EGVAR(AI,boolControl) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['UO_FW_AI_bool_value',_index]; (_this controlsGroupCtrl 155) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['UO_FW_AI_bool_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 155;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"FALSE","TRUE"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_bool_value',_this select 1];";
        };
    };
};
class EGVAR(AI,boolControl2) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['UO_FW_AI_bool2_value',_index]; (_this controlsGroupCtrl 156) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['UO_FW_AI_bool2_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 156;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"FALSE","TRUE"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_bool2_value',_this select 1];";
        };
    };
};
class EGVAR(AI,numberSelect1Control) : Title    {
    attributeLoad = "missionNamespace setvariable ['UO_FW_AI_numberSelect1_value',_value]; (_this controlsGroupCtrl 159) lbsetcursel (((_value) min 6) max 0);";
    attributeSave = "missionNamespace getvariable ['UO_FW_AI_numberSelect1_value',0];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 159;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 7;
            values[] = {0,1,2,3,4,5,6};
            strings[] = {"OFF","1","2","3","4","5","6"};
            onToolboxSelChanged = "missionNamespace setvariable ['UO_FW_AI_numberSelect1_value',_this select 1];";
        };
    };
};
