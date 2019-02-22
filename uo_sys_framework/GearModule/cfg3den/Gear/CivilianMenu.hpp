//class UO_FW_GearSettings_Presets_Civ {
//    displayName = "Civ Gear Presets";
//    collapsed = 0;
//    class Attributes {
//        class UO_FW_GearSettings_ACE_Arsenal_GearPresets_Civ {
//            property = "UO_FW_GearSettings_ACE_Arsenal_GearPresets_Civ";
//            displayName = "Gear Presets";
//            tooltip = "";
//            control = "UO_FW_Gear_ACE_Arsenal_PresetsCombo";
//            typeName = "STRING";
//            expression = UO_FW_SCENARIO_EXPRESSION;
//            defaultValue = "'None'";
//        };
//    };
//};

class UO_FW_GearSettings_ACE_Arsenal_Civ {
    displayName = "Civilian ACE Gear Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_RFL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_RFL";
            displayName = "Rifleman Loadout";
            tooltip = "Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_RFLAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_RFLAT";
            displayName = "Rifleman AT Loadout";
            tooltip = "Rifleman AT Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AR {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AR";
            displayName = "Automatic Rifleman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_GRN {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_GRN";
            displayName = "Grenadier Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            typeName = "STRING";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_TL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_TL";
            displayName = "Team Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_SQL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_SQL";
            displayName = "Squad Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AT";
            displayName = "Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AAT";
            displayName = "Assistant Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MG {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MG";
            displayName = "Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AMG {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AMG";
            displayName = "Assistant Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_HAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_HAT";
            displayName = "Heavy Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AHAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_AHAT";
            displayName = "Assistant Heavy AT Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MORTL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MORTL";
            displayName = "Mortar TL Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MOR {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MOR";
            displayName = "Mortar Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_EOD {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_EOD";
            displayName = "Explosive Ordnance Disposal Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_HEP {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_HEP";
            displayName = "Helicopter Pilot Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_HECRW {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_HECRW";
            displayName = "Helicopter Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_VCRW {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_VCRW";
            displayName = "Vehicle Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_VCMD {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_VCMD";
            displayName = "Vehicle Commander Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MED {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MED";
            displayName = "Medic Loadout";
            tooltip = "Medic Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MKS {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_MKS";
            displayName = "Marksman Loadout";
            tooltip = "Marksman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_OFF {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_OFF";
            displayName = "Officer Loadout";
            tooltip = "Officer Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_TWOIC {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_TWOIC";
            displayName = "2IC Loadout";
            tooltip = "Officer Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_RTO {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_RTO";
            displayName = "RATELO Loadout";
            tooltip = "RATELO Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_FAC {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_FAC";
            displayName = "FAC Loadout";
            tooltip = "FAC Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS1 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS1";
            displayName = "Custom Loadout 1";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS2 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS2";
            displayName = "Custom Loadout 2";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS3 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS3";
            displayName = "Custom Loadout 3";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS4 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS4";
            displayName = "Custom Loadout 4";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS5 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civ_CUS5";
            displayName = "Custom Loadout 5";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
    };
};
class UO_FW_GearSettings_Olsen_Civ {
    displayName = "Civilian Olsen Gear Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_RFL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_RFL";
            displayName = "Rifleman Loadout";
            tooltip = "Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_RFLAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_RFLAT";
            displayName = "Rifleman AT Loadout";
            tooltip = "Rifleman AT Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_AR {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_AR";
            displayName = "Automatic Rifleman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_GRN {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_GRN";
            displayName = "Grenadier Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_TL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_TL";
            displayName = "Team Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_SQL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_SQL";
            displayName = "Squad Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_AT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_AT";
            displayName = "Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_AAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_AAT";
            displayName = "Assistant Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_MG {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_MG";
            displayName = "Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_AMG {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_AMG";
            displayName = "Assistant Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_HAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_HAT";
            displayName = "Heavy Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_AHAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_AHAT";
            displayName = "Assistant Heavy AT Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_MORTL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_MORTL";
            displayName = "Mortar TL Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_MOR {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_MOR";
            displayName = "Mortar Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_EOD {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_EOD";
            displayName = "Explosive Ordnance Disposal Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_VCRW {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_VCRW";
            displayName = "Vehicle Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_VCMD {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_VCMD";
            displayName = "Vehicle Commander Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_MED {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_MED";
            displayName = "Medic Loadout";
            tooltip = "Medic Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_MKS {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_MKS";
            displayName = "Marksman Loadout";
            tooltip = "Marksman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_OFF {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_OFF";
            displayName = "Officer Loadout";
            tooltip = "Officer Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_TWOIC {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_TWOIC";
            displayName = "2IC Loadout";
            tooltip = "Officer Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_RTO {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_RTO";
            displayName = "RATELO Loadout";
            tooltip = "RATELO Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_FAC {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_FAC";
            displayName = "FAC Loadout";
            tooltip = "FAC Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS1 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS1";
            displayName = "Custom Loadout 1";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS2 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS2";
            displayName = "Custom Loadout 2";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS3 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS3";
            displayName = "Custom Loadout 3";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS4 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS4";
            displayName = "Custom Loadout 4";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS5 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Civ_CUS5";
            displayName = "Custom Loadout 5";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
