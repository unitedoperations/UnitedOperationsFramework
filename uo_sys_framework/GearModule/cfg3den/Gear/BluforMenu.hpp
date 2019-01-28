//class UO_FW_GearSettings_Presets_Blufor {
//    displayName = "Blufor Gear Presets";
//    collapsed = 0;
//    class Attributes {
//        class UO_FW_GearSettings_ACE_Arsenal_GearPresets_BLUFOR {
//            property = "UO_FW_GearSettings_ACE_Arsenal_GearPresets_BLUFOR";
//            displayName = "Gear Presets";
//            tooltip = "";
//            control = "UO_FW_Gear_ACE_Arsenal_PresetsCombo";
//            typeName = "STRING";
//            expression = UO_FW_SCENARIO_EXPRESSION;
//            defaultValue = "'None'";
//        };
//    };
//};

class UO_FW_GearSettings_ACE_Arsenal_Blufor {
    displayName = "Blufor ACE Gear Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFL";
            displayName = "Rifleman Loadout";
            tooltip = "Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFLAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RFLAT";
            displayName = "Rifleman AT Loadout";
            tooltip = "Rifleman AT Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AR {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AR";
            displayName = "Automatic Rifleman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_GRN {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_GRN";
            displayName = "Grenadier Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            typeName = "STRING";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TL";
            displayName = "Team Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_SQL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_SQL";
            displayName = "Squad Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AT";
            displayName = "Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AAT";
            displayName = "Assistant Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MG {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MG";
            displayName = "Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AMG {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AMG";
            displayName = "Assistant Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_HAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_HAT";
            displayName = "Heavy Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AHAT {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_AHAT";
            displayName = "Assistant Heavy AT Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MORTL {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MORTL";
            displayName = "Mortar TL Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MOR {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MOR";
            displayName = "Mortar Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_EOD {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_EOD";
            displayName = "Explosive Ordnance Disposal Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_HEP {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_HEP";
            displayName = "Helicopter Pilot Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_HECRW {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_HECRW";
            displayName = "Helicopter Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCRW {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCRW";
            displayName = "Vehicle Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCMD {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_VCMD";
            displayName = "Vehicle Commander Loadout";
            tooltip = "Automatic Rifleman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MED {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MED";
            displayName = "Medic Loadout";
            tooltip = "Medic Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MKS {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_MKS";
            displayName = "Marksman Loadout";
            tooltip = "Marksman Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_OFF {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_OFF";
            displayName = "Officer Loadout";
            tooltip = "Officer Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TWOIC {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_TWOIC";
            displayName = "2IC Loadout";
            tooltip = "Officer Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RTO {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_RTO";
            displayName = "RATELO Loadout";
            tooltip = "RATELO Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_FAC {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_FAC";
            displayName = "FAC Loadout";
            tooltip = "FAC Loadout saved in ACE Arsenal mission loadouts";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS1 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS1";
            displayName = "Custom Loadout 1";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS2 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS2";
            displayName = "Custom Loadout 2";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS3 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS3";
            displayName = "Custom Loadout 3";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS4 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS4";
            displayName = "Custom Loadout 4";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS5 {
            property = "UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_CUS5";
            displayName = "Custom Loadout 5";
            tooltip = "Custom Loadout Slot";
            control = "UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
    };
};
class UO_FW_GearSettings_Olsen_Blufor {
    displayName = "Blufor Olsen Gear Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_RFL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_RFL";
            displayName = "Rifleman Loadout";
            tooltip = "Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_RFLAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_RFLAT";
            displayName = "Rifleman AT Loadout";
            tooltip = "Rifleman AT Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AR {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AR";
            displayName = "Automatic Rifleman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_GRN {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_GRN";
            displayName = "Grenadier Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_TL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_TL";
            displayName = "Team Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_SQL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_SQL";
            displayName = "Squad Leader Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AT";
            displayName = "Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AAT";
            displayName = "Assistant Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MG {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MG";
            displayName = "Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AMG {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AMG";
            displayName = "Assistant Machinegunner Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_HAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_HAT";
            displayName = "Heavy Anti Tank Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AHAT {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_AHAT";
            displayName = "Assistant Heavy AT Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MORTL {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MORTL";
            displayName = "Mortar TL Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MOR {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MOR";
            displayName = "Mortar Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_EOD {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_EOD";
            displayName = "Explosive Ordnance Disposal Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_VCRW {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_VCRW";
            displayName = "Vehicle Crewman Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_VCMD {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_VCMD";
            displayName = "Vehicle Commander Loadout";
            tooltip = "Automatic Rifleman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MED {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MED";
            displayName = "Medic Loadout";
            tooltip = "Medic Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MKS {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_MKS";
            displayName = "Marksman Loadout";
            tooltip = "Marksman Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_OFF {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_OFF";
            displayName = "Officer Loadout";
            tooltip = "Officer Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_TWOIC {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_TWOIC";
            displayName = "2IC Loadout";
            tooltip = "Officer Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_RTO {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_RTO";
            displayName = "RATELO Loadout";
            tooltip = "RATELO Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_FAC {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_FAC";
            displayName = "FAC Loadout";
            tooltip = "FAC Loadout saved in Olsen mission loadouts";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS1 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS1";
            displayName = "Custom Loadout 1";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS2 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS2";
            displayName = "Custom Loadout 2";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS3 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS3";
            displayName = "Custom Loadout 3";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS4 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS4";
            displayName = "Custom Loadout 4";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS5 {
            property = "UO_FW_GearSettings_Olsen_LoadoutType_Blufor_CUS5";
            displayName = "Custom Loadout 5";
            tooltip = "Custom Loadout Slot";
            control = "Edit";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
