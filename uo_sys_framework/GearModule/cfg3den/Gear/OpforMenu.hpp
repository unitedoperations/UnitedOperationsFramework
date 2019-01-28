//class UO_FW_GearSettings_Presets_Opfor {
//    displayName = "Opfor Gear Presets";
//    collapsed = 0;
//    class Attributes {
//        class UO_FW_GearSettings_ACE_Arsenal_GearPresets_Opfor {
//            property = "UO_FW_GearSettings_ACE_Arsenal_GearPresets_Opfor";
//            displayName = "Gear Presets";
//            tooltip = "";
//            control = "UO_FW_Gear_ACE_Arsenal_PresetsCombo";
//            typeName = "STRING";
//            expression = UO_FW_SCENARIO_EXPRESSION;
//            defaultValue = "'None'";
//        };
//    };
//};

class UO_FW_GearSettings_ACE_Arsenal_Opfor {
    displayName = "Opfor ACE Gear Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_RFL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_RFL";
            displayName = "Rifleman Loadout";
            tooltip = "Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_RFLAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_RFLAT";
            displayName = "Rifleman AT Loadout";
            tooltip = "Rifleman AT Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AR {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AR";
            displayName = "Automatic Rifleman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_GRN {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_GRN";
            displayName = "Grenadier Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            typeName = "STRING";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_TL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_TL";
            displayName = "Team Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_SQL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_SQL";
            displayName = "Squad Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AT";
            displayName = "Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AAT";
            displayName = "Assistant Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MG {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MG";
            displayName = "Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AMG {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AMG";
            displayName = "Assistant Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_HAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_HAT";
            displayName = "Heavy Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AHAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_AHAT";
            displayName = "Assistant Heavy AT Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MORTL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MORTL";
            displayName = "Mortar TL Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MOR {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MOR";
            displayName = "Mortar Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_EOD {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_EOD";
            displayName = "Explosive Ordnance Disposal Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_HEP {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_HEP";
            displayName = "Helicopter Pilot Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_HECRW {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_HECRW";
            displayName = "Helicopter Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_VCRW {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_VCRW";
            displayName = "Vehicle Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_VCMD {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_VCMD";
            displayName = "Vehicle Commander Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MED {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MED";
            displayName = "Medic Loadout";
            tooltip = "Medic Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MKS {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_MKS";
            displayName = "Marksman Loadout";
            tooltip = "Marksman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_OFF {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_OFF";
            displayName = "Officer Loadout";
            tooltip = "Officer Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_TWOIC {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_TWOIC";
            displayName = "2IC Loadout";
            tooltip = "Officer Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_RTO {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_RTO";
            displayName = "RATELO Loadout";
            tooltip = "RATELO Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_FAC {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_FAC";
            displayName = "FAC Loadout";
            tooltip = "FAC Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS1 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS1";
            displayName = "Custom Loadout 1";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS2 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS2";
            displayName = "Custom Loadout 2";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS3 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS3";
            displayName = "Custom Loadout 3";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS4 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS4";
            displayName = "Custom Loadout 4";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS5 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_CUS5";
            displayName = "Custom Loadout 5";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
    };
};
class UO_FW_GearSettings_Olsen_Opfor {
    displayName = "Opfor Olsen Gear Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_RFL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_RFL";
            displayName = "Rifleman Loadout";
            tooltip = "Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_RFLAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_RFLAT";
            displayName = "Rifleman AT Loadout";
            tooltip = "Rifleman AT Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AR {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AR";
            displayName = "Automatic Rifleman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_GRN {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_GRN";
            displayName = "Grenadier Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_TL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_TL";
            displayName = "Team Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_SQL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_SQL";
            displayName = "Squad Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AT";
            displayName = "Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AAT";
            displayName = "Assistant Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MG {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MG";
            displayName = "Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AMG {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AMG";
            displayName = "Assistant Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_HAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_HAT";
            displayName = "Heavy Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AHAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_AHAT";
            displayName = "Assistant Heavy AT Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MORTL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MORTL";
            displayName = "Mortar TL Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MOR {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MOR";
            displayName = "Mortar Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_EOD {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_EOD";
            displayName = "Explosive Ordnance Disposal Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_VCRW {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_VCRW";
            displayName = "Vehicle Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_VCMD {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_VCMD";
            displayName = "Vehicle Commander Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MED {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MED";
            displayName = "Medic Loadout";
            tooltip = "Medic Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MKS {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_MKS";
            displayName = "Marksman Loadout";
            tooltip = "Marksman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_OFF {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_OFF";
            displayName = "Officer Loadout";
            tooltip = "Officer Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_TWOIC {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_TWOIC";
            displayName = "2IC Loadout";
            tooltip = "Officer Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_RTO {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_RTO";
            displayName = "RATELO Loadout";
            tooltip = "RATELO Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_FAC {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_FAC";
            displayName = "FAC Loadout";
            tooltip = "FAC Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS1 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS1";
            displayName = "Custom Loadout 1";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS2 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS2";
            displayName = "Custom Loadout 2";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS3 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS3";
            displayName = "Custom Loadout 3";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS4 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS4";
            displayName = "Custom Loadout 4";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS5 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Opfor_CUS5";
            displayName = "Custom Loadout 5";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
