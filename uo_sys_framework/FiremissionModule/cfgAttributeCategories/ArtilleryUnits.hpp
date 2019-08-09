#include "\x\UO_FW\addons\Main\script_macros.hpp"

class EGVAR(Firemission,Artillery)
{
    displayName = "Artillery Data Settings";
    collapsed = 1;
    class Attributes
    {
        class EGVAR(Firemission,ArtilleryEnabled)
        {
            property = QEGVAR(Firemission,ArtilleryEnabled);
            displayName = "Artillery Data";
            tooltip = "Enables Artillery Data";
            control = "CheckboxState";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
            condition = "objectVehicle";
        };
        class EGVAR(Firemission,ArtilleryFireRate)
        {
            displayName = "Firerate Modifier";
            tooltip = "Modifier for units firerate. Firerate * modifier. Default 1. Just keep at 1";
            property = QEGVAR(Firemission,ArtilleryFireRate);
            control = "EditShort";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "1";
        };
        class EGVAR(Firemission,ArtilleryAccuracy)
        {
            displayName = "Accuracy";
            tooltip = "Accuracy of the artillery gun in meters. Default 50";
            property = QEGVAR(Firemission,ArtilleryAccuracy);
            control = QMGVAR(25To250Step5_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "50";
        };
        class EGVAR(Firemission,ArtillerySpottingAccuracy)
        {
            displayName = "Spotting Round Accuracy";
            tooltip = "Accuracy of spotting rounds in meters. Default 50";
            property = QEGVAR(Firemission,ArtillerySpottingAccuracy);
            control = QMGVAR(25To250Step5_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "50";
        };
        class EGVAR(Firemission,ArtilleryAimTime)
        {
            displayName = "Aim Time";
            tooltip = "Time needed to calculate on where to aim. Artillery might need longer to traverse the gun (Arma limitations). Default 5";
            property = QEGVAR(Firemission,ArtilleryAimTime);
            control = QMGVAR(5To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            defaultValue = "5";
            typeName = "NUMBER";
        };
        class EGVAR(Firemission,ArtilleryCalculationTime)
        {
            displayName = "Calculation Time";
            tooltip = "Time needed to calculate after spotting rounds before actuall firemission. Default 5";
            property = QEGVAR(Firemission,ArtilleryCalculationTime);
            control = QMGVAR(5To120Step1_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "number";
            typeName = "NUMBER";
            defaultValue = "5";
        };
        class EGVAR(Firemission,ArtilleryCustomName)
        {
            displayName = "Custom Name";
            tooltip = "Custom name for the artillery gun used in the player FO dialog. Only used for displaying a different name. Leave empty for Class Display Name";
            property = QEGVAR(Firemission,ArtilleryCustomName);
            control = "EditShort";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            typeName = "STRING";
            defaultValue = "''";
        };
        class EGVAR(Firemission,ArtilleryUnlimitedAmmo)
        {
            displayName = "Unlimited Ammo";
            tooltip = "Should artillery have unlimited Ammo. Default false";
            property = QEGVAR(Firemission,ArtilleryUnlimitedAmmo);
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "false";
            typeName = "BOOL";
        };
    };
};
