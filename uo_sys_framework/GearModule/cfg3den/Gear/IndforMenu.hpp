class EGVAR(Gear,Presets_Indfor) {
    displayName = "Indfor Gear Presets";
    collapsed = 0;
    class Attributes {
        class EGVAR(Gear,ACE_Arsenal_GearPresets_Indfor) {
            property = QEGVAR(Gear,ACE_Arsenal_GearPresets_Indfor);
            displayName = "Gear Presets";
            tooltip = "";
            control = "UO_FW_Gear_PresetsCombo_Indfor";
            typeName = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'None'";
        };
    };
};

class EGVAR(Gear,ACE_Arsenal_Indfor) {
    displayName = "Indfor ACE Gear Settings";
    collapsed = 1;
    class Attributes {
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,SQL);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,TL);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,RFL);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,RFLAT);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,AR);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,GRN);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,VCRW);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,VCMD);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,OFF);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,TWOIC);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,MED);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,AT);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,AAT);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,MG);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,AMG);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,MKS);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,RTO);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,FAC);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,FO);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,ENG);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,EOD);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,HAT);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,AHAT);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,MORTL);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,MOR);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,APLT);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,ACRW);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,CUS1);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,CUS2);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,CUS3);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,CUS4);
        UO_FW_GEAR_TYPECONFIG_ACEAR(Indfor,CUS5);
    };
};
class EGVAR(Gear,Olsen_Indfor) {
    displayName = "Indfor Olsen Gear Settings";
    collapsed = 1;
    class Attributes {
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,SQL);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,TL);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,RFL);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,RFLAT);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,AR);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,GRN);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,VCRW);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,VCMD);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,OFF);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,TWOIC);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,MED);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,AT);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,AAT);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,MG);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,AMG);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,MKS);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,RTO);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,FAC);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,FO);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,ENG);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,EOD);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,HAT);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,AHAT);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,MORTL);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,MOR);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,APLT);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,ACRW);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,CUS1);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,CUS2);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,CUS3);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,CUS4);
        UO_FW_GEAR_TYPECONFIG_OLSEN(Indfor,CUS5);
    };
};
