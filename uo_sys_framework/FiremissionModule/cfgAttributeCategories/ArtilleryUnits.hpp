class UO_FW_Artillery
{
    displayName = "Artillery Data Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_ArtilleryEnabled
        {
            property = "UO_FW_ArtilleryEnabled";
            displayName = "Artillery Data";
            tooltip = "Enables Artillery Data";
            control = "CheckboxState";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectVehicle";
        };
        class UO_FW_ArtilleryFireRate
        {
            displayName = "Firerate Modifier";
            tooltip = "Modifier for units firerate. Firerate * modifier. Default 1. Just keep at 1";
            property = "UO_FW_ArtilleryFireRate";
            control = "EditShort";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "1";
        };
        class UO_FW_ArtilleryAccuracy
        {
            displayName = "Accuracy";
            tooltip = "Accuracy of the artillery gun in meters. Default 50";
            property = "UO_FW_ArtilleryAccuracy";
            control = QMGVAR(25To250Step5_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "50";
        };
        class UO_FW_ArtillerySpottingAccuracy
        {
            displayName = "Spotting Round Accuracy";
            tooltip = "Accuracy of spotting rounds in meters. Default 50";
            property = "UO_FW_ArtillerySpottingAccuracy";
            control = QMGVAR(25To250Step5_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "50";
        };
        class UO_FW_ArtilleryAimTime
        {
            displayName = "Aim Time";
            tooltip = "Time needed to calculate on where to aim. Artillery might need longer to traverse the gun (Arma limitations). Default 30";
            property = "UO_FW_ArtilleryAimTime";
            control = QMGVAR(30To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            defaultValue = "30";
            typeName = "NUMBER";
        };
        class UO_FW_ArtilleryCalculationTime
        {
            displayName = "Calculation Time";
            tooltip = "Time needed to calculate after spotting rounds before actuall firemission. Default 30";
            property = "UO_FW_ArtilleryCalculationTime";
            control = QMGVAR(30To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "30";
        };
        class UO_FW_ArtilleryCustomName
        {
            displayName = "Custom Name";
            tooltip = "Custom name for the artillery gun used in the player FO dialog. Only used for displaying a different name. Leave empty for Class Display Name";
            property = "UO_FW_ArtilleryCustomName";
            control = "EditShort";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            typeName = "STRING";
            defaultValue = "''";
        };
        class UO_FW_ArtilleryUnlimitedAmmo
        {
            displayName = "Unlimited Ammo";
            tooltip = "Should artillery have unlimited Ammo. Default false";
            property = "UO_FW_ArtilleryUnlimitedAmmo";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "false";
            typeName = "BOOL";
        };
    };
};
