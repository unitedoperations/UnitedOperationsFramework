class EGVAR(FiremissionVirtual,FiremissionVirtualModule): EGVAR(Core,BaseModule) {
    displayName = "Preplotted Firemission"; // Name displayed in the menu
    // Name of function triggered once conditions are met
    function = QEFUNC(FiremissionVirtual,loadData);
    // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
    functionPriority = 0;
    scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
    isGlobal = 0;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    curatorInfoType = "RscDisplayAttributeModuleNuke";
    canSetArea = 0;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = "\x\UO_FW\addons\Main\CaptureZoneModule\resources\capzonemodule_ca.paa";

    class AttributeValues {
        size2[] = {100,100};
        IsRectangle = 0;
      };

    class Attributes {
        class EGVAR(FiremissionVirtual,PP_Enabled) { 
            property = QEGVAR(FiremissionVirtual,PP_Enabled);
            displayName = "Enabled";
            tooltip = "Check to enable the preplotted firemission";
            control = "CheckBoxState";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(FiremissionVirtual,PP_Fired) { 
            property = QEGVAR(FiremissionVirtual,PP_Fired);
            displayName = "Fired";
            tooltip = "Has this firemission allready been fired";
            control = "CheckBox";
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(FiremissionVirtual,PP_BatteryName) { 
            property = QEGVAR(FiremissionVirtual,PP_BatteryName);
            displayName = "Battery Name";
            tooltip = "Name of the battery which fired the firemission. Needs to be the same as the registered Firemissions";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
            typeName = "STRING";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedAmmo) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedAmmo);
            displayName = "Selected Ammo";
            tooltip = "Classname of the rounds fired. Needs to be the same as in Firemissions";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
            typeName = "STRING";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedGrid) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedGrid);
            displayName = "Grid";
            tooltip = "Grid which was planned";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
            typeName = "STRING";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedMils) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedMils);
            displayName = "Mils";
            tooltip = "Mils which were planned";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedRounds) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedRounds);
            displayName = "Rounds";
            tooltip = "Ammount of rounds planned";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedDistance) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedDistance);
            displayName = "Distance";
            tooltip = "Distance from grid at mils planned";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedGuns) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedGuns);
            displayName = "Guns";
            tooltip = "How many guns will fire";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedDispersion) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedDispersion);
            displayName = "Dispersion";
            tooltip = "At what Dispersion will be fired";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedReloadtime) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedReloadtime);
            displayName = "Reloadtime";
            tooltip = "Reloadtime which was selected";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedCalculationtime) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedCalculationtime);
            displayName = "Calculationtime";
            tooltip = "Calculationtime which was selected";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedFlightime) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedFlightime);
            displayName = "Flightime";
            tooltip = "Flightime which was selected";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,PP_SelectedDelayTime) { 
            property = QEGVAR(FiremissionVirtual,PP_SelectedDelayTime);
            displayName = "DelayTime";
            tooltip = "DelayTime which were selected";
            control = "Edit";
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,Side) { 
            displayName = "Side"; 
            tooltip = "From which side the firemission was fired";
            control = "Combo";
            typeName = "NUMBER";
            property = QEGVAR(FiremissionVirtual,Side);
            expression = MODULE_EXPRESSION;
            validate = "none";
            class values {
                class West {name = "West"; value = 0; default = 0;};
                class East {name = "East"; value = 1;};
                class Ind {name = "Independent"; value = 2;};
                class Civ {name = "Civilian"; value = 3;};
            };
            defaultValue = "0";
        };
        
    };
};
//["NAME",fired,["_obs","_bat","_selectedAmmo","_selectedGrid","_selectedMils","_selectedDist","_selectedRnds","_guns","_disp","_reloadTime","_calcTime","_flightTime","_delayTime","_side"]
//_obs will be null
#define FMV_PPATTR(ARTNUMBER)\
